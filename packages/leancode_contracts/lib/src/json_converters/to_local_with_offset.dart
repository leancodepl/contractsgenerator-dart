/// Serializes a given [DateTime] to an ISO 8601 timestamp with a local timezone offset.
///
/// Example:
///
/// ```dart
/// final date = DateTime.parse("2022-06-15T08:47:56.953419-02:00");
///
/// // in Warsaw, Poland
/// print(toLocalWithOffset(date)) // 2022-06-15T12:47:56.953419+02:00
/// ```
String toLocalWithOffset(DateTime date) {
  final dt = date.toLocal();
  var iso = dt.toIso8601String();
  if (iso.endsWith('Z')) {
    iso = iso.substring(0, iso.length - 1);
  }

  final duration = dt.timeZoneOffset;

  return '$iso${duration.isNegative ? '-' : '+'}'
      '${duration.inHours.toString().padLeft(2, '0')}'
      ':${(duration.inMinutes - duration.inHours * 60).toString().padLeft(2, '0')}';
}
