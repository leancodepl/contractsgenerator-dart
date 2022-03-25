# leancode_contracts_generator

[![](https://img.shields.io/pub/v/leancode_contracts_generator.svg?logo=dart)](https://pub.dev/packages/leancode_contracts_generator)
[![](https://github.com/leancodepl/contractsgenerator-dart/workflows/leancode_contracts_generator-test/badge.svg)](https://github.com/leancodepl/contractsgenerator-dart/actions)

## Installation

```sh
dart pub add leancode_contracts_generator --dev
```

## Usage

First run will take longer due to the need to download external dependencies.

### CLI

First initialize a config file filled with defaults with `dart run leancode_contracts_generator init`, then generate client contracts code with `dart run leancode_contracts_generator`.

```
$ dart run leancode_contracts_generator --help
Command line utility for generating dart CQRS contracts

Usage: leancode_contracts_generator <command> [arguments]

Global options:
-h, --help    Print this usage information.

Available commands:
  init   Initialize a config file

Run "leancode_contracts_generator help <command>" for more information about a command.
```

### Library

```dart
import 'dart:io';

import 'package:leancode_contracts_generator/leancode_contracts_generator.dart';

Future<void> main(List<String> arguments) async {
  final generator = ContractsGenerator(
    ContractsGeneratorConfig(
      input: GeneratorScript.path(['ExampleContracts/**']),
      name: 'cool_name',
      output: Directory('lib'),
      extra: '// :)',
      include: RegExp(r'\w+(\.\w+)*'),
    ),
  );

  await generator.writeAll();
}
```
