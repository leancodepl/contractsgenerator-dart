import 'package:recase/recase.dart';

export 'package:json_serializable/src/utils.dart' show pascalCase;

const _reservedKeywords = {
  'new',
  'default',
  'do',
  'if',
  'return',
  'else',
  'enum',
  'in',
  'assert',
  'super',
  'extends',
  'is',
  'switch',
  'break',
  'this',
  'case',
  'throw',
  'catch',
  'false',
  'true',
  'class',
  'final',
  'null',
  'try',
  'const',
  'finally',
  'continue',
  'for',
  'var',
  'void',
  'while',
  'rethrow',
  'with',
};

/// Renames a field to an idiomatic dart field identifier.
/// Also renames potential keywords to avoid syntax errors.
String renameField(String original) {
  final camelCase = ReCase(original).camelCase;
  if (_reservedKeywords.contains(camelCase)) return '${camelCase}_';
  return camelCase;
}
