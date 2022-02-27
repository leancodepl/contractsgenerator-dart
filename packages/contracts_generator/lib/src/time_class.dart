import 'package:code_builder/code_builder.dart';

import 'json_converters/duration_json_converter.dart';

const timeClassName = 'TimeOnly';

final timeClass = Class(
  (b) => b
    ..name = timeClassName
    ..fields.addAll([
      Field(
        (b) => b
          ..name = '_source'
          ..type = refer('Duration')
          ..modifier = FieldModifier.final$,
      ),
      Field(
        (b) => b
          ..name = 'get hour => _source.inHours % Duration.hoursPerDay'
          ..type = refer('int'),
      ),
      Field(
        (b) => b
          ..name = 'get minute => _source.inMinutes % Duration.minutesPerHour'
          ..type = refer('int'),
      ),
      Field(
        (b) => b
          ..name = 'get second => _source.inSeconds % Duration.secondsPerMinute'
          ..type = refer('int'),
      ),
      Field(
        (b) => b
          ..name =
              'get microsecond => _source.inMicroseconds % Duration.microsecondsPerSecond'
          ..type = refer('int'),
      ),
      Field(
        (b) => b
          ..name = 'get props => [_source]'
          ..type = refer(''),
      ),
    ])
    ..mixins.add(refer('EquatableMixin'))
    ..constructors.addAll([
      Constructor(
        (b) => b
          ..requiredParameters.addAll([
            Parameter(
              (b) => b
                ..name = '_source'
                ..toThis = true,
            ),
          ])
          ..initializers.add(
            const Code(
              'assert(_source < const Duration(days: 1) && !_source.isNegative)',
            ),
          ),
      ),
      Constructor(
        (b) => b
          ..name = 'fromJson'
          ..requiredParameters.add(
            Parameter(
              (b) => b
                ..name = 'json'
                ..type = refer('String'),
            ),
          )
          ..initializers.add(
            Code('this(const ${durationJsonConverter.name}().fromJson(json))'),
          ),
      )
    ])
    ..methods.add(
      Method(
        (b) => b
          ..name = 'toJson'
          ..lambda = true
          ..returns = refer('String')
          ..body =
              Code('const ${durationJsonConverter.name}().toJson(_source)'),
      ),
    )
    ..docs.add('/// [TimeOfDay] but with microseconds precision'),
);
