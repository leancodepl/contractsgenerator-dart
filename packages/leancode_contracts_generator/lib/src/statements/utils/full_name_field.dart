import 'package:code_builder/code_builder.dart';

import '../statement_handler.dart';

const fullNameFieldName = r'fullName$';

Field fullNameField(Statement statement) {
  return Field(
    (f) => f
      ..name = fullNameFieldName
      ..static = true
      ..modifier = FieldModifier.constant
      ..assignment = literalString(statement.name).code,
  );
}
