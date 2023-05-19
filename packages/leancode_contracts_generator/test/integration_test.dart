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
      GeneratorScript.project([p.join(inDir, 'project/single/single.csproj')]),
      GeneratorScript.project([
        p.join(inDir, 'project/aggregated/Combined/Combined.csproj'),
      ]),
      GeneratorScript.project([
        p.join(inDir, 'project/aggregated/A/A.csproj'),
        p.join(inDir, 'project/aggregated/B/B.csproj'),
      ]),
      for (final file in Directory(p.join(inDir, 'simple')).listSync())
        GeneratorScript.path([file.path]),
      GeneratorScript.path(['example/ExampleContracts/**']),
      GeneratorScript.path([p.join(inDir, 'properties/composite_types.cs')]),
      GeneratorScript.path([p.join(inDir, 'properties/known_types.cs')]),
      GeneratorScript.path([
        p.join(inDir, 'supported_use_cases/exclusions.cs'),
      ]),
      GeneratorScript.path([
        p.join(inDir, 'supported_use_cases/same_names.cs'),
      ]),
      GeneratorScript.path([
        p.join(inDir, 'supported_use_cases/shared_error_codes.cs'),
      ]),
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

        expect(result.exitCode, 0);
      });
    }
  });
}
