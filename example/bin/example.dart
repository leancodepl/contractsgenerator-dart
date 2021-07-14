import 'dart:io';

import 'package:contracts_generator/contracts_generator.dart';

Future<void> main(List<String> arguments) async {
  final generator = ContractsGenerator(
    ContractsGeneratorConfig(
      pbFile: File('example.pb'),
      name: 'cool_name',
      output: Directory('lib'),
      extra: '// :)',
      includeNamespaceRegex: RegExp(r'\w+(\.\w+)*'),
    ),
  );

  await generator.writeAll();
}
