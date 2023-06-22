/// {@template DateOnly}
/// Represents a single day.
/// {@endtemplate}
class DateOnly implements Comparable<DateOnly> {
  /// Constructs a [DateOnly] from `year`, `month`, and `day`.
  /// Additionally asserts that it represents a valid date.
  DateOnly(this.year, this.month, this.day)
      : assert(
          () {
            final dateTime = DateTime(year, month, day);
            // if the processed components are different, an overflow happened
            return dateTime.year == year &&
                dateTime.month == month &&
                dateTime.day == day;
          }(),
          'components do not form a valid date',
        );

  /// Constructs a [DateOnly] from [DateTime].
  DateOnly.fromDateTime(DateTime source)
      : this(source.year, source.month, source.day);

  /// Deserializes a string into [DateOnly].
  factory DateOnly.fromJson(String json) {
    final parts = json.split('-');
    return DateOnly(
      int.parse(parts[0]),
      int.parse(parts[1]),
      int.parse(parts[2]),
    );
  }

  /// Year of the date.
  final int year;

  /// Month of the year (1-indexed).
  final int month;

  /// Day of the month (1-indexed).
  final int day;

  /// Constructs a local [DateTime] representation of [DateOnly].
  DateTime toDateTimeLocal() => DateTime(year, month, day);

  /// Constructs a UTC [DateTime] representation of [DateOnly].
  DateTime toDateTimeUtc() => DateTime.utc(year, month, day);

  /// Serializes [DateOnly] into a string.
  String toJson() {
    return '${year.toString().padLeft(4, '0')}'
        '-${month.toString().padLeft(2, '0')}'
        '-${day.toString().padLeft(2, '0')}';
  }

  @override
  String toString() => toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is DateOnly &&
            year == other.year &&
            month == other.month &&
            day == other.day;
  }

  @override
  int get hashCode => Object.hash(year, month, day);

  @override
  int compareTo(DateOnly other) {
    final yearCompare = year.compareTo(other.year);
    if (yearCompare != 0) {
      return yearCompare;
    }

    final monthCompare = month.compareTo(other.month);
    if (monthCompare != 0) {
      return monthCompare;
    }

    final dayCompare = day.compareTo(other.day);
    return dayCompare;
  }
}
