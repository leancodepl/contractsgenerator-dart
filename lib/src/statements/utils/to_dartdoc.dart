Iterable<String> toDartdoc(String doc) {
  if (doc.isEmpty) {
    return const [];
  }

  return doc
      .split('\n')
      .where((line) => line.isNotEmpty)
      .map((line) => '/// $line');
}
