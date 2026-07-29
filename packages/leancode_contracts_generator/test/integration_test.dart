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

  // Types extending/implementing a generic base must not just compile — the
  // whole graph has to survive jsonEncode and round-trip back to an equal value.
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

// Builds a fixture for each shape that gets a `toJson` override — generic DTO
// inheritance, concrete DTOs implementing several generic interfaces, a query
// implementing one, and generic implementers that forward their type variable —
// encodes and decodes each, and throws (→ failing test) on any that doesn't
// survive the trip.
const _roundTripMain = r'''
import 'dart:convert';

import 'package:integration_test_project/contracts.dart';

Map<String, dynamic> _enc(Object value) =>
    jsonDecode(jsonEncode(value)) as Map<String, dynamic>;

User _user(Object? json) => User.fromJson(json as Map<String, dynamic>);

void _expect(Object value, Object decoded) {
  if (decoded != value) {
    throw StateError('round-trip changed the value: $value != $decoded');
  }
}

void main() {
  final a = User(id: '1', name: 'a');
  final b = User(id: '2', name: 'b');
  final c = User(id: '3', name: 'c');
  final page = PaginatedResult<User>(items: [a], totalCount: 1);

  // generic DTO used as a field, a concrete subclass and a generic subclass
  final response = SearchResponse(
    page: page,
    allUsers: AllUsersResult(items: [b], totalCount: 1),
    children: ChildResult<User>(items: [c], totalCount: 1, extras: [a]),
  );
  _expect(response, SearchResponse.fromJson(_enc(response)));

  // concrete DTOs implementing several generic interfaces (unused `Never` slots)
  final same = SameFacets(first: a, second: b);
  _expect(same, SameFacets.fromJson(_enc(same)));

  final mixed = MixedFacets(first: a, second: page);
  _expect(mixed, MixedFacets.fromJson(_enc(mixed)));

  final differentArity = DifferentArityFacets(first: a, left: b, right: page);
  _expect(differentArity, DifferentArityFacets.fromJson(_enc(differentArity)));

  final clashingArity = ClashingArityFacets(first: a, left: page, right: b);
  _expect(clashingArity, ClashingArityFacets.fromJson(_enc(clashingArity)));

  // a query implementing a generic interface, and one combined with a 2-arity one
  final query = FacetQueryUser(facet: a);
  _expect(query, FacetQueryUser.fromJson(_enc(query)));

  final combined = FacetQueryCombined(facet: a, left: b, right: page);
  _expect(combined, FacetQueryCombined.fromJson(_enc(combined)));

  // generic implementers forwarding their own type variable
  final forwarded = ForwardedAtSecondPosition<User>(first: a, left: b, right: c);
  _expect(
    forwarded,
    ForwardedAtSecondPosition<User>.fromJson(_enc(forwarded), _user),
  );

  final concreteClash = ForwardedVarWithConcreteClash<User>(first: a, second: b);
  _expect(
    concreteClash,
    ForwardedVarWithConcreteClash<User>.fromJson(_enc(concreteClash), _user),
  );

  final twoVars = TwoForwardedVars<User, User>(first: a, second: b);
  _expect(
    twoVars,
    TwoForwardedVars<User, User>.fromJson(_enc(twoVars), _user, _user),
  );

  // one variable bound at both positions of a base (forwarded once, then unused)
  final boundTwice = VarBoundTwice<User>(left: a, right: b);
  _expect(boundTwice, VarBoundTwice<User>.fromJson(_enc(boundTwice), _user));
}
''';
