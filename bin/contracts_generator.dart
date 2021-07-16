import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:collection/collection.dart';
import 'package:contracts_generator/src/contracts_generator.dart';
import 'package:contracts_generator/src/contracts_generator_config.dart';
import 'package:path/path.dart' as p;

const configFileName = 'contracts-generator.yaml';

Future<void> main(List<String> arguments) async {
  final initCommand = InitCommand();
  final runner = CommandRunner<void>(
    'dart run contracts_generator',
    'Command line utility for generating dart CQRS contracts',
  )..addCommand(initCommand);

  if (arguments.isEmpty) {
    final configFile = File(configFileName);
    if (!await configFile.exists()) {
      stderr.writeln(
        'No $configFileName config file found in the current directory. Did you run `${runner.executableName} ${initCommand.name}`?',
      );
      exit(1);
    }

    final generator = ContractsGenerator(
      ContractsGeneratorConfig.fromYaml(await configFile.readAsString()),
    );

    await generator.writeAll();
    exit(0);
  }

  await runner.run(arguments).catchError((dynamic err) {
    stderr.writeln(err);
    exit(1);
  });
}

class InitCommand extends Command<void> {
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
  Future<void> run() async {
    final dir = argResults!.rest.firstOrNull ?? '.';

    await File(p.join(dir, configFileName))
        .writeAsString(ContractsGeneratorConfig.defaultYamlConfig);

    exit(0);
  }
}
