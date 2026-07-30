@Timeout(Duration(minutes: 10))
library;

import 'dart:io';

import 'package:test/test.dart';

void main() {
  test('generic contracts with enum args round-trip through the example', () async {
    const dir = 'example';
    final get = await Process.run('dart', ['pub', 'get'], workingDirectory: dir);
    expect(get.exitCode, 0, reason: get.stderr.toString());

    final build = await Process.run(
      'dart',
      ['run', 'build_runner', 'build', '--delete-conflicting-outputs'],
      workingDirectory: dir,
    );
    expect(build.exitCode, 0, reason: '${build.stdout}${build.stderr}');

    final run = await Process.run(
      'dart',
      ['run', 'bin/example.dart'],
      workingDirectory: dir,
    );
    expect(run.exitCode, 0, reason: '${run.stdout}${run.stderr}');
    expect(run.stdout, contains('round-trip OK'));
  });
}
