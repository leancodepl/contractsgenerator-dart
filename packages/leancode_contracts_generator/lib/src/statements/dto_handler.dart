import 'package:code_builder/code_builder.dart';

import 'statement_handler.dart';

class DtoHandler extends StatementHandler {
  const DtoHandler(
    super.typeCreator,
    super.valueCreator,
    super.attributeCreator,
    super.db,
  );

  @override
  Spec build(Statement statement) {
    return createBase(statement).rebuild((b) {
      final typeDescriptor = statement.dto.typeDescriptor;

      // make it abstract if it extends a cqrs type
      b.abstract = typeDescriptor.extends_1.any(db.isCqrs);

      if (b.abstract) {
        b
          ..annotations.clear()
          ..methods.clear()
          ..constructors.removeWhere((e) => e.name == 'fromJson');
      }

      // remove serde from generic DTOs
      if (typeDescriptor.genericParameters.isNotEmpty) {
        b.methods.clear();
      }
    });
  }

  @override
  bool canHandle(Statement statement) => statement.hasDto();
}
