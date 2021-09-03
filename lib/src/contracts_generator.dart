import 'dart:convert';
import 'dart:io';

import 'package:build/build.dart';
import 'package:build_resolvers/build_resolvers.dart';
import 'package:build_runner_core/build_runner_core.dart';
import 'package:build_test/build_test.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:json_serializable/builder.dart';
import 'package:path/path.dart' as p;

import 'attributes/attribute_creator.dart';
import 'contracts_generator_config.dart';
import 'errors/error_creator.dart';
import 'generator_database.dart';
import 'statements/command_handler.dart';
import 'statements/dto_handler.dart';
import 'statements/enum_handler.dart';
import 'statements/query_handler.dart';
import 'statements/statement_creator.dart';
import 'time_class.dart';
import 'types/generic_type_handler.dart';
import 'types/internal_type_handler.dart';
import 'types/known_type_handler.dart';
import 'types/type_creator.dart';
import 'values/value_creator.dart';

class ContractsGenerator {
  const ContractsGenerator(this.config);

  final ContractsGeneratorConfig config;

  static final emitter = DartEmitter();

  /// generates `code_builder` structures that can still be modified
  Future<Library> generate() async {
    final db = await GeneratorDatabase.fromConfig(config);

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
      QueryHandler(typeCreator, valueCreator, attributeCreator, db),
      CommandHandler(
        typeCreator,
        valueCreator,
        attributeCreator,
        db,
        errorCreator,
      ),
      EnumHandler(typeCreator, valueCreator, attributeCreator, db),
    ]);

    final body = [
      for (final statement in db.statements)
        if (db.shouldInclude(statement.name) && !db.isAttribute(statement))
          statementCreator.create(statement)
    ];

    // TODO: knownGroups?
    // TODO: projectName?

    return Library(
      (l) => l
        ..body.addAll([
          Code(config.directives),
          Code("part '${config.name}.g.dart';"),
          Code('\n\n${config.extra}\n\n'),
          // hack to run code in the top level
          const Code('final _ = EquatableConfig.stringify = true;'),
          timeClass,
          ...body,
        ])
        ..directives.addAll([
          Directive.import('package:cqrs/contracts.dart'),
          Directive.import('package:json_annotation/json_annotation.dart'),
          Directive.import('package:equatable/equatable.dart'),
        ]),
    );
  }

  /// Contracts dart code without generated `json_serializable` file
  Future<String> toCode() async =>
      (await generate()).accept(emitter).toString();

  /// Writes formatted contracts and generated build files into the file system
  Future<void> writeAll() async {
    final contractsPath = p.join(
      p.relative(config.output.path),
      '${config.name}.dart',
    );

    await config.output.create(recursive: true);
    await File(contractsPath).writeAsString(
      DartFormatter().format(await toCode()),
    );

    final packageGraph = await PackageGraph.forThisPackage();
    final js = jsonSerializable(BuilderOptions.empty);
    final f = AssetId(packageGraph.root.name, contractsPath);

    final env = IOEnvironment(packageGraph);
    final writer = InMemoryAssetWriter();

    final res = AnalyzerResolvers();

    await runBuilder(js, [f], env.reader, writer, res);

    final jsonSerializablePathOld = p.join(
      p.relative(config.output.path),
      '${config.name}.json_serializable.g.part',
    );
    final jsonSerializablePath = p.join(
      config.output.path,
      '${config.name}.g.dart',
    );
    final generated = writer.assets[AssetId(
      packageGraph.root.name,
      jsonSerializablePathOld,
    )];
    await File(jsonSerializablePath).writeAsString('''
// GENERATED CODE - DO NOT MODIFY BY HAND

part of '${config.name}.dart';

${utf8.decode(generated ?? [])}''');
  }
}
