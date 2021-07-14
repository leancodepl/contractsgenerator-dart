import 'dart:io';

import 'package:contracts_generator/contracts_generator.dart';
import 'package:path/path.dart' as p;
import 'package:test/test.dart';

void main() {
  const outDir = 'test/out';
  final mainPath = p.join(outDir, 'main.dart');

  tearDown(() {
    final dir = Directory(outDir);
    if (dir.existsSync()) dir.deleteSync(recursive: true);
  });

  group('final contract compilation', () {
    final testFiles = Directory('test/pb').listSync().whereType<File>();

    for (final testFile in testFiles) {
      test(testFile, () async {
        final basename = p.basenameWithoutExtension(testFile.path);

        await ContractsGenerator(
          ContractsGeneratorConfig(
            pbFile: testFile,
            name: basename,
            output: Directory(outDir),
            extra: '// :)',
            includeNamespaceRegex: RegExp('.*'),
          ),
        ).writeAll();

        await File(mainPath).writeAsString('''
        import '$basename.dart';

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
