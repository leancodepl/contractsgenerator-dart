import 'dart:io';

import 'package:collection/collection.dart';
import 'package:yaml/yaml.dart';

import 'generator_script.dart';

class ContractsGeneratorConfig {
  ContractsGeneratorConfig({
    required this.input,
    this.name = 'contracts',
    RegExp? include,
    Directory? output,
    this.directives = '',
    this.extra = '',
  })  : include = include ?? RegExp(''),
        output = output ?? Directory.current;

  factory ContractsGeneratorConfig.fromYaml(String yaml) {
    final defaultConfig = loadYaml(defaultYamlConfig) as Map;
    final override = loadYaml(yaml) as Map;

    final config = mergeMaps<dynamic, dynamic>(defaultConfig, override);

    late GeneratorScript script;

    if (config['input'] == null) {
      throw ArgumentError.notNull(
        '`input` is a required field and cannot be null',
      );
    } else {
      const projectKey = 'project';
      const pathKey = 'path';

      final input = config['input'] as Map;
      final inputMethods = <String, dynamic>{
        for (final method in const [projectKey, pathKey])
          if (input.containsKey(method)) method: input[method],
      };

      if (inputMethods.length != 1) {
        throw ArgumentError(
          '`input` has to have exactly one of "$projectKey", "$pathKey"',
        );
      }

      final inputMethod = inputMethods.entries.first;
      switch (inputMethod.key) {
        case projectKey:
          script = GeneratorScript.project(
            (inputMethod.value as List).cast<String>(),
          );
          break;
        case pathKey:
          final values = inputMethod.value as Map;
          script = GeneratorScript.path(
            (values['include'] as List).cast<String>(),
            exclude: (values['exclude'] as List).cast<String>(),
            directory: values['directory'] as String,
          );
          break;
      }
    }

    final dynamic name = config['name'];
    final dynamic include = config['include'];
    final dynamic output = config['output'];
    final dynamic extra = config['extra'];
    final dynamic directives = config['directives'];

    if (name is! String) {
      throw ArgumentError('`name` field has to be a string');
    }
    if (include is! String) {
      throw ArgumentError('`include` field has to be a string');
    }
    if (output is! String) {
      throw ArgumentError('`output` field has to be a string');
    }
    if (extra is! String) {
      throw ArgumentError('`extra` field has to be a string');
    }
    if (directives is! String) {
      throw ArgumentError('`directives` field has to be a string');
    }

    return ContractsGeneratorConfig(
      input: script,
      name: name,
      include: RegExp(include),
      output: Directory(output),
      directives: directives,
      extra: extra,
    );
  }

  /// Method of consuming contracts code
  final GeneratorScript input;

  /// Name of the output dart file
  final String name;

  /// Regex to filter-in namespaced statements
  final RegExp include;

  /// Output directory
  final Directory output;

  /// Directives (`export`, `import`, `part` etc.) to be added to the generated contracts file
  final String directives;

  /// Code to be added to the generated contracts file after all directives
  final String extra;

  static const defaultYamlConfig = '''
# Possible input methods, specify exactly one (required)
input:
  # Array of paths pointing to .csproj contracts project files
  # project:
  #   - path1.csproj
  #   - path2.csproj
  # # Multiple files selected by glob patterns
  # path: 
  #   # List of glob paths specifying which files should be included (required)
  #   include:
  #     - glob/**.cs
  #   # List of glob paths specifying which files should be excluded
  #   exclude:
  #     - glob/not_you.cs
  #   # The base directory used for globbing
  #   directory: .
# Name of the output dart file
name: contracts
# Regex to filter-in namespaced statements
include: .*
# Output directory
output: lib/data
# Directives (`export`, `import`, `part` etc.) to be added to the generated contracts file
directives: ""
# Code to be added to the generated contracts file after all directives
extra: ""
''';
}
