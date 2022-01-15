import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:collection/collection.dart';
import 'package:contracts_generator/contracts_generator.dart';
import 'package:path/path.dart' as p;

const configFileName = 'contracts_generator.yaml';

Future<void> main(List<String> arguments) async {
  final initCommand = InitCommand();
  final runner = CommandRunner<void>(
    'contracts_generator',
    'Command line utility for generating dart CQRS contracts',
  )..addCommand(initCommand);

  try {
    if (arguments.isEmpty) {
      final configFile = File(configFileName);
      if (!configFile.existsSync()) {
        fatalError(
          'No $configFileName config file found in the current directory. Did you run `${runner.executableName} ${initCommand.name}`?',
        );
      }

      final generator = ContractsGenerator(
        ContractsGeneratorConfig.fromYaml(await configFile.readAsString()),
      );

      await generator.writeAll();
      exit(0);
    }

    await runner.run(arguments);
  } on ContractsGeneratorException catch (err) {
    fatalError(err.message);
  } catch (err, st) {
    stderr
      ..writeln(err)
      ..writeln(st);
    fatalError(
      'An unknown error occurred, this is most likely a bug. '
      'Please consider reporting it with the above error.',
    );
  }
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

Never fatalError(String message) {
  stderr.writeln('\x1B[31m$message\x1B[0m');

  exit(1);
}
