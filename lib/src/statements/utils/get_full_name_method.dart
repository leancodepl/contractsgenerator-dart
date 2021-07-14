import 'package:code_builder/code_builder.dart';

import '../statement_handler.dart';

Method getFullNameMethod(Statement statement) {
  return Method(
    (b) => b
      ..name = 'getFullName'
      ..lambda = true
      ..returns = refer('String')
      ..body = literalString(statement.name).code,
  );
}
