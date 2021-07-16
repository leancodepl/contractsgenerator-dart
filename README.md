# contracts_generator

[![](https://img.shields.io/pub/v/contracts_generator.svg?logo=dart)](https://pub.dev/packages/contracts_generator)
[![](https://github.com/leancodepl/contractsgenerator-dart/workflows/ci/badge.svg)](https://github.com/leancodepl/contractsgenerator-dart/actions)

Dart contracts client generator for a CQRS API. Generated code is based on the format described in <https://github.com/leancodepl/contractsgenerator>. If you are using Flutter replace all `$ dart [ARGS ...]` commands with `$ flutter [ARGS ...]`.

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

```
$ dart pub run contracts_generator --help

Command line utility for generating dart CQRS contracts

OPTIONS:
    -h, --help                   Show this help
    -n, --name                   Name of the output dart file
                                 (defaults to "contracts")
    -p, --project (mandatory)    .csproj file for the contracts project
    -i, --include-regex          Regex to filter-in namespaced statements
    -o, --output                 Output directory
                                 (defaults to "lib/data")
    -e, --extra                  Text to be added in generated contracts file between imports and statements

EXAMPLES:
    exe -p ../backend/src/Core/ProjectName.Core.Contracts/ProjectName.Core.Contracts.csproj -i "ProjectName\.Core\.Contracts\.(Mobile|Shared)"
```

Configuration is done through CLI flags.

### Library

```dart
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
```

Configuration is done through the `ContractsGeneratorConfig` object.

## Todo

- Attributes. Currently completely ignored
- Config file instead of CLI flags
