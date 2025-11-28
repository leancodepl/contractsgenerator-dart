import 'package:code_builder/code_builder.dart';
import 'package:leancode_contracts_generator/src/statements/utils/full_name_field.dart';

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

      // make it abstract if it extends a protocol type
      b.abstract = typeDescriptor.extends_1.any(db.isProtocol);

      if (b.abstract) {
        b
          ..annotations.clear()
          ..methods.clear()
          ..constructors.removeWhere((e) => e.name == 'fromJson');
      }

      // Remove serialization from generic DTOs. This is done because the
      // toJson method has a signature that depends on the amount
      // of type parameters of this DTO. This means this will break
      // inheritance. Something like `class A extends B<T> {}`
      if (typeDescriptor.genericParameters.isNotEmpty) {
        b.methods.removeWhere((m) => m.name == 'toJson');
      }

      b.fields.add(fullNameField(statement));
    });
  }

  @override
  bool canHandle(Statement statement) => statement.hasDto();
}
