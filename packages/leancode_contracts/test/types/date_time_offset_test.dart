import 'package:leancode_contracts/leancode_contracts.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

final throwsAssertionError = throwsA(isA<AssertionError>());

void main() {
  group('DateTimeOffset', () {
    test('accepts correct dates', () {
      expect(
        DateTimeOffset(DateTime.utc(1999, 1, 29), 0),
        isA<DateTimeOffset>(),
      );
      expect(
        DateTimeOffset(DateTime.utc(0), Duration.minutesPerHour * 14),
        isA<DateTimeOffset>(),
      );
      expect(
        DateTimeOffset(
          DateTime.utc(23030, 12, 31),
          -Duration.minutesPerHour * 14,
        ),
        isA<DateTimeOffset>(),
      );
    });

    test('rejects non-UTC datetimes', () {
      expect(
        () => DateTimeOffset(DateTime.now().toLocal(), 0),
        throwsAssertionError,
      );
    });

    test('rejects offsets with a too large magnitude', () {
      expect(
        () => DateTimeOffset(
          DateTime.now().toUtc(),
          Duration.minutesPerHour * 14 + 1,
        ),
        throwsAssertionError,
      );
      expect(
        () => DateTimeOffset(
          DateTime.now().toUtc(),
          -Duration.minutesPerHour * 14 - 1,
        ),
        throwsAssertionError,
      );
    });

    test('offset getter', () {
      expect(DateTimeOffset(DateTime.now().toUtc(), 0).offset, Duration.zero);
      expect(
        DateTimeOffset(DateTime.now().toUtc(), -1).offset,
        const Duration(minutes: -1),
      );
      expect(
        DateTimeOffset(DateTime.now().toUtc(), 1).offset,
        const Duration(minutes: 1),
      );
    });

    test('date getter', () {
      final dt1 = DateTime.parse('2022-06-15T08:54:44.923464+02:00');
      final dt2 = DateTime.parse('2022-06-15T08:54:44.923464-03:00');
      final dt3 = DateTime.parse('2022-06-15T08:54:44.923464Z');

      const off1 = 0;
      const off2 = 3 * Duration.minutesPerHour + 9;
      const off3 = -(12 * Duration.minutesPerHour + 39);

      expect(
        DateTimeOffset(dt1, off1).date,
        DateOnly(2022, 6, 15),
      );
      expect(
        DateTimeOffset(dt2, off2).date,
        DateOnly(2022, 6, 15),
      );
      expect(
        DateTimeOffset(dt3, off3).date,
        DateOnly(2022, 6, 14),
      );
    });

    test('time getter', () {
      final dt1 = DateTime.parse('2022-06-15T08:54:44.923464+02:00');
      final dt2 = DateTime.parse('2022-06-15T08:54:44.923464-03:00');
      final dt3 = DateTime.parse('2022-06-15T08:54:44.923464Z');

      const off1 = 0;
      const off2 = 3 * Duration.minutesPerHour + 9;
      const off3 = -(12 * Duration.minutesPerHour + 39);

      expect(
        DateTimeOffset(dt1, off1).time,
        TimeOnly(
          const Duration(
            hours: 6,
            minutes: 54,
            seconds: 44,
            milliseconds: 923,
            microseconds: 464,
          ),
        ),
      );
      expect(
        DateTimeOffset(dt2, off2).time,
        TimeOnly(
          const Duration(
            hours: 15,
            minutes: 3,
            seconds: 44,
            milliseconds: 923,
            microseconds: 464,
          ),
        ),
      );
      expect(
        DateTimeOffset(dt3, off3).time,
        TimeOnly(
          const Duration(
            hours: 20,
            minutes: 15,
            seconds: 44,
            milliseconds: 923,
            microseconds: 464,
          ),
        ),
      );
    });

    test('serialization', () {
      final dt1 = DateTime.parse('2022-06-15T08:54:44.923464+02:00');
      final dt2 = DateTime.parse('2022-06-15T08:54:44.923464-03:00');
      final dt3 = DateTime.parse('2022-06-15T08:54:44.923464Z');

      const off1 = 0;
      const off2 = 3 * Duration.minutesPerHour + 9;
      const off3 = -(12 * Duration.minutesPerHour + 39);

      expect(
        DateTimeOffset(dt1, off1).toJson(),
        '2022-06-15T06:54:44.923464+00:00',
      );
      expect(
        DateTimeOffset(dt2, off2).toJson(),
        '2022-06-15T15:03:44.923464+03:09',
      );
      expect(
        DateTimeOffset(dt3, off3).toJson(),
        '2022-06-14T20:15:44.923464-12:39',
      );
    });

    group('deserialization', () {
      test('with timezone', () {
        expect(
          DateTimeOffset.fromJson('2022-06-15T08:54:44.923464+02:00'),
          DateTimeOffset(
            DateTime.utc(2022, 6, 15, 6, 54, 44, 923, 464),
            2 * Duration.minutesPerHour,
          ),
        );
        expect(
          DateTimeOffset.fromJson('2022-06-15T08:54:44.923464-03:00'),
          DateTimeOffset(
            DateTime.utc(2022, 6, 15, 11, 54, 44, 923, 464),
            -3 * Duration.minutesPerHour,
          ),
        );
        expect(
          DateTimeOffset.fromJson('2022-06-15T08:54:44.923464Z'),
          DateTimeOffset(
            DateTime.utc(2022, 6, 15, 8, 54, 44, 923, 464),
            0,
          ),
        );
      });

      test('without timezone', () {
        final myTimeZone = DateTime.now().timeZoneOffset;

        expect(
          DateTimeOffset.fromJson('2022-06-15T08:54:44.923464'),
          DateTimeOffset(
            DateTime.utc(2022, 6, 15, 8, 54, 44, 923, 464).subtract(myTimeZone),
            myTimeZone.inMinutes,
          ),
        );
      });
    });
  });
}
