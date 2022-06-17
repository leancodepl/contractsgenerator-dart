/// {@template DateOnly}
/// Represents a single day
/// {@endtemplate}
class DateOnly implements Comparable<DateOnly> {
  /// Constructs a [DateOnly] from [DateTime] and asserts that it represents a valid time.
  DateOnly(int year, int month, int day)
      : this.fromDateTime(DateTime(year, month, day));

  /// Constructs a [DateOnly] from [DateTime]
  DateOnly.fromDateTime(DateTime source)
      : source = DateTime(source.year, source.month, source.day),
        assert(source.year >= 0);

  /// Deserializes a string into [DateOnly]
  factory DateOnly.fromJson(String json) {
    final parts = json.split('-');
    return DateOnly(
      int.parse(parts[0]),
      int.parse(parts[1]),
      int.parse(parts[2]),
    );
  }

  /// [DateTime] representation of [DateOnly]
  final DateTime source;

  /// Year of the date
  int get year => source.year;

  /// Month of the year (1-indexed)
  int get month => source.month;

  /// Day of the month (1-indexed)
  int get day => source.day;

  /// Serializes [DateOnly] to a string.
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
        other is DateOnly && source == other.source;
  }

  @override
  int get hashCode => source.hashCode;

  @override
  int compareTo(DateOnly other) {
    return source.compareTo(other.source);
  }
}
