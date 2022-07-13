import 'package:code_builder/code_builder.dart';

import '../attributes/attribute_creator.dart';
import '../generator_database.dart';
import '../json_converters/json_converters.dart';
import '../types/type_creator.dart';
import '../values/value_creator.dart';
import 'result_factory/internal_result_factory_handler.dart';
import 'result_factory/known_result_factory_handler.dart';
import 'result_factory/result_factory_creator.dart';
import 'statement_handler.dart';
import 'utils/get_full_name_method.dart';

class OperationHandler extends StatementHandler {
  OperationHandler(
    TypeCreator typeCreator,
    ValueCreator valueCreator,
    AttributeCreator attributeCreator,
    JsonConverters jsonConverters,
    GeneratorDatabase db,
  )   : resultFactoryCreator = ResultFactoryCreator(
          [
            InternalResultFactoryHandler(db),
            KnownResultFactoryHandler(jsonConverters)
          ],
          typeCreator,
        ),
        super(typeCreator, valueCreator, attributeCreator, jsonConverters, db);

  final ResultFactoryCreator resultFactoryCreator;

  @override
  Spec build(Statement statement) {
    return createBase(statement).rebuild(
      (b) => b
        ..methods.addAll(
          [
            resultFactoryCreator.create(statement.operation.returnType),
            getFullNameMethod(statement),
          ],
        ),
    );
  }

  @override
  bool canHandle(Statement statement) => statement.hasOperation();
}
