import 'dart:io';

part 'generator_script.g.dart';

/// Interface to the C# protobuf generator
class GeneratorScript {
  /// Generate for a list of projects. Passed paths need to point to a .csproj file.
  GeneratorScript.project(List<String> projects)
      : args = ['project', '-p', projects.join(';')];

  /// Generate for a single C# file
  GeneratorScript.file(String file) : args = ['file', '-i', file];

  /// Generate for a all files in the globbed path
  GeneratorScript.path(String path) : args = ['path', '-p', path];

  final List<String> args;

  static const version = '1.0.3';

  static const String _script = _$script;

  Future<List<int>> run() async {
    final result = await Process.run(
      'sh',
      ['-c', _script, '--', ...args, '-o-'],
      stdoutEncoding: null,
      stderrEncoding: null,
      environment: const {'SERVER_VERSION': version},
    );

    if (result.exitCode != 0) {
      stderr.add(result.stderr as List<int>);
      exit(1);
    }

    return result.stdout as List<int>;
  }
}
