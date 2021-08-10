class ContractsGeneratorException implements Exception {
  const ContractsGeneratorException(this.message);

  final String message;

  @override
  String toString() => 'ContractsGeneratorException: $message';
}
