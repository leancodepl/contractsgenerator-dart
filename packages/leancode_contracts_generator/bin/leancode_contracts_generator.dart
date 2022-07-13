import 'dart:io';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:leancode_contracts_generator/leancode_contracts_generator.dart';

import 'init_command.dart';

const configFileName = 'contracts_generator.yaml';
const verboseFlag = 'verbose';

Future<void> main(List<String> arguments) async {
  final runner = GeneratorCommandRunner();

  try {
    final statusCode = await runner.run(arguments) ?? 0;
    exit(statusCode);
  } on ContractsGeneratorException catch (err) {
    printError(err.message);
  } catch (err, st) {
    stderr
      ..writeln(err)
      ..writeln(st);
    printError(
      'An unknown error occurred, this is most likely a bug. '
      'Please consider reporting it with the above error.',
    );
  }

  exit(1);
}

class GeneratorCommandRunner extends CommandRunner<int> {
  GeneratorCommandRunner()
      : _initCommand = InitCommand(),
        super(
          'leancode_contracts_generator',
          'Command line utility for generating dart CQRS contracts',
        ) {
    addCommand(_initCommand);

    argParser.addFlag(
      verboseFlag,
      abbr: 'v',
      help: 'Increase logging.',
      negatable: false,
    );
  }

  final InitCommand _initCommand;

  @override
  Future<int?> run(Iterable<String> args) async {
    final parsedArgs = argParser.parse(args);
    final verbose = parsedArgs.verbose;

    if (parsedArgs.command == null) {
      final configFile = File(configFileName);
      if (!configFile.existsSync()) {
        printError(
          'No $configFileName config file found in the current directory. Did you run `$executableName ${_initCommand.name}`?',
        );
        return 1;
      }

      final generator = ContractsGenerator(
        ContractsGeneratorConfig.fromYaml(await configFile.readAsString()),
        verbose: verbose,
      );

      await generator.writeAll();
      return 0;
    }

    return super.run(args);
  }
}

void printError(String message) {
  stderr.writeln('\x1B[31m$message\x1B[0m');
}

extension ArgResultsX on ArgResults {
  bool get verbose => this[verboseFlag] as bool;
}
