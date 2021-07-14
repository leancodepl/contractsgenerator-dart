import 'dart:io';

class ContractsGeneratorConfig {
  ContractsGeneratorConfig({
    this.pbFile,
    this.project,
    this.name = 'contracts',
    this.extra = '',
    RegExp? includeNamespaceRegex,
    Directory? output,
  })  : includeNamespaceRegex = includeNamespaceRegex ?? RegExp(''),
        output = output ?? Directory.current,
        assert(
          (pbFile != null) ^ (project != null),
          'Specify exactly one of `pbFile`, `project`',
        );

  /// Name of the output dart file
  final String name;

  /// Text to be added in generated contracts file between imports and statements
  final String extra;

  /// Output directory
  final Directory output;

  /// Generated `.pb` file with a structure defined by the `types.proto` schema
  final File? pbFile;

  /// C#'s `.csproj` contracts project file
  final File? project;

  /// Regex to filter-in namespaced statements
  final RegExp includeNamespaceRegex;
}
