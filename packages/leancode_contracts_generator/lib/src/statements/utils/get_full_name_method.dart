import 'package:code_builder/code_builder.dart';
import 'package:leancode_contracts_generator/src/statements/utils/full_name_field.dart';

final getFullNameMethod = Method(
  (b) => b
    ..name = 'getFullName'
    ..lambda = true
    ..returns = refer('String')
    ..body = const Code(fullNameFieldName),
);
