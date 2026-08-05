import 'dart:io';

import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:leancode_contracts_generator/src/attributes/attribute_creator.dart';
import 'package:leancode_contracts_generator/src/contracts_generator_config.dart';
import 'package:leancode_contracts_generator/src/errors/error_creator.dart';
import 'package:leancode_contracts_generator/src/generator_database.dart';
import 'package:leancode_contracts_generator/src/json_converters/json_converters.dart';
import 'package:leancode_contracts_generator/src/statements/command_handler.dart';
import 'package:leancode_contracts_generator/src/statements/dto_handler.dart';
import 'package:leancode_contracts_generator/src/statements/enum_handler.dart';
import 'package:leancode_contracts_generator/src/statements/operation_handler.dart';
import 'package:leancode_contracts_generator/src/statements/query_handler.dart';
import 'package:leancode_contracts_generator/src/statements/statement_creator.dart';
import 'package:leancode_contracts_generator/src/statements/topic_handler.dart';
import 'package:leancode_contracts_generator/src/types/generic_type_handler.dart';
import 'package:leancode_contracts_generator/src/types/internal_type_handler.dart';
import 'package:leancode_contracts_generator/src/types/known_type_handler.dart';
import 'package:leancode_contracts_generator/src/types/type_creator.dart';
import 'package:leancode_contracts_generator/src/utils/verbose_log.dart';
import 'package:leancode_contracts_generator/src/values/value_creator.dart';
import 'package:path/path.dart' as p;

class ContractsGenerator {
  const ContractsGenerator(this.config, {this.verbose = false});

  final ContractsGeneratorConfig config;
  final bool verbose;

  static final emitter = DartEmitter();
  static const header = '''
    // GENERATED CODE - DO NOT MODIFY BY HAND
    // ignore_for_file: type=lint
    ''';

  /// generates `code_builder` structures that can still be modified
  Future<Library> generate() async {
    final doneDb = verboseLog(message: 'Analysing contracts', verbose: verbose);
    final db = await GeneratorDatabase.fromConfig(config);
    doneDb();

    final doneGen = verboseLog(
      message: 'Generating dart code',
      verbose: verbose,
    );
    final jsonConverters = JsonConverters();
    final typeCreator = TypeCreator([
      const KnownTypeHandler(),
      const GenericTypeHandler(),
      InternalTypeHandler(db),
    ]);
    const valueCreator = ValueCreator();
    const errorCreator = ErrorCreator();
    const attributeCreator = AttributeCreator(valueCreator);
    final statementCreator = StatementCreator([
      DtoHandler(typeCreator, valueCreator, attributeCreator, db),
      QueryHandler(
        typeCreator,
        valueCreator,
        attributeCreator,
        jsonConverters,
        db,
      ),
      CommandHandler(
        typeCreator,
        valueCreator,
        attributeCreator,
        db,
        errorCreator,
      ),
      OperationHandler(
        typeCreator,
        valueCreator,
        attributeCreator,
        jsonConverters,
        db,
      ),
      TopicHandler(
        typeCreator,
        valueCreator,
        attributeCreator,
        jsonConverters,
        db,
      ),
      EnumHandler(typeCreator, valueCreator, attributeCreator, db),
    ]);

    final body = [
      for (final statement in db.statements)
        if (db.shouldInclude(statement.name) && !db.isAttribute(statement))
          statementCreator.create(statement),
    ];

    // TODO: knownGroups?
    // TODO: projectName?

    final library = Library(
      (l) => l
        ..body.addAll([
          const Code(header),
          Library(
            (l) => l
              ..body.addAll([
                Code(config.directives),
                if (db.usesJsonSerialization)
                  Code("part '${config.name}.g.dart';"),
                Code('\n\n${config.extra}\n\n'),
                ...body,
              ])
              ..directives.addAll([
                Directive.import(
                  'package:leancode_contracts/leancode_contracts.dart',
                ),
                if (db.usesTopics)
                  Directive.import('package:leancode_pipe/leancode_pipe.dart'),
              ]),
          ),
        ]),
    );
    doneGen();

    return library;
  }

  /// Contracts dart code without generated `json_serializable` file
  Future<String> toCode() async =>
      (await generate()).accept(emitter).toString();

  /// Writes formatted contracts into the file system
  Future<void> writeAll() async {
    final contractsPath = p.join(config.output.path, '${config.name}.dart');

    final code = await toCode();

    final doneWriting = verboseLog(
      message: 'Writing dart code to $contractsPath',
      verbose: verbose,
    );
    await config.output.create(recursive: true);
    File(contractsPath).writeAsStringSync(
      DartFormatter(
        languageVersion: DartFormatter.latestLanguageVersion,
      ).format(code),
    );
    doneWriting();
  }
}
