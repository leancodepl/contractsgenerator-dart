# Dart contracts generator

[![](https://img.shields.io/pub/v/contracts_generator.svg?logo=dart)](https://pub.dev/packages/contracts_generator)
[![](https://github.com/leancodepl/contractsgenerator-dart/workflows/contracts_generator-test/badge.svg)](https://github.com/leancodepl/contractsgenerator-dart/actions)
[![](https://github.com/leancodepl/contractsgenerator-dart/workflows/contracts-test/badge.svg)](https://github.com/leancodepl/contractsgenerator-dart/actions)

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
dart pub add contracts
```

## Usage

First run will take longer due to the need to download external dependencies.

- Initialize a config file filled with defaults with `dart run contracts_generator init`
- Generate client contracts code with `dart run contracts_generator`
