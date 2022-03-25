import '../json_converters/duration_json_converter.dart';

/// {@template TimeOnly}
/// Represents a time of day, as would be read from a clock, within the range 00:00:00 to 23:59:59.999999.
/// {@endtemplate}
class TimeOnly {
  /// Constructs a [TimeOnly] from [Duration] and asserts that it represents a valid time.
  const TimeOnly(this.source)
      : assert(source < const Duration(days: 1) && source >= Duration.zero);

  /// Deserializes a string into [TimeOnly]
  TimeOnly.fromJson(String json)
      : this(const DurationJsonConverter().fromJson(json));

  /// [Duration] representation of [TimeOnly]
  final Duration source;

  /// Hour part of the time.
  int get hour => source.inHours % Duration.hoursPerDay;

  /// Minute part of the time.
  int get minute => source.inMinutes % Duration.minutesPerHour;

  /// Second part of the time.
  int get second => source.inSeconds % Duration.secondsPerMinute;

  /// Microsecond part of the time.
  int get microsecond => source.inMicroseconds % Duration.microsecondsPerSecond;

  /// Serializes [TimeOnly] to a string.
  String toJson() => const DurationJsonConverter().toJson(source);

  @override
  String toString() => source.toString();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is TimeOnly && source == other.source;
  }

  @override
  int get hashCode => source.hashCode;
}
