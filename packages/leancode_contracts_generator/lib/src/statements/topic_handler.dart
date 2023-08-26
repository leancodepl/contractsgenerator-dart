import 'package:code_builder/code_builder.dart';
import 'package:leancode_contracts_generator/src/types/known_type_handler.dart';

import '../json_converters/json_converters.dart';
import 'result_factory/internal_result_factory_handler.dart';
import 'result_factory/known_result_factory_handler.dart';
import 'result_factory/result_factory_creator.dart';
import 'statement_handler.dart';
import 'utils/get_full_name_method.dart';

class TopicHandler extends StatementHandler {
  TopicHandler(
    super.typeCreator,
    super.valueCreator,
    super.attributeCreator,
    JsonConverters jsonConverters,
    super.db,
  ) : resultFactoryCreator = ResultFactoryCreator(
          [
            InternalResultFactoryHandler(db),
            KnownResultFactoryHandler(jsonConverters),
          ],
          typeCreator,
        );

  final ResultFactoryCreator resultFactoryCreator;

  @override
  Spec build(Statement statement) {
    final base = createBase(statement, requiredParameters: true);

    // FIXME: notification type
    const notificationTypeName = 'Object';

    return base.rebuild(
      (b) => b
        ..implements.removeWhere(
          (e) => e.symbol == KnownTypeHandler.toDartType(KnownType.Topic),
        )
        // FIXME: implement real topic type
        ..implements.add(refer('Topic<$notificationTypeName>'))
        ..methods.addAll(
          [
            _castNotification(statement.topic, notificationTypeName),
            Method(
              (b) => b
                ..name = 'fromJson'
                ..lambda = true
                ..returns = refer(base.name)
                ..requiredParameters.addAll([
                  Parameter(
                    (b) => b
                      ..name = 'json'
                      ..type = refer('Map<String, dynamic>'),
                  ),
                ])
                ..body = Code('${base.name}.fromJson(json)'),
            ),
            getFullNameMethod(statement),
          ],
        ),
    );
  }

  Method _castNotification(Statement_Topic topic, String notificationTypeName) {
    String cases() => [
          for (final notification in topic.notifications)
            '${literalString(notification.tag)} => ${resultFactoryCreator.createBody(notification.type, 'json')}',
          '_ => null',
        ].join(',');

    return Method(
      (b) => b
        ..name = 'castNotification'
        ..lambda = true
        ..returns = refer('$notificationTypeName?')
        ..requiredParameters.addAll([
          Parameter(
            (b) => b
              ..name = 'fullName'
              ..type = refer('String'),
          ),
          Parameter(
            (b) => b
              ..name = 'json'
              ..type = refer('dynamic'),
          ),
        ])
        ..body = Code('switch(fullName) {${cases()}}'),
    );
  }

  @override
  bool canHandle(Statement statement) => statement.hasTopic();
}
