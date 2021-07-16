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
    this.extra = '',
  })  : include = include ?? RegExp(''),
        output = output ?? Directory.current;

  factory ContractsGeneratorConfig.fromYaml(String yaml) {
    final defaultConfig = loadYaml(defaultYamlConfig) as Map;
    final override = loadYaml(yaml) as Map;

    final config = mergeMaps<dynamic, dynamic>(defaultConfig, override);

    if (config['input'] == null) {
      throw ArgumentError.notNull(
        '`input` is a required field and cannot be null',
      );
    }

    return ContractsGeneratorConfig(
      input: GeneratorScript.project([config['input'] as String]),
      name: config['name'] as String,
      include: RegExp(config['include'] as String),
      output: Directory(config['output'] as String),
      extra: config['extra'] as String,
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

  /// Text to be added in generated contracts file between imports and statements
  final String extra;

  // TODO: more input options
  static const defaultYamlConfig = '''
# Path to contracts' .csproj project file (required)
input:
# Name of the output dart file
name: contracts
# Regex to filter-in namespaced statements
include: .*
# Output directory
output: lib/data
# Text to be added in generated contracts file between imports and statements
extra: ''
''';
}
