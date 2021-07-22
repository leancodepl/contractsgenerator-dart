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
    final config = mergeMaps<dynamic, dynamic>(
      loadYaml(defaultYamlConfig) as Map,
      loadYaml(yaml) as Map,
    );

    final dynamic name = config['name'];
    final dynamic include = config['include'];
    final dynamic output = config['output'];
    final dynamic directives = config['directives'];
    final dynamic extra = config['extra'];
    
    if (name is! String) {
      throw ArgumentError('`name` field has to be a string');
    }
    if (include is! String) {
      throw ArgumentError('`include` field has to be a string');
    }
    if (output is! String) {
      throw ArgumentError('`output` field has to be a string');
    }
    if (directives is! String) {
      throw ArgumentError('`directives` field has to be a string');
    }
    if (extra is! String) {
      throw ArgumentError('`extra` field has to be a string');
    }

    return ContractsGeneratorConfig(
      input: _configure(config),
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

  static GeneratorScript? _configureProject(dynamic config) {
    if (config['project'] == null) return null;

    return GeneratorScript.project(
      (config['project'] as List).cast<String>(),
    );
  }

  static GeneratorScript? _configurePath(dynamic config) {
    if (config['path'] == null) return null;

    final values = config['path'] as Map;
    return GeneratorScript.path(
      (values['include'] as List).cast<String>(),
      exclude: (values['exclude'] as List?)?.cast<String>(),
      directory: values['directory'] as String?,
    );
  }

  static GeneratorScript _configure(dynamic config) {
    final dynamic input = config['input'];
    if (input == null) {
      throw ArgumentError.notNull(
        '`input` is a required field and cannot be null',
      );
    }

    final proj = _configureProject(input);
    final path = _configurePath(input);

    if (!((proj != null) ^ (path != null))) {
      throw ArgumentError(
        '`input` has to have exactly one of "project", "path"',
      );
    }

    return (proj ?? path)!;
  }
}
