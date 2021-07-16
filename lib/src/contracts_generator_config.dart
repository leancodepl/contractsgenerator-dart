import 'dart:io';

import 'generator_script.dart';

class ContractsGeneratorConfig {
  ContractsGeneratorConfig({
    required this.script,
    this.name = 'contracts',
    this.extra = '',
    RegExp? includeNamespaceRegex,
    Directory? output,
  })  : includeNamespaceRegex = includeNamespaceRegex ?? RegExp(''),
        output = output ?? Directory.current;

  /// Name of the output dart file
  final String name;

  /// Text to be added in generated contracts file between imports and statements
  final String extra;

  /// Output directory
  final Directory output;

  /// Method of consuming contracts code
  final GeneratorScript script;

  /// Regex to filter-in namespaced statements
  final RegExp includeNamespaceRegex;
}
