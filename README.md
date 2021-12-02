# contracts_generator

[![](https://img.shields.io/pub/v/contracts_generator.svg?logo=dart)](https://pub.dev/packages/contracts_generator)
[![](https://github.com/leancodepl/contractsgenerator-dart/workflows/ci/badge.svg)](https://github.com/leancodepl/contractsgenerator-dart/actions)

Dart contracts client generator for a CQRS API. Generated code is based on the format described in <https://github.com/leancodepl/contractsgenerator>.

## Prerequisites

You will need to have .NET 6 and the .NET version used in your project installed on your system and have `dotnet` available in your PATH.

### M1 macs

When installing multiple .NET sdks you need to make sure all of them are for the same architecture. Unfortunately since .NET 6 is the first .NET version to include native arm64 macOS builds, you will be forced to install the x64 version regardless:

```sh
# tap into repo that hosts mutually compatible dotnet casks
brew tap isen-ng/dotnet-sdk-versions
# force x64 .NET6
arch -x86_64 brew install dotnet-sdk6-0-100
# install your needed version (see https://github.com/isen-ng/homebrew-dotnet-sdk-versions#versions)
brew install --cask dotnet-sdk5-0-400
```

Finally, add the x64 dotnet to your `PATH`: `/usr/local/share/dotnet/x64`

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
