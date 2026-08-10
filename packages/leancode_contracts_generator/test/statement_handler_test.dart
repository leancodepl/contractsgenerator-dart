import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:leancode_contracts_generator/leancode_contracts_generator.dart';
import 'package:leancode_contracts_generator/src/attributes/attribute_creator.dart';
import 'package:leancode_contracts_generator/src/errors/error_creator.dart';
import 'package:leancode_contracts_generator/src/generator_database.dart';
import 'package:leancode_contracts_generator/src/json_converters/json_converters.dart';
import 'package:leancode_contracts_generator/src/proto/contracts.pb.dart';
import 'package:leancode_contracts_generator/src/statements/command_handler.dart';
import 'package:leancode_contracts_generator/src/statements/dto_handler.dart';
import 'package:leancode_contracts_generator/src/statements/operation_handler.dart';
import 'package:leancode_contracts_generator/src/statements/query_handler.dart';
import 'package:leancode_contracts_generator/src/statements/topic_handler.dart';
import 'package:leancode_contracts_generator/src/types/generic_type_handler.dart';
import 'package:leancode_contracts_generator/src/types/internal_type_handler.dart';
import 'package:leancode_contracts_generator/src/types/known_type_handler.dart';
import 'package:leancode_contracts_generator/src/types/type_creator.dart';
import 'package:leancode_contracts_generator/src/values/value_creator.dart';
import 'package:test/test.dart';

final _emitter = DartEmitter();

TypeRef _known(KnownType type) => TypeRef(known: TypeRef_Known(type: type));

TypeDescriptor _descriptor({
  Iterable<TypeRef> extends_ = const [],
  Iterable<GenericParameter> genericParameters = const [],
}) => TypeDescriptor(
  extends_1: extends_,
  genericParameters: genericParameters,
  properties: [
    PropertyRef(name: 'Id', type: _known(KnownType.String)),
    PropertyRef(name: 'Count', type: _known(KnownType.Int32)),
  ],
);

String _build(Statement statement, {Iterable<Statement> others = const []}) {
  final db = GeneratorDatabase(
    ContractsGeneratorConfig(input: GeneratorScript.project([])),
    Export(statements: [statement, ...others]),
  );

  final typeCreator = TypeCreator([
    const KnownTypeHandler(),
    const GenericTypeHandler(),
    InternalTypeHandler(db),
  ]);
  const valueCreator = ValueCreator();
  const attributeCreator = AttributeCreator(valueCreator);
  final jsonConverters = JsonConverters();

  final handlers = [
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
      const ErrorCreator(),
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
  ];

  final handler = handlers.firstWhere((h) => h.canHandle(statement));

  return DartFormatter(
    languageVersion: DartFormatter.latestLanguageVersion,
  ).format(handler.build(statement).accept(_emitter).toString());
}

void main() {
  group('createBase', () {
    test('generates a const constructor for DTOs', () {
      final code = _build(
        Statement(
          name: 'A.Dto',
          dto: Statement_DTO(typeDescriptor: _descriptor()),
        ),
      );

      expect(
        code,
        contains('const Dto({required this.id, required this.count})'),
      );
    });

    test('generates a const constructor for queries', () {
      final code = _build(
        Statement(
          name: 'A.SomeQuery',
          query: Statement_Query(
            typeDescriptor: _descriptor(),
            returnType: _known(KnownType.Int32),
          ),
        ),
      );

      expect(
        code,
        contains('const SomeQuery({required this.id, required this.count})'),
      );
    });

    test('generates a const constructor for commands', () {
      final code = _build(
        Statement(
          name: 'A.SomeCommand',
          command: Statement_Command(typeDescriptor: _descriptor()),
        ),
      );

      expect(
        code,
        contains('const SomeCommand({required this.id, required this.count})'),
      );
    });

    test('generates a const constructor for operations', () {
      final code = _build(
        Statement(
          name: 'A.SomeOperation',
          operation: Statement_Operation(
            typeDescriptor: _descriptor(),
            returnType: _known(KnownType.Int32),
          ),
        ),
      );

      expect(
        code,
        contains(
          'const SomeOperation({required this.id, required this.count})',
        ),
      );
    });

    test('generates a const constructor for topics', () {
      final code = _build(
        Statement(
          name: 'A.SomeTopic',
          topic: Statement_Topic(
            typeDescriptor: _descriptor(),
            notifications: [
              NotificationTypeRef(
                tag: 'A.Notification',
                type: TypeRef(
                  internal: TypeRef_Internal(name: 'A.Notification'),
                ),
              ),
            ],
          ),
        ),
        others: [
          Statement(
            name: 'A.Notification',
            dto: Statement_DTO(typeDescriptor: TypeDescriptor()),
          ),
        ],
      );

      expect(
        code,
        contains('const SomeTopic({required this.id, required this.count})'),
      );
    });

    test('generates a const constructor for generic DTOs', () {
      final code = _build(
        Statement(
          name: 'A.Box',
          dto: Statement_DTO(
            typeDescriptor: _descriptor(
              genericParameters: [GenericParameter(name: 'T')],
            ),
          ),
        ),
      );

      expect(
        code,
        contains('const Box({required this.id, required this.count})'),
      );
    });

    test('generates a const constructor for abstract protocol DTOs', () {
      final code = _build(
        Statement(
          name: 'A.Base',
          dto: Statement_DTO(
            typeDescriptor: _descriptor(extends_: [_known(KnownType.Command)]),
          ),
        ),
      );

      expect(code, contains('abstract class Base'));
      expect(
        code,
        contains('const Base({required this.id, required this.count})'),
      );
    });
  });
}
