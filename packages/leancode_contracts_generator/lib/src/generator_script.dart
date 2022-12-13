import 'dart:io';

import 'contracts_generator_exception.dart';

part 'generator_script.g.dart';

/// Interface to the C# protobuf generator
class GeneratorScript {
  /// Generate for a list of projects. Passed paths need to point to a .csproj file.
  GeneratorScript.project(
    List<String> projects, {
    this.overrideGeneratorVersion,
  }) : args = ['project', '-p', ...projects];

  /// Generate for a all files in the globbed paths
  GeneratorScript.path(
    List<String> include, {
    List<String>? exclude,
    String? directory,
    this.overrideGeneratorVersion,
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
  final String? overrideGeneratorVersion;

  static const supportedVersion = '2.0.0-alpha.4';

  static const String _script = _$script;

  Future<List<int>> run() async {
    final result = await Process.run(
      'sh',
      ['-c', _script, '--', ...args, '-o-'],
      stdoutEncoding: null,
      stderrEncoding: null,
      environment: {
        'SERVER_VERSION': overrideGeneratorVersion ?? supportedVersion
      },
    );

    if (result.exitCode != 0) {
      throw ContractsGeneratorException(
        'Generator script failed with: ${String.fromCharCodes(result.stderr as List<int>)}',
      );
    }

    return result.stdout as List<int>;
  }
}
