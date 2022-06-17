import 'package:leancode_contracts/leancode_contracts.dart';

/// {@template DateTimeOffset}
/// A [DateTime] with a fixed offset
/// {@endtemplate}
class DateTimeOffset {
  /// Constructs a [DateTimeOffset] from a UTC [DateTime] and a given offset in minutes.
  /// Assets that the given [DateTime] is UTC and the given offset is between -14h and 14h (inclusive)
  DateTimeOffset(this.utcDateTime, this.offsetInMinutes)
      : assert(utcDateTime.isUtc),
        assert(offsetInMinutes.abs() <= Duration.minutesPerHour * 14);

  /// Deserializes an ISO 8601 string into [DateTimeOffset].
  /// If no timezone information is present, timestamp is interpreted as local time.
  factory DateTimeOffset.fromJson(String json) {
    final match = _parseFormat.firstMatch(json);

    if (match == null) {
      throw FormatException('Invalid date format', json);
    }

    final int offsetInMinutes;
    final DateTime dateTime;

    if (match[8] != null) {
      final tzSign = match[9];
      if (tzSign != null) {
        final sign = tzSign == '-' ? -1 : 1;
        final hourDifference = int.parse(match[10]!);
        final minuteDifference = match[11] == null ? 0 : int.parse(match[11]!);

        offsetInMinutes = sign *
            (Duration.minutesPerHour * hourDifference + minuteDifference);
      } else {
        offsetInMinutes = 0;
      }

      final iso = json.substring(0, json.length - match[8]!.length);
      dateTime = DateTime.parse('${iso}Z')
          .subtract(Duration(minutes: offsetInMinutes));
    } else {
      final dt = DateTime.parse(json);
      dateTime = dt.toUtc();
      offsetInMinutes = dt.timeZoneOffset.inMinutes;
    }

    return DateTimeOffset(
      dateTime,
      offsetInMinutes,
    );
  }

  /// [DateTimeOffset] at the current instant with local timezone.
  factory DateTimeOffset.now() {
    final now = DateTime.now();

    return DateTimeOffset(
      now.toUtc(),
      now.timeZoneOffset.inMinutes,
    );
  }

  /// UTC [DateTime].
  final DateTime utcDateTime;

  /// Offset in minutes from [utcDateTime].
  final int offsetInMinutes;

  /// [offsetInMinutes] converted to [Duration].
  Duration get offset => Duration(minutes: offsetInMinutes);

  /// [DateTimeOffset] converted to local [DateTime].
  DateTime get localDateTime => utcDateTime.toLocal();

  /// The [DateOnly] when this instant occurred.
  DateOnly get date => DateOnly.fromDateTime(utcDateTime.add(offset));

  /// The [TimeOnly] when this instant occurred.
  TimeOnly get time => TimeOnly.fromDateTime(utcDateTime.add(offset));

  /// Serializes [DateTimeOffset] into a ISO 8601 timestamp.
  String toJson() {
    var iso = utcDateTime.add(offset).toIso8601String();
    iso = iso.substring(0, iso.length - 1);

    final absOffset = offsetInMinutes.abs();

    return '$iso${offsetInMinutes < 0 ? '-' : '+'}'
        '${(absOffset ~/ Duration.minutesPerHour).toString().padLeft(2, '0')}'
        ':${(absOffset % Duration.minutesPerHour).toString().padLeft(2, '0')}';
  }

  @override
  String toString() => toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is DateTimeOffset &&
            utcDateTime == other.utcDateTime &&
            offsetInMinutes == other.offsetInMinutes;
  }

  @override
  int get hashCode => Object.hash(utcDateTime, offsetInMinutes);
}

// taken from Dart's DateTime implementation
final _parseFormat = RegExp(
  r'^([+-]?\d{4,6})-?(\d\d)-?(\d\d)' // Day part.
  r'(?:[ T](\d\d)(?::?(\d\d)(?::?(\d\d)(?:[.,](\d+))?)?)?' // Time part.
  r'( ?[zZ]| ?([-+])(\d\d)(?::?(\d\d))?)?)?$', // Timezone part.
);
