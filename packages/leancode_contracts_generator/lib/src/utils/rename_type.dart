// Will be incrementally extended as conflicts arise
const _reservedTypes = {
  'Object',
  'String',
  'Duration',
  'Query',
  'Command',
};

/// Renames a type to avoid potential dart types conflicts
String renameType(String original) {
  if (_reservedTypes.contains(original)) {
    return '${original}_';
  }
  return original;
}
