import 'package:contracts_generator/contracts_generator.dart';
import 'package:contracts_generator/src/contracts_generator_config.dart';
import 'package:contracts_generator/src/generator_database.dart';
import 'package:contracts_generator/src/generator_script.dart';
import 'package:contracts_generator/src/proto/contracts.pb.dart';
import 'package:test/test.dart';

void main() {
  GeneratorDatabase makeDb({
    RegExp? include,
    Set<String> statements = const {},
    List<Statement>? rawStatements,
  }) =>
      GeneratorDatabase(
        ContractsGeneratorConfig(
          input: GeneratorScript.project([]),
          include: include,
        ),
        Export(
          statements:
              rawStatements ?? statements.map((e) => Statement(name: e)),
        ),
      );

  group('generator database', () {
    group('shouldInclude', () {
      test('classifies correctly', () {
        final db = makeDb(include: RegExp(r'^Some\.Namespace?'));

        expect(db.shouldInclude('Some.Namespace'), true);
        expect(db.shouldInclude('Some.Namespac'), true);
        expect(db.shouldInclude('Some.Namespac.More'), true);
        expect(db.shouldInclude('More.Some.Namespace'), false);
        expect(db.shouldInclude('Some.Wrong'), false);
      });
    });

    group('find', () {
      test('finds correctly', () {
        final db = makeDb(
          statements: {'Some.Namespace', 'Some.Namespace.More'},
        );

        expect(db.find('Some.Namespace'), isNotNull);
        expect(db.find('Some.Namespace.More'), isNotNull);
        expect(db.find('Some.Namespace.'), null);
        expect(db.find('.Some.Namespace'), null);
      });
    });

    group('resolveName', () {
      test('resolves correctly', () {
        final db = makeDb(
          statements: {
            'One.One.One',
            'One.Two.One',
            'Two.Two.One',
            'Two.Two.Two',
          },
        );

        expect(db.resolveName('One.One.One'), 'OneOne');
        expect(db.resolveName('One.Two.One'), 'OneTwoOne');
        expect(db.resolveName('Two.Two.One'), 'TwoTwoOne');
        expect(db.resolveName('Two.Two.Two'), 'Two');
      });

      test('detects unknown names', () {
        final db = makeDb(
          include: RegExp('^(One|Three)'),
          statements: {
            'One.One',
            'Three.One',
            'One.Two',
            'Two.One',
            'Two.Two',
          },
        );

        for (final name in ['Two.One', 'One', 'Two.Two', 'Two.One']) {
          expect(
            () => db.resolveName(name),
            throwsA(
              isA<ContractsGeneratorException>().having(
                (err) => err.message,
                'message',
                contains(name),
              ),
            ),
          );
        }
      });
    });

    group('isCqrs', () {
      TypeRef typeRefOf(String name) =>
          TypeRef(internal: TypeRef_Internal(name: name));

      test('classifies correctly', () {
        final cqrsType = TypeRef(known: TypeRef_Known(type: KnownType.Command));
        final extending = Statement(
          name: 'extending',
          dto: Statement_DTO(
            typeDescriptor: TypeDescriptor(extends_1: [cqrsType]),
          ),
        );
        final secondIndirection = Statement(
          name: 'secondIndirection',
          dto: Statement_DTO(
            typeDescriptor: TypeDescriptor(extends_1: [typeRefOf('extending')]),
          ),
        );
        final thirdIndirection = Statement(
          name: 'thirdIndirection',
          dto: Statement_DTO(
            typeDescriptor: TypeDescriptor(
              extends_1: [typeRefOf('secondIndirection')],
            ),
          ),
        );

        final differentKnownTypeKind = TypeRef(
          known: TypeRef_Known(type: KnownType.DateTime),
        );
        final genericType = TypeRef(
          generic: TypeRef_Generic(name: 'T'),
        );
        final nonCqrsStatement = Statement(
          name: 'nonCqrsStatement',
          dto: Statement_DTO(),
        );

        final db = makeDb(
          rawStatements: [
            extending,
            secondIndirection,
            thirdIndirection,
            nonCqrsStatement,
          ],
        );

        expect(db.isCqrs(cqrsType), true);
        expect(db.isCqrs(typeRefOf('extending')), true);
        expect(db.isCqrs(typeRefOf('secondIndirection')), true);
        expect(db.isCqrs(typeRefOf('thirdIndirection')), true);
        expect(db.isCqrs(differentKnownTypeKind), false);
        expect(db.isCqrs(genericType), false);
        expect(db.isCqrs(typeRefOf('nonCqrsStatement')), false);
      });
    });
  });
}
