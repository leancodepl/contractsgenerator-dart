import 'dart:io';

import 'package:leancode_contracts_generator/leancode_contracts_generator.dart';

Future<void> main(List<String> arguments) async {
  final generator = ContractsGenerator(
    ContractsGeneratorConfig(
      input: GeneratorScript.path(['ExampleContracts/**']),
      name: 'cool_name',
      output: Directory('lib'),
      directives: "export 'my_extensions.dart';",
      extra: '// :)',
      include: RegExp(r'\w+(\.\w+)*'),
    ),
  );

  await generator.writeAll();
}
