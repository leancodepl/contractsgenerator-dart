import 'dart:io';

import 'package:args/args.dart';
import 'package:contracts_generator/contracts_generator.dart';

Future<void> main(List<String> arguments) async {
  final parser = ArgParser();
  parser
    ..addFlag(
      'help',
      abbr: 'h',
      negatable: false,
      help: 'Show this help',
      callback: (showHelp) {
        if (showHelp) showUsage(parser);
      },
    )
    ..addOption(
      'name',
      abbr: 'n',
      defaultsTo: 'contracts',
      help: 'Name of the output dart file',
    )
    ..addOption(
      'project',
      abbr: 'p',
      help: '.csproj file for the contracts project',
      mandatory: true,
      callback: (project) async {
        if (!File(project!).existsSync()) {
          showUsage(parser, message: 'Passed --project does not exist');
        }
      },
    )
    ..addOption(
      'include-regex',
      abbr: 'i',
      help: 'Regex to filter-in namespaced statements',
      callback: (includeRegex) {
        try {
          RegExp(includeRegex ?? '');
        } on FormatException {
          showUsage(
            parser,
            message: 'Malformed regex passed to --include-regex',
          );
        }
      },
    )
    ..addOption(
      'output',
      abbr: 'o',
      defaultsTo: 'lib/data',
      help: 'Output directory',
    )
    ..addOption(
      'extra',
      abbr: 'e',
      help:
          'Text to be added in generated contracts file between imports and statements',
    );

  final res = parser.parse(arguments);

  if (res.wasParsed('help')) showUsage(parser);

  final name = res['name'] as String;
  final project = res['project'] as String;
  final includeRegex = res['include-regex'] as String?;
  final output = res['output'] as String;
  final extra = res['extra'] as String?;

  final generator = ContractsGenerator(
    ContractsGeneratorConfig(
      project: File(project),
      name: name,
      includeNamespaceRegex: includeRegex != null ? RegExp(includeRegex) : null,
      output: Directory(output),
      extra: extra ?? '',
    ),
  );

  await generator.writeAll();
}

Never showUsage(ArgParser parser, {String? message}) {
  if (message != null) stderr.write('\x1B[31m$message\x1B[0m\n\n');

  stdout.write('''
Command line utility for generating dart CQRS contracts

OPTIONS:
    ${parser.usage.split('\n').join('\n    ')}

EXAMPLES:
    exe -p ../backend/src/Core/ProjectName.Core.Contracts/ProjectName.Core.Contracts.csproj -i "ProjectName\\.Core\\.Contracts\\.(Mobile|Shared)"
''');

  exit(message == null ? 0 : 1);
}
