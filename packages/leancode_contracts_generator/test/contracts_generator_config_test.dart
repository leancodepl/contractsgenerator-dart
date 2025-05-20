import 'package:leancode_contracts_generator/src/contracts_generator_config.dart';
import 'package:test/test.dart';
import 'package:yaml/yaml.dart';

void main() {
  group('contracts yaml config parsing', () {
    const whateverInput = 'input: {project: [""]}';
    const nonStringYamlValues = ['{}', '', 'true', '[]', '123'];

    group('defaults', () {
      final defaultYaml =
          loadYaml(ContractsGeneratorConfig.defaultYamlConfig) as Map;
      final defaultName = defaultYaml['name'] as String;
      final defaultInclude = defaultYaml['include'] as String;
      final defaultOutput = defaultYaml['output'] as String;
      final defaultExtra = defaultYaml['extra'] as String;

      test('uses default values', () {
        final config = ContractsGeneratorConfig.fromYaml(whateverInput);

        expect(config.name, defaultName);
        expect(config.include.pattern, defaultInclude);
        expect(config.output.path, defaultOutput);
        expect(config.extra, defaultExtra);
      });

      test('user config overrides defaults', () {
        const differentValue = 'different';
        final config = ContractsGeneratorConfig.fromYaml(
          '''
          $whateverInput
          name: $differentValue
          include: $differentValue
          output: $differentValue
          extra: $differentValue
          ''',
        );

        expect(config.name, differentValue);
        expect(config.include.pattern, differentValue);
        expect(config.output.path, differentValue);
        expect(config.extra, differentValue);
      });
    });

    group('input parameter', () {
      test('has to be specified', () {
        expect(
          () => ContractsGeneratorConfig.fromYaml('{}'),
          throwsA(isA<ArgumentError>()),
        );

        expect(
          () => ContractsGeneratorConfig.fromYaml(
            '''
            input:
              unknown: {}
            ''',
          ),
          throwsA(isA<ArgumentError>()),
        );

        expect(
          () => ContractsGeneratorConfig.fromYaml('input:'),
          throwsA(isA<ArgumentError>()),
        );
      });

      test('cannot use multiple methods', () {
        expect(
          () => ContractsGeneratorConfig.fromYaml(
            '''
            input:
              path:
                include: [""]
              project: [""]
            ''',
          ),
          throwsA(isA<ArgumentError>()),
        );
      });

      test('correctly parses path method', () {
        expect(
          () => ContractsGeneratorConfig.fromYaml(
            'input: {path: {include: [foo], exclude: [foo], directory: foo}}',
          ),
          returnsNormally,
        );
      });

      test('correctly parses project method', () {
        expect(
          () =>
              ContractsGeneratorConfig.fromYaml('input: {project: [foo, bar]}'),
          returnsNormally,
        );
      });
    });

    group('name field', () {
      test('is a string', () {
        for (final value in nonStringYamlValues) {
          expect(
            () => ContractsGeneratorConfig.fromYaml(
              '''
              $whateverInput
              name: $value
              ''',
            ),
            throwsA(isA<ArgumentError>()),
          );
        }
      });
    });

    group('include field', () {
      test('is a string', () {
        for (final value in nonStringYamlValues) {
          expect(
            () => ContractsGeneratorConfig.fromYaml(
              '''
              $whateverInput
              include: $value
              ''',
            ),
            throwsA(isA<ArgumentError>()),
          );
        }
      });

      test('is a valid regex', () {
        expect(
          () => ContractsGeneratorConfig.fromYaml(
            '''
              $whateverInput
              include: "[("
              ''',
          ),
          throwsA(isA<FormatException>()),
        );
      });
    });

    group('output field', () {
      test('is a string', () {
        for (final value in nonStringYamlValues) {
          expect(
            () => ContractsGeneratorConfig.fromYaml(
              '''
              $whateverInput
              output: $value
              ''',
            ),
            throwsA(isA<ArgumentError>()),
          );
        }
      });
    });

    group('directives field', () {
      test('is a string', () {
        for (final value in nonStringYamlValues) {
          expect(
            () => ContractsGeneratorConfig.fromYaml(
              '''
              $whateverInput
              directives: $value
              ''',
            ),
            throwsA(isA<ArgumentError>()),
          );
        }
      });
    });

    group('extra field', () {
      test('is a string', () {
        for (final value in nonStringYamlValues) {
          expect(
            () => ContractsGeneratorConfig.fromYaml(
              '''
              $whateverInput
              extra: $value
              ''',
            ),
            throwsA(isA<ArgumentError>()),
          );
        }
      });
    });
  });
}
