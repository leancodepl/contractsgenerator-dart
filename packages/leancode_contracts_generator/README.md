<a href="https://leancode.co/?utm_source=github.com&utm_medium=referral&utm_campaign=leancode-contracts-generator" align="center">
  <img alt="leancode_contracts_generator" src="https://raw.githubusercontent.com/leancodepl/contractsgenerator-dart/refs/heads/main/packages/leancode_contracts_generator/doc/imgs/banner.png" />
</a>

# leancode_contracts_generator

[![](https://img.shields.io/pub/v/leancode_contracts_generator.svg?logo=dart)](https://pub.dev/packages/leancode_contracts_generator)
[![](https://github.com/leancodepl/contractsgenerator-dart/workflows/leancode_contracts_generator-test/badge.svg)](https://github.com/leancodepl/contractsgenerator-dart/actions)

## Installation

```sh
dart pub add leancode_contracts_generator --dev
```

If your contracts use `Topic`s additionally install `leancode_pipe`:

```sh
dart pub add leancode_pipe
```

Add dependencies for generating JSON serialization helpers:

```sh
dart pub add json_serializable --dev
dart pub add build_runner --dev
```

## Usage

Ensure that you have .NET SDK installed with version capable of building target contracts project.

The version of .NET generator is controlled using .NET tool manifest (see [example](.config/dotnet-tools.json)), the presence of which is required for .NET generator to be found. If it's missing, one can be created with `dotnet tool install dotnet-contracts-generate --create-manifest-if-needed`.

First run will take longer due to the need to download external dependencies.

After running the contracts generator, generate the JSON serialization helpers:

```sh
dart run build_runner build
```

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

---

## 🛠️ Maintained by LeanCode

<div align="center">
  <a href="https://leancode.co/?utm_source=github.com&utm_medium=referral&utm_campaign=leancode-contracts-generator">
    <img src="https://leancodepublic.blob.core.windows.net/public/wide.png" alt="LeanCode Logo" height="100" />
  </a>
</div>

This package is built with 💙 by **[LeanCode](https://leancode.co?utm_source=github.com&utm_medium=referral&utm_campaign=leancode-contracts-generator)**.
We are **top-tier experts** focused on Flutter Enterprise solutions.

### Why LeanCode?

- **Creators of [Patrol](https://patrol.leancode.co/?utm_source=github.com&utm_medium=referral&utm_campaign=leancode-contracts-generator)** – the next-gen testing framework for Flutter.

- **Production-Ready** – We use this package in apps with millions of users.
- **Full-Cycle Product Development** – We take your product from scratch to long-term maintenance.

<div align="center">
  <br />

  **Need help with your Flutter project?**

  [**👉 Hire our team**](https://leancode.co/get-estimate?utm_source=github.com&utm_medium=referral&utm_campaign=leancode-contracts-generator)
  &nbsp;&nbsp;•&nbsp;&nbsp;
  [Check our other packages](https://pub.dev/packages?q=publisher%3Aleancode.co&sort=downloads)

</div>
