import '../json_converters/duration_json_converter.dart';

/// {@template TimeOnly}
/// Represents a time of day, as would be read from a clock, within the range 00:00:00 to 23:59:59.999999.
/// {@endtemplate}
class TimeOnly implements Comparable<TimeOnly> {
  /// Constructs a [TimeOnly] from the individual components and asserts they represent a valid time.
  const TimeOnly(this.hour, this.minute, this.second, this.microsecond)
      : assert(
          hour >= 0 &&
              hour < 24 &&
              minute >= 0 &&
              minute < 60 &&
              second >= 0 &&
              second < 60 &&
              microsecond >= 0 &&
              microsecond < 1000000,
        );

  /// Constructs a [TimeOnly] from [DateTime] by disregarding the date component.
  TimeOnly.fromDateTime(DateTime source)
      : this(
          source.hour,
          source.minute,
          source.second,
          Duration.microsecondsPerMillisecond * source.millisecond +
              source.microsecond,
        );

  /// Constructs a [TimeOnly] from [Duration].
  TimeOnly.fromDuration(Duration source)
      : this(
          source.inHours,
          source.inMinutes.remainder(Duration.minutesPerHour),
          source.inSeconds.remainder(Duration.secondsPerMinute),
          source.inMicroseconds.remainder(Duration.microsecondsPerSecond),
        );

  /// Deserializes a string into [TimeOnly]
  TimeOnly.fromJson(String json)
      : this.fromDuration(const DurationJsonConverter().fromJson(json));

  /// Hour part of the time in the range `[0; 24)`.
  final int hour;

  /// Minute part of the time in the range `[0; 60)`.
  final int minute;

  /// Second part of the time in the range `[0; 60)`.
  final int second;

  /// Microsecond part of the time in the range `[0; 1000000)`.
  final int microsecond;

  /// Constructs a [Duration] representation of [TimeOnly].
  Duration toDuration() {
    return Duration(
      hours: hour,
      minutes: minute,
      seconds: second,
      microseconds: microsecond,
    );
  }

  /// Serializes [TimeOnly] to a string.
  String toJson() {
    return '${hour.toString().padLeft(2, '0')}'
        ':${minute.toString().padLeft(2, '0')}'
        ':${second.toString().padLeft(2, '0')}'
        '.${microsecond.toString().padLeft(6, '0')}';
  }

  @override
  String toString() => toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is TimeOnly &&
            hour == other.hour &&
            minute == other.minute &&
            second == other.second &&
            microsecond == other.microsecond;
  }

  @override
  int get hashCode => Object.hash(hour, minute, second, microsecond);

  @override
  int compareTo(TimeOnly other) {
    final hourCompare = hour.compareTo(other.hour);
    if (hourCompare != 0) {
      return hourCompare;
    }

    final minuteCompare = minute.compareTo(other.minute);
    if (minuteCompare != 0) {
      return minuteCompare;
    }

    final secondCompare = second.compareTo(other.second);
    if (secondCompare != 0) {
      return secondCompare;
    }

    final microsecondCompare = microsecond.compareTo(other.microsecond);
    return microsecondCompare;
  }
}
