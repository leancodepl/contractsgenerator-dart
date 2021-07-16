import 'dart:io';

import 'package:contracts_generator/contracts_generator.dart';
import 'package:path/path.dart' as p;
import 'package:test/test.dart';

void main() {
  const inDir = 'contractsgenerator/examples';
  const outDir = 'test/out';
  final mainPath = p.join(outDir, 'main.dart');

  tearDown(() {
    final dir = Directory(outDir);
    if (dir.existsSync()) dir.deleteSync(recursive: true);
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
      GeneratorScript.path(p.join(inDir, 'simple/')),
      GeneratorScript.path('example/ExampleContracts'),
      GeneratorScript.file(p.join(inDir, 'properties/composite_types.cs')),
      GeneratorScript.file(p.join(inDir, 'properties/known_types.cs')),
      GeneratorScript.file(
        p.join(inDir, 'supported_use_cases/exclusions.cs'),
      ),
      GeneratorScript.file(
        p.join(inDir, 'supported_use_cases/same_names.cs'),
      ),
      GeneratorScript.file(
        p.join(inDir, 'supported_use_cases/shared_error_codes.cs'),
      ),
    ];

    for (final generatorScript in generatorScripts) {
      test(generatorScript.args.join(' '), () async {
        await ContractsGenerator(
          ContractsGeneratorConfig(
            script: generatorScript,
            output: Directory(outDir),
            extra: '// :)',
            includeNamespaceRegex: RegExp('.*'),
          ),
        ).writeAll();

        await File(mainPath).writeAsString('''
        import 'contracts.dart';

        void main() {
          print(Time(0, 0, 0));
        }
        ''');

        final result = await Process.run('dart', ['run', mainPath]);

        expect(result.exitCode, 0);
      });
    }
  });
}
