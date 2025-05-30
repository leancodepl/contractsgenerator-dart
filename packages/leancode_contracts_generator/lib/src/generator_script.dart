import 'dart:io';

import 'contracts_generator_exception.dart';

/// Interface to the C# protobuf generator
class GeneratorScript {
  /// Generate for a list of projects. Passed paths need to point to a .csproj file.
  GeneratorScript.project(List<String> projects)
      : args = ['project', '-p', ...projects];

  /// Generate for a all files in the globbed paths
  GeneratorScript.path(
    List<String> include, {
    List<String>? exclude,
    String? directory,
  }) : args = [
          'path',
          '-i',
          ...include,
          if (exclude != null && exclude.isNotEmpty) ...[
            '-e',
            ...exclude,
          ],
          if (directory != null && directory.isNotEmpty) ...[
            '-d',
            directory,
          ],
        ];

  final List<String> args;

  Future<List<int>> run() async {
    await Process.run('dotnet', ['tool', 'restore']);
    final result = await Process.run(
      'dotnet',
      ['tool', 'run', 'dotnet-contracts-generate', '--', ...args, '-o-'],
      stdoutEncoding: null,
      stderrEncoding: null,
    );

    if (result.exitCode != 0) {
      throw ContractsGeneratorException(
        'Generator script failed with: ${String.fromCharCodes(result.stderr as List<int>)}',
      );
    }

    return result.stdout as List<int>;
  }
}
