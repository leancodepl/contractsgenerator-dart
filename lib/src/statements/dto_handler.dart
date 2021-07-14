import 'package:code_builder/code_builder.dart';

import '../generator_database.dart';
import '../types/type_creator.dart';
import '../values/value_creator.dart';
import 'statement_handler.dart';

class DtoHandler extends StatementHandler {
  const DtoHandler(
    TypeCreator typeCreator,
    ValueCreator valueCreator,
    GeneratorDatabase db,
  ) : super(typeCreator, valueCreator, db);

  @override
  Spec build(Statement statement) {
    return createBase(statement).rebuild((b) {
      // make it abstract if it extends a cqrs type
      b.abstract = statement.extends_3.any(db.isCqrs);

      if (b.abstract) {
        b
          ..annotations.clear()
          ..methods.clear()
          ..constructors.removeWhere((e) => e.name == 'fromJson');
      }
    });
  }

  @override
  bool canHandle(Statement statement) => statement.hasDto();
}
