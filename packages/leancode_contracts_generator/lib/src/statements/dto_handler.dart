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

      // make it abstract if it extends a protocol type
      b.abstract = typeDescriptor.extends_1.any(db.isProtocol);

      if (b.abstract) {
        b
          ..annotations.clear()
          ..methods.clear()
          ..constructors.removeWhere((e) => e.name == 'fromJson');
      }

      // Remove serde from generic DTOs. This is done because the
      // toJson method has a signature that depends on the amount
      // of type parameters of this DTO. This means this will break
      // inheritance. Something like `class A extends B<T> {}`
      if (typeDescriptor.genericParameters.isNotEmpty) {
        b.methods.clear();
      }

      // Remove serde from DTOs that have fields with generic DTOs.
      // This is because json_serializable can't handle fields that
      // reference generic types with genericArgumentFactories: true
      final hasGenericDtoFields = db
          .allPropertiesOf(statement)
          .any((prop) => db.isGenericDto(prop.type));
      if (hasGenericDtoFields) {
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
