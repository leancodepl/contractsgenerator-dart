import 'package:contracts_generator/contracts_generator.dart';
import 'package:contracts_generator/src/contracts_generator_config.dart';
import 'package:contracts_generator/src/generator_database.dart';
import 'package:contracts_generator/src/generator_script.dart';
import 'package:contracts_generator/src/proto/contracts.pb.dart';
import 'package:test/test.dart';

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
        statements: rawStatements ?? statements.map((e) => Statement(name: e)),
      ),
    );

TypeRef typeRefOf(String name) =>
    TypeRef(internal: TypeRef_Internal(name: name), nullable: true);

void main() {
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

    group('allPropertiesOf', () {
      test('gets one level deep', () {
        final type = TypeRef(
          known: TypeRef_Known(type: KnownType.Command),
          nullable: true,
        );
        final properties = [
          PropertyRef(name: 'prop1', type: type, comment: ''),
          PropertyRef(name: 'prop2', type: type, comment: ''),
        ];
        final simple = Statement(
          name: 'simple',
          dto: Statement_DTO(
            typeDescriptor: TypeDescriptor(properties: properties),
          ),
        );

        final db = makeDb(
          rawStatements: [simple],
        );

        expect(db.allPropertiesOf(simple), properties);
      });

      test('gets from linear inheritance', () {
        final type = TypeRef(
          known: TypeRef_Known(type: KnownType.Command),
          nullable: true,
        );
        final properties1 = [
          PropertyRef(name: 'prop1', type: type, comment: ''),
          PropertyRef(name: 'prop2', type: type, comment: ''),
        ];
        final simple1 = Statement(
          name: 'simple1',
          dto: Statement_DTO(
            typeDescriptor: TypeDescriptor(
              properties: properties1,
              extends_1: [typeRefOf('simple2')],
            ),
          ),
        );
        final properties2 = [
          PropertyRef(name: 'prop3', type: type, comment: ''),
          PropertyRef(name: 'prop4', type: type, comment: ''),
        ];
        final simple2 = Statement(
          name: 'simple2',
          dto: Statement_DTO(
            typeDescriptor: TypeDescriptor(
              properties: properties2,
              extends_1: [typeRefOf('simple3')],
            ),
          ),
        );
        final properties3 = [
          PropertyRef(name: 'prop5', type: type, comment: ''),
          PropertyRef(name: 'prop6', type: type, comment: ''),
        ];
        final simple3 = Statement(
          name: 'simple3',
          dto: Statement_DTO(
            typeDescriptor: TypeDescriptor(properties: properties3),
          ),
        );

        final db = makeDb(
          rawStatements: [
            simple1,
            simple2,
            simple3,
          ],
        );

        expect(
          db.allPropertiesOf(simple1),
          properties3 + properties2 + properties1,
        );
        expect(db.allPropertiesOf(simple2), properties3 + properties2);
        expect(db.allPropertiesOf(simple3), properties3);
      });

      test('gets from multi inheritance', () {
        final type = TypeRef(
          known: TypeRef_Known(type: KnownType.Command),
          nullable: true,
        );
        final properties1 = [
          PropertyRef(name: 'prop1', type: type, comment: ''),
          PropertyRef(name: 'prop2', type: type, comment: ''),
        ];
        final simple1 = Statement(
          name: 'simple1',
          dto: Statement_DTO(
            typeDescriptor: TypeDescriptor(
              properties: properties1,
              extends_1: [typeRefOf('simple2'), typeRefOf('simple3')],
            ),
          ),
        );
        final properties2 = [
          PropertyRef(name: 'prop3', type: type, comment: ''),
          PropertyRef(name: 'prop4', type: type, comment: ''),
        ];
        final simple2 = Statement(
          name: 'simple2',
          dto: Statement_DTO(
            typeDescriptor: TypeDescriptor(properties: properties2),
          ),
        );
        final properties3 = [
          PropertyRef(name: 'prop5', type: type, comment: ''),
          PropertyRef(name: 'prop6', type: type, comment: ''),
        ];
        final simple3 = Statement(
          name: 'simple3',
          dto: Statement_DTO(
            typeDescriptor: TypeDescriptor(properties: properties3),
          ),
        );

        final db = makeDb(
          rawStatements: [
            simple1,
            simple2,
            simple3,
          ],
        );

        expect(
          db.allPropertiesOf(simple1),
          properties2 + properties3 + properties1,
        );
        expect(db.allPropertiesOf(simple2), properties2);
        expect(db.allPropertiesOf(simple3), properties3);
      });

      test('resolves generics', () {
        final a = Statement(
          name: 'A',
          dto: Statement_DTO(
            typeDescriptor: TypeDescriptor(
              genericParameters: [GenericParameter(name: 'T')],
              properties: [
                PropertyRef(
                  name: 'a',
                  type: TypeRef(
                    nullable: true,
                    known: TypeRef_Known(
                      type: KnownType.Map,
                      arguments: [
                        TypeRef(
                          nullable: true,
                          generic: TypeRef_Generic(name: 'T'),
                        ),
                        TypeRef(
                          nullable: true,
                          known: TypeRef_Known(
                            type: KnownType.Array,
                            arguments: [
                              TypeRef(
                                nullable: true,
                                generic: TypeRef_Generic(name: 'T'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  comment: '',
                ),
                PropertyRef(
                  name: 'b',
                  type: TypeRef(
                    nullable: true,
                    generic: TypeRef_Generic(name: 'T'),
                  ),
                  comment: '',
                ),
              ],
            ),
          ),
        );
        final b = Statement(
          name: 'B',
          dto: Statement_DTO(
            typeDescriptor: TypeDescriptor(
              genericParameters: [GenericParameter(name: 'T')],
              extends_1: [
                TypeRef(
                  internal: TypeRef_Internal(
                    name: 'A',
                    arguments: [
                      TypeRef(
                        nullable: true,
                        known: TypeRef_Known(
                          type: KnownType.Array,
                          arguments: [
                            TypeRef(
                              nullable: true,
                              generic: TypeRef_Generic(name: 'T'),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
              properties: [
                PropertyRef(
                  name: 'b',
                  type: TypeRef(
                    nullable: true,
                    known: TypeRef_Known(
                      type: KnownType.Array,
                      arguments: [
                        TypeRef(
                          nullable: true,
                          generic: TypeRef_Generic(name: 'T'),
                        )
                      ],
                    ),
                  ),
                  comment: '',
                ),
              ],
            ),
          ),
        );
        final c = Statement(
          name: 'C',
          dto: Statement_DTO(
            typeDescriptor: TypeDescriptor(
              genericParameters: [
                GenericParameter(name: 'T'),
                GenericParameter(name: 'U'),
              ],
              properties: [
                PropertyRef(
                  name: 'c',
                  type: TypeRef(
                    nullable: true,
                    generic: TypeRef_Generic(name: 'T'),
                  ),
                  comment: '',
                ),
                PropertyRef(
                  name: 'd',
                  type: TypeRef(
                    nullable: true,
                    generic: TypeRef_Generic(name: 'U'),
                  ),
                  comment: '',
                ),
              ],
            ),
          ),
        );
        final dto = Statement(
          name: 'DTO',
          dto: Statement_DTO(
            typeDescriptor: TypeDescriptor(
              genericParameters: [GenericParameter(name: 'T')],
              extends_1: [
                TypeRef(
                  nullable: true,
                  internal: TypeRef_Internal(
                    name: 'B',
                    arguments: [
                      TypeRef(
                        nullable: true,
                        known: TypeRef_Known(type: KnownType.Float64),
                      ),
                    ],
                  ),
                ),
                TypeRef(
                  nullable: true,
                  internal: TypeRef_Internal(
                    name: 'C',
                    arguments: [
                      TypeRef(
                        nullable: true,
                        generic: TypeRef_Generic(name: 'T'),
                      ),
                      TypeRef(
                        nullable: true,
                        known: TypeRef_Known(type: KnownType.String),
                      ),
                    ],
                  ),
                ),
              ],
              properties: [
                PropertyRef(
                  name: 'd',
                  type: TypeRef(
                    nullable: true,
                    known: TypeRef_Known(type: KnownType.String),
                  ),
                  comment: '',
                ),
                PropertyRef(
                  name: 'e',
                  type: TypeRef(
                    nullable: true,
                    generic: TypeRef_Generic(name: 'T'),
                  ),
                  comment: '',
                ),
              ],
            ),
          ),
        );

        final db = makeDb(rawStatements: [a, b, c, dto]);

        expect(
          db.allPropertiesOf(dto),
          [
            PropertyRef(
              name: 'a',
              type: TypeRef(
                nullable: true,
                known: TypeRef_Known(
                  type: KnownType.Map,
                  arguments: [
                    TypeRef(
                      nullable: true,
                      known: TypeRef_Known(
                        type: KnownType.Array,
                        arguments: [
                          TypeRef(
                            nullable: true,
                            known: TypeRef_Known(type: KnownType.Float64),
                          )
                        ],
                      ),
                    ),
                    TypeRef(
                      nullable: true,
                      known: TypeRef_Known(
                        type: KnownType.Array,
                        arguments: [
                          TypeRef(
                            nullable: true,
                            known: TypeRef_Known(
                              type: KnownType.Array,
                              arguments: [
                                TypeRef(
                                  nullable: true,
                                  known: TypeRef_Known(type: KnownType.Float64),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              comment: '',
            ),
            PropertyRef(
              name: 'b',
              type: TypeRef(
                nullable: true,
                known: TypeRef_Known(
                  type: KnownType.Array,
                  arguments: [
                    TypeRef(
                      nullable: true,
                      known: TypeRef_Known(type: KnownType.Float64),
                    )
                  ],
                ),
              ),
              comment: '',
            ),
            PropertyRef(
              name: 'c',
              type:
                  TypeRef(nullable: false, generic: TypeRef_Generic(name: 'T')),
              comment: '',
            ),
            PropertyRef(
              name: 'd',
              type: TypeRef(
                nullable: true,
                known: TypeRef_Known(type: KnownType.String),
              ),
              comment: '',
            ),
            PropertyRef(
              name: 'e',
              type:
                  TypeRef(nullable: false, generic: TypeRef_Generic(name: 'T')),
              comment: '',
            ),
          ],
        );
      });
    });
  });
}
