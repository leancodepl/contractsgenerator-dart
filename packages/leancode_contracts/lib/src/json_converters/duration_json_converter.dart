import 'dart:math';

import 'package:json_annotation/json_annotation.dart';

// TODO: while https://github.com/google/json_serializable.dart/issues/822
// is not resolved there needs to be two seperate converters for each type

/// {@template DurationJsonConverter}
/// Converter for converting between C#'s `System.TimeSpan` and Dart's [Duration]
/// {@endtemplate}
class DurationJsonConverter implements JsonConverter<Duration, String> {
  /// {@macro DurationJsonConverter}
  const DurationJsonConverter();

  static final _matcher =
      RegExp(r'^-?((\d+)\.)?(\d\d):(\d\d):(\d\d)(\.(\d+))?$');

  @override
  Duration fromJson(String json) {
    final m = _matcher.firstMatch(json)!;
    final last = m[7] ?? '0';
    final smallest = last.substring(0, min(6, last.length));

    return Duration(
          days: int.parse(m[2] ?? '0'),
          hours: int.parse(m[3]!),
          minutes: int.parse(m[4]!),
          seconds: int.parse(m[5]!),
          microseconds:
              int.parse(smallest) * pow(10, 6 - smallest.length) as int,
        ) *
        (json.startsWith('-') ? -1 : 1);
  }

  @override
  String toJson(Duration object) {
    if (object.isNegative) {
      return '-${toJson(-object)}';
    }

    return '${object.inDays}'
        '.${(object.inHours % Duration.hoursPerDay).toString().padLeft(2, '0')}'
        ':${(object.inMinutes % Duration.minutesPerHour).toString().padLeft(2, '0')}'
        ':${(object.inSeconds % Duration.secondsPerMinute).toString().padLeft(2, '0')}'
        '.${(object.inMicroseconds % Duration.microsecondsPerSecond).toString().padLeft(6, '0')}';
  }
}

/// {@template NullableDurationJsonConverter}
/// Nullable converter for converting between C#'s `System.TimeSpan` and Dart's [Duration].
/// {@endtemplate}
class NullableDurationJsonConverter
    implements JsonConverter<Duration?, String?> {
  /// {@macro NullableDurationJsonConverter}
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
