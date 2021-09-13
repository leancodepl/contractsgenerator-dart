import 'package:code_builder/code_builder.dart';

// System.TimeSpan <-> Duration

final durationJsonConverter = _create(nullable: false);
final nullableDurationJsonConverter = _create(nullable: true);

Class _create({required bool nullable}) {
  final q = nullable ? '?' : '';

  // losing precision of a single magnitude (1us vs 100ns), fixing it would require making a custom type
  return Class(
    (b) => b
      ..name = '${nullable ? 'Nullable' : ''}DurationJsonConverter'
      ..extend = refer('JsonConverter<Duration$q, String$q>')
      ..constructors.add(Constructor((b) => b..constant = true))
      ..methods.addAll(
        [
          Method(
            (b) => b
              ..name = 'fromJson'
              ..lambda = nullable
              ..returns = refer('Duration$q')
              ..requiredParameters.add(
                Parameter(
                  (b) => b
                    ..type = refer('String$q')
                    ..name = 'json',
                ),
              )
              ..body = Code(
                nullable
                    ? 'json == null ? null : const DurationJsonConverter().fromJson(json)'
                    : r'''
                final m = RegExp(r'^-?((\d+)\.)?(\d\d):(\d\d):(\d\d)(\.(\d+))?$').firstMatch(json)!;
                return Duration(
                  days: int.parse(m[2] ?? '0'),
                  hours: int.parse(m[3]!),
                  minutes: int.parse(m[4]!),
                  seconds: int.parse(m[5]!),
                  microseconds: int.parse(m[7] ?? '0') ~/ 10,
                ) * (json.startsWith('-') ? -1 : 1);
              ''',
              ),
          ),
          Method(
            (b) => b
              ..name = 'toJson'
              ..lambda = nullable
              ..returns = refer('String$q')
              ..requiredParameters.add(
                Parameter(
                  (b) => b
                    ..type = refer('Duration$q')
                    ..name = 'value',
                ),
              )
              ..body = Code(
                nullable
                    ? 'value == null ? null : const DurationJsonConverter().toJson(value)'
                    : r'''
                if (value.isNegative) return '-${toJson(-value)}';

                return '${value.inDays}.'
                    '${value.inHours % Duration.hoursPerDay}:'
                    '${value.inMinutes % Duration.minutesPerHour}:'
                    '${value.inSeconds % Duration.secondsPerMinute}.'
                    '${(value.inMicroseconds % Duration.microsecondsPerSecond).toString().padLeft(6, '0')}';
              ''',
              ),
          ),
        ],
      ),
  );
}
