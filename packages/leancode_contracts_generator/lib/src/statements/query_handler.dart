import 'package:code_builder/code_builder.dart';
import 'package:leancode_contracts_generator/src/statements/utils/full_name_field.dart';

import '../json_converters/json_converters.dart';
import 'result_factory/internal_result_factory_handler.dart';
import 'result_factory/known_result_factory_handler.dart';
import 'result_factory/result_factory_creator.dart';
import 'statement_handler.dart';
import 'utils/get_full_name_method.dart';

class QueryHandler extends StatementHandler {
  QueryHandler(
    super.typeCreator,
    super.valueCreator,
    super.attributeCreator,
    JsonConverters jsonConverters,
    super.db,
  ) : resultFactoryCreator = ResultFactoryCreator([
        InternalResultFactoryHandler(db),
        KnownResultFactoryHandler(jsonConverters),
      ], typeCreator);

  final ResultFactoryCreator resultFactoryCreator;

  @override
  Spec build(Statement statement) {
    return createBase(statement, requiredParameters: true).rebuild(
      (b) => b
        ..fields.add(fullNameField(statement))
        ..methods.addAll([
          resultFactoryCreator.create(statement.query.returnType),
          getFullNameMethod,
        ]),
    );
  }

  @override
  bool canHandle(Statement statement) => statement.hasQuery();
}
