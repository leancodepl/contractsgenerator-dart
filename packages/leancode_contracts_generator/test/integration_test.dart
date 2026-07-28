@Timeout(Duration(minutes: 30))
library;

import 'dart:io';

import 'package:leancode_contracts_generator/leancode_contracts_generator.dart';
import 'package:path/path.dart' as p;
import 'package:test/test.dart';

void main() {
  const inDir = 'contractsgenerator/examples';
  const projDir = 'test/integration_test_project';
  final binDir = p.join(projDir, 'bin');
  final libDir = p.join(projDir, 'lib');
  final mainPath = p.join(binDir, 'integration_test_project.dart');

  tearDown(() {
    final dir = Directory(libDir);
    if (dir.existsSync()) {
      dir.deleteSync(recursive: true);
    }
    File(mainPath).writeAsStringSync('void main() {}\n');
  });

  group('final contract compilation', () {
    final generatorScripts = [
      for (final file in Directory(p.join(inDir, 'attributes')).listFiles())
        GeneratorScript.path([file.path]),
      for (final file in Directory(p.join(inDir, 'notifications')).listFiles())
        GeneratorScript.path([file.path]),
      for (final file in Directory(p.join(inDir, 'properties')).listFiles())
        // Binary as Map key not working yet
        // See: https://github.com/google/json_serializable.dart/issues/1393
        if (!file.path.endsWith('binary.cs')) GeneratorScript.path([file.path]),
      for (final file in Directory(p.join(inDir, 'simple')).listSync())
        GeneratorScript.path([file.path]),
      for (final file in Directory(
        p.join(inDir, 'supported_use_cases'),
      ).listFiles())
        GeneratorScript.path([file.path]),
      for (final file in Directory(
        p.join(inDir, 'supported_use_cases', 'leanpipe'),
      ).listFiles())
        GeneratorScript.path([file.path]),
      GeneratorScript.path(
        ['**/*.cs'],
        exclude: ['**/Dto.cs'],
        directory: p.join(inDir, 'project/globs'),
      ),
      GeneratorScript.project([
        p.join(inDir, 'project/implicitusings/implicitusings.csproj'),
      ]),
      GeneratorScript.project([
        p.join(inDir, 'project/packagereference/packagereference.csproj'),
      ]),
      GeneratorScript.project([
        p.join(inDir, 'project/referencetoembedded/referencetoembedded.csproj'),
      ]),
      GeneratorScript.project([p.join(inDir, 'project/single/single.csproj')]),
      GeneratorScript.project([
        p.join(inDir, 'project/aggregated/A/A.csproj'),
        p.join(inDir, 'project/aggregated/B/B.csproj'),
        p.join(inDir, 'project/aggregated/B/B.csproj'),
      ]),
      GeneratorScript.project([
        p.join(inDir, 'project/aggregated/Combined/Combined.csproj'),
        p.join(inDir, 'project/aggregated/B/B.csproj'),
        p.join(inDir, 'project/aggregated/B/B.csproj'),
      ]),
      GeneratorScript.path(['example/ExampleContracts/**']),
    ];

    for (final generatorScript in generatorScripts) {
      test(generatorScript.args.join(' '), () async {
        await ContractsGenerator(
          ContractsGeneratorConfig(
            input: generatorScript,
            output: Directory(libDir),
            extra: '// :)',
            include: RegExp('.*'),
          ),
        ).writeAll();

        Directory(binDir).createSync(recursive: true);
        File(mainPath).writeAsStringSync('''
        import 'package:integration_test_project/contracts.dart';

        void main() {
          print('Hello');
        }
        ''');

        final jsonResult = await Process.run('dart', [
          'run',
          'build_runner',
          'build',
        ], workingDirectory: projDir);
        if (jsonResult.exitCode != 0) {
          stderr
            ..writeln('\nFailed to generate JSON serialization for contracts:')
            ..writeln(jsonResult.stderr)
            ..writeln(
              File(p.join(projDir, 'lib', 'contracts.dart')).readAsStringSync(),
            );
        }
        expect(jsonResult.exitCode, 0);

        final result = await Process.run('dart', [
          'run',
        ], workingDirectory: projDir);

        if (result.exitCode != 0) {
          stderr
            ..writeln('\nFailed to compile generated contracts:')
            ..writeln(result.stderr)
            ..writeln(
              File(p.join(projDir, 'lib', 'contracts.dart')).readAsStringSync(),
            );
        }
        expect(result.exitCode, 0);
      });
    }
  });

  // generic DTOs and their subclasses must not just compile — the whole graph
  // has to survive jsonEncode and round-trip back to an equal value.
  test('generic DTOs round-trip via jsonEncode', () async {
    await ContractsGenerator(
      ContractsGeneratorConfig(
        input: GeneratorScript.path(['example/ExampleContracts/**']),
        output: Directory(libDir),
        extra: '// :)',
        include: RegExp('.*'),
      ),
    ).writeAll();

    Directory(binDir).createSync(recursive: true);
    File(mainPath).writeAsStringSync(_roundTripMain);

    final build = await Process.run('dart', [
      'run',
      'build_runner',
      'build',
    ], workingDirectory: projDir);
    expect(build.exitCode, 0, reason: build.stderr.toString());

    final run = await Process.run('dart', ['run'], workingDirectory: projDir);
    expect(run.exitCode, 0, reason: '${run.stdout}${run.stderr}');
  });
}

extension on Directory {
  Iterable<File> listFiles() => listSync().whereType<File>();
}

// Builds the fixtures — a generic DTO as a concrete field, a concrete
// subclass and a generic subclass — encodes and decodes them, and throws
// (→ failing test) if the value doesn't survive the trip.
const _roundTripMain = '''
import 'dart:convert';

import 'package:integration_test_project/contracts.dart';

void main() {
  final response = SearchResponse(
    page: PaginatedResult<User>(items: [User(id: '1', name: 'a')], totalCount: 1),
    allUsers: AllUsersResult(items: [User(id: '2', name: 'b')], totalCount: 1),
    children: ChildResult<User>(
      items: [User(id: '3', name: 'c')],
      totalCount: 1,
      extras: [User(id: '4', name: 'd')],
    ),
  );

  final decoded = SearchResponse.fromJson(
    jsonDecode(jsonEncode(response)) as Map<String, dynamic>,
  );
  if (decoded != response) {
    throw StateError('round-trip changed the value');
  }
}
''';
