import 'dart:io';

import 'package:meta/meta.dart';

@useResult
void Function() verboseLog({required String message, required bool verbose}) {
  if (!verbose) {
    return () {};
  }

  final sw = Stopwatch()..start();

  stdout.write('$message. ');

  return () {
    stdout.writeln('Done in ${sw.elapsed}');
  };
}
