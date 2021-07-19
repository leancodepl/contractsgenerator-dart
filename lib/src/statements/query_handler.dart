import 'package:code_builder/code_builder.dart';

import '../generator_database.dart';
import '../types/type_creator.dart';
import '../values/value_creator.dart';
import 'result_factory/internal_result_factory_handler.dart';
import 'result_factory/known_result_factory_handler.dart';
import 'result_factory/result_factory_creator.dart';
import 'statement_handler.dart';
import 'utils/get_full_name_method.dart';

class QueryHandler extends StatementHandler {
  QueryHandler(
    TypeCreator typeCreator,
    ValueCreator valueCreator,
    GeneratorDatabase db,
  )   : resultFactoryCreator = ResultFactoryCreator(
          [
            InternalResultFactoryHandler(db),
            const KnownResultFactoryHandler(),
          ],
          typeCreator,
        ),
        super(typeCreator, valueCreator, db);

  final ResultFactoryCreator resultFactoryCreator;

  @override
  Spec build(Statement statement) {
    return createBase(statement).rebuild(
      (b) => b
        ..methods.addAll(
          [
            resultFactoryCreator.create(statement.query.returnType),
            getFullNameMethod(statement),
          ],
        ),
    );
  }

  @override
  bool canHandle(Statement statement) => statement.hasQuery();
}
