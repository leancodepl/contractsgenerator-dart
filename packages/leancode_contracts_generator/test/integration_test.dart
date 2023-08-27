@Timeout(Duration(minutes: 30))
library;

import 'dart:io';

import 'package:leancode_contracts_generator/leancode_contracts_generator.dart';
import 'package:path/path.dart' as p;
import 'package:test/test.dart';

void main() {
  const inDir = 'contractsgenerator/examples';
  const outDir = 'test/out';
  final mainPath = p.join(outDir, 'main.dart');

  tearDown(() {
    final dir = Directory(outDir);
    if (dir.existsSync()) {
      dir.deleteSync(recursive: true);
    }
  });

  group('final contract compilation', () {
    final generatorScripts = [
      for (final file in Directory(p.join(inDir, 'attributes')).listFiles())
        GeneratorScript.path([file.path]),
      for (final file in Directory(p.join(inDir, 'notifications')).listFiles())
        GeneratorScript.path([file.path]),
      // FIXME: Binary as Map key not working yet
      // for (final file in Directory(p.join(inDir, 'properties')).listFiles())
      //   GeneratorScript.path([file.path]),
      for (final file in Directory(p.join(inDir, 'simple')).listSync())
        GeneratorScript.path([file.path]),
      for (final file
          in Directory(p.join(inDir, 'supported_use_cases')).listFiles())
        GeneratorScript.path([file.path]),
      for (final file
          in Directory(p.join(inDir, 'supported_use_cases', 'leanpipe'))
              .listFiles())
        GeneratorScript.path([file.path]),
      GeneratorScript.path(
        ['**/*.cs'],
        exclude: ['**/Dto.cs'],
        directory: p.join(inDir, 'project/globs'),
      ),
      // FIXME: figure out why csproj files have now version 9.9.9.9-internal
      // GeneratorScript.project([
      //   p.join(inDir, 'project/aggregated/Combined/Combined.csproj'),
      // ]),
      // GeneratorScript.project([
      //   p.join(inDir, 'project/aggregated/A/A.csproj'),
      //   p.join(inDir, 'project/aggregated/B/B.csproj'),
      //   p.join(inDir, 'project/aggregated/B/B.csproj'),
      // ]),
      GeneratorScript.path(['example/ExampleContracts/**']),
    ];

    for (final generatorScript in generatorScripts) {
      test(generatorScript.args.join(' '), () async {
        await ContractsGenerator(
          ContractsGeneratorConfig(
            input: generatorScript,
            output: Directory(outDir),
            extra: '// :)',
            include: RegExp('.*'),
          ),
        ).writeAll();

        await File(mainPath).writeAsString(
          '''
        import 'contracts.dart';

        void main() {
          print('Hello');
        }
        ''',
        );

        final result = await Process.run('dart', ['run', mainPath]);

        if (result.exitCode != 0) {
          stderr
            ..writeln('\nFailed to compile generated contracts:')
            ..writeln(result.stderr)
            ..writeln(
              File(p.join(outDir, 'contracts.dart')).readAsStringSync(),
            );
        }
        expect(result.exitCode, 0);
      });
    }
  });
}

extension on Directory {
  Iterable<File> listFiles() => listSync().whereType<File>();
}
