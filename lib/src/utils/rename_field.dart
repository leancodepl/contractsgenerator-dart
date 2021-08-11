import 'package:recase/recase.dart';

// TODO: add more keywords
const _keywords = {'new', 'default'};

/// Renames a field to an idiomatic dart field identifier.
/// Also renames potential keywords to avoid syntax errors.
String renameField(String original) {
  final camelCase = ReCase(original).camelCase;
  if (_keywords.contains(camelCase)) return '${camelCase}_';
  return camelCase;
}
