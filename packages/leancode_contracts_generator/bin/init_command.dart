import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:collection/collection.dart';
import 'package:leancode_contracts_generator/leancode_contracts_generator.dart';
import 'package:leancode_contracts_generator/src/utils/verbose_log.dart';
import 'package:path/path.dart' as p;

import 'leancode_contracts_generator.dart';

class InitCommand extends Command<int> {
  @override
  final name = 'init';
  @override
  final description = 'Initialize a config file';

  @override
  String get invocation {
    final parents = [name];
    for (var command = parent; command != null; command = command.parent) {
      parents.add(command.name);
    }
    parents.add(runner!.executableName);

    final invocation = parents.reversed.join(' ');
    return '$invocation [directory (default: .)]';
  }

  @override
  Future<int> run() async {
    final dir = argResults!.rest.firstOrNull ?? '.';
    final verbose = globalResults!.verbose;

    final done = verboseLog(
      message: 'Initializing config file in $dir',
      verbose: verbose,
    );
    await File(
      p.join(dir, configFileName),
    ).writeAsString(ContractsGeneratorConfig.defaultYamlConfig);
    done();

    return 0;
  }
}
