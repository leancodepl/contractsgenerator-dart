import 'package:leancode_contracts_generator/leancode_contracts_generator.dart';
import 'package:leancode_contracts_generator/src/generator_database.dart';
import 'package:leancode_contracts_generator/src/proto/contracts.pb.dart';
import 'package:test/test.dart';

GeneratorDatabase makeDb({
  RegExp? include,
  Set<String> statements = const {},
}) => makeRawDb(
  include: include,
  statements: statements.map((e) => Statement(name: e)),
);

GeneratorDatabase makeRawDb({
  RegExp? include,
  required Iterable<Statement> statements,
}) => GeneratorDatabase(
  ContractsGeneratorConfig(
    input: GeneratorScript.project([]),
    include: include,
  ),
  Export(statements: statements),
);

TypeRef typeRefOf(String name) =>
    TypeRef(internal: TypeRef_Internal(name: name), nullable: true);

void main() {
  group('GeneratorDatabase', () {
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

    group('usesTopics', () {
      test('is false by default', () {
        final db = makeDb();

        expect(db.usesTopics, false);
      });

      test('markAsUsingTopics turns the flag to true', () {
        final db = makeDb()..markAsUsingTopics();

        expect(db.usesTopics, true);
      });

      test('marking as using topics multiple times does nothing extra', () {
        final db = makeDb()
          ..markAsUsingTopics()
          ..markAsUsingTopics()
          ..markAsUsingTopics();

        expect(db.usesTopics, true);
      });
    });

    group('usesJsonSerialization', () {
      test('is false by default', () {
        final db = makeDb();

        expect(db.usesJsonSerialization, false);
      });

      test('markAsUsingJsonSerialization turns the flag to true', () {
        final db = makeDb()..markAsUsingJsonSerialization();

        expect(db.usesJsonSerialization, true);
      });

      test(
        'marking as using JSON serialization multiple times does nothing extra',
        () {
          final db = makeDb()
            ..markAsUsingJsonSerialization()
            ..markAsUsingJsonSerialization()
            ..markAsUsingJsonSerialization();

          expect(db.usesJsonSerialization, true);
        },
      );
    });

    group('getImplementingNotifications', () {
      test('collects notification types from various topics', () {
        final ab = Statement(name: 'A.B', dto: Statement_DTO());
        final bb = Statement(name: 'B.A', dto: Statement_DTO());
        final topic1 = Statement(
          name: 'Topic1',
          topic: Statement_Topic(
            notifications: [
              NotificationTypeRef(
                type: TypeRef(internal: TypeRef_Internal(name: 'A.B')),
              ),
              NotificationTypeRef(
                type: TypeRef(internal: TypeRef_Internal(name: 'B.B')),
              ),
            ],
          ),
        );
        final topic2 = Statement(
          name: 'Topic2',
          topic: Statement_Topic(
            notifications: [
              NotificationTypeRef(
                type: TypeRef(internal: TypeRef_Internal(name: 'B.B')),
              ),
            ],
          ),
        );
        final topic3 = Statement(
          name: 'Topic3',
          topic: Statement_Topic(
            notifications: [
              NotificationTypeRef(
                type: TypeRef(internal: TypeRef_Internal(name: 'A.B')),
              ),
            ],
          ),
        );

        final db = makeRawDb(statements: [ab, bb, topic1, topic2, topic3]);

        final notificationTypesAB = db.getImplementingNotifications('A.B');
        final notificationTypesBB = db.getImplementingNotifications('B.B');

        expect(
          notificationTypesAB,
          unorderedEquals(['Topic1Notification', 'Topic3Notification']),
        );
        expect(
          notificationTypesBB,
          unorderedEquals(['Topic1Notification', 'Topic2Notification']),
        );
      });
    });

    group('syntheticTopicNotificationFullName', () {
      test('the name is the topic name with a "Notification" suffix', () {
        final topic = Statement(name: 'A.B.Topic', topic: Statement_Topic());

        final db = makeRawDb(statements: [topic]);

        final syntheticName = db.syntheticTopicNotificationFullName(topic);
        expect(syntheticName, 'A.B.TopicNotification');
      });

      test('the name is resistant to collisions', () {
        final dto1 = Statement(
          name: 'A.B.TopicNotification',
          dto: Statement_DTO(),
        );
        final dto2 = Statement(
          name: 'A.B.TopicNotification_',
          dto: Statement_DTO(),
        );
        final topic = Statement(name: 'A.B.Topic', topic: Statement_Topic());

        final db = makeRawDb(statements: [dto1, dto2, topic]);

        final syntheticName = db.syntheticTopicNotificationFullName(topic);
        expect(syntheticName, 'A.B.TopicNotification__');
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
          statements: {'One.One', 'Three.One', 'One.Two', 'Two.One', 'Two.Two'},
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
          known: TypeRef_Known(type: KnownType.DateTimeOffset),
        );
        final genericType = TypeRef(generic: TypeRef_Generic(name: 'T'));
        final nonCqrsStatement = Statement(
          name: 'nonCqrsStatement',
          dto: Statement_DTO(),
        );

        final db = makeRawDb(
          statements: [
            extending,
            secondIndirection,
            thirdIndirection,
            nonCqrsStatement,
          ],
        );

        expect(db.isProtocol(cqrsType), true);
        expect(db.isProtocol(typeRefOf('extending')), true);
        expect(db.isProtocol(typeRefOf('secondIndirection')), true);
        expect(db.isProtocol(typeRefOf('thirdIndirection')), true);
        expect(db.isProtocol(differentKnownTypeKind), false);
        expect(db.isProtocol(genericType), false);
        expect(db.isProtocol(typeRefOf('nonCqrsStatement')), false);
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

        final db = makeRawDb(statements: [simple]);

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

        final db = makeRawDb(statements: [simple1, simple2, simple3]);

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

        final db = makeRawDb(statements: [simple1, simple2, simple3]);

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
                            ),
                          ],
                        ),
                      ),
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
                        ),
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

        final db = makeRawDb(statements: [a, b, c, dto]);

        expect(db.allPropertiesOf(dto), [
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
                        ),
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
                              ),
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
                  ),
                ],
              ),
            ),
            comment: '',
          ),
          PropertyRef(
            name: 'c',
            type: TypeRef(nullable: true, generic: TypeRef_Generic(name: 'T')),
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
            type: TypeRef(nullable: true, generic: TypeRef_Generic(name: 'T')),
            comment: '',
          ),
        ]);
      });
    });
  });
}
