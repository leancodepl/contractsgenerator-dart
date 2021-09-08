# contracts_generator

[![](https://img.shields.io/pub/v/contracts_generator.svg?logo=dart)](https://pub.dev/packages/contracts_generator)
[![](https://github.com/leancodepl/contractsgenerator-dart/workflows/ci/badge.svg)](https://github.com/leancodepl/contractsgenerator-dart/actions)

Dart contracts client generator for a CQRS API. Generated code is based on the format described in <https://github.com/leancodepl/contractsgenerator>.

## Prerequisites

You will need to have .NET 5 installed on your system and have `dotnet` available in your PATH.

## Installation

```sh
dart pub add contracts_generator --dev
```

Then install dependencies needed by generated contracts:

```sh
dart pub add cqrs
dart pub add equatable
dart pub add json_annotation
```

## Usage

First run will take longer due to the need to download external dependencies.

### CLI

First initialize a config file filled with defaults with `dart run contracts_generator init`, then generate client contracts code with `dart run contracts_generator`.

```
$ dart run contracts_generator --help
Command line utility for generating dart CQRS contracts

Usage: contracts_generator <command> [arguments]

Global options:
-h, --help    Print this usage information.

Available commands:
  init   Initialize a config file

Run "contracts_generator help <command>" for more information about a command.
```

### Library

```dart
import 'dart:io';

import 'package:contracts_generator/contracts_generator.dart';

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
