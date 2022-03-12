import 'package:json_annotation/json_annotation.dart';

// System.TimeSpan <-> Duration
// TODO: while https://github.com/google/json_serializable.dart/issues/822
// is not resolved there needs to be two seperate converters for each type

class DurationJsonConverter implements JsonConverter<Duration, String> {
  const DurationJsonConverter();

  static final _matcher =
      RegExp(r'^-?((\d+)\.)?(\d\d):(\d\d):(\d\d)(\.(\d+))?$');

  @override
  Duration fromJson(String json) {
    final m = _matcher.firstMatch(json)!;

    return Duration(
          days: int.parse(m[2] ?? '0'),
          hours: int.parse(m[3]!),
          minutes: int.parse(m[4]!),
          seconds: int.parse(m[5]!),
          microseconds: int.parse(m[7] ?? '0') ~/ 10,
        ) *
        (json.startsWith('-') ? -1 : 1);
  }

  @override
  String toJson(Duration object) {
    if (object.isNegative) {
      return '-${toJson(-object)}';
    }

    return '${object.inDays}.'
        '${object.inHours % Duration.hoursPerDay}:'
        '${object.inMinutes % Duration.minutesPerHour}:'
        '${object.inSeconds % Duration.secondsPerMinute}.'
        '${(object.inMicroseconds % Duration.microsecondsPerSecond).toString().padLeft(6, '0')}';
  }
}

class NullableDurationJsonConverter
    implements JsonConverter<Duration?, String?> {
  const NullableDurationJsonConverter();

  @override
  Duration? fromJson(String? json) {
    return json == null ? null : const DurationJsonConverter().fromJson(json);
  }

  @override
  String? toJson(Duration? object) {
    return object == null ? null : const DurationJsonConverter().toJson(object);
  }
}
