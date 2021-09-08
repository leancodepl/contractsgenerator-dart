import 'package:code_builder/code_builder.dart';

const timeClassName = 'Time';

const _timeClassFields = ['hour', 'minute', 'second'];

final timeClass = Class(
  (b) => b
    ..name = timeClassName
    ..fields.addAll([
      for (final name in _timeClassFields)
        Field(
          (b) => b
            ..name = name
            ..modifier = FieldModifier.final$
            ..type = refer('int'),
        ),
      Field(
        (b) => b
          ..name = 'get props => [${_timeClassFields.join(',')}]'
          ..type = refer(''),
      ),
    ])
    ..mixins.add(refer('EquatableMixin'))
    ..constructors.addAll([
      Constructor(
        (b) => b
          ..requiredParameters.addAll([
            for (final name in _timeClassFields)
              Parameter(
                (b) => b
                  ..name = name
                  ..toThis = true,
              ),
          ])
          ..initializers.addAll(const [
            Code('assert(hour >= 0 && hour <= 23)'),
            Code('assert(minute >= 0 && minute <= 59)'),
            Code('assert(second >= 0 && second <= 59)'),
          ])
          ..constant = true,
      ),
      Constructor(
        (b) => b
          ..factory = true
          ..name = 'fromJson'
          ..requiredParameters.add(
            Parameter(
              (b) => b
                ..name = 'json'
                ..type = refer('String'),
            ),
          )
          ..body = const Code(
            """
            final chunks = json.split(':');
            return $timeClassName(int.parse(chunks[0]), int.parse(chunks[1]), int.parse(chunks[2]),);
            """,
          ),
      )
    ])
    ..methods.add(
      Method(
        (b) => b
          ..name = 'toJson'
          ..lambda = true
          ..returns = refer('String')
          ..body = literalString(r'$hour:$minute:$second').code,
      ),
    )
    ..docs.add('/// [TimeOfDay] but with seconds precision'),
);
