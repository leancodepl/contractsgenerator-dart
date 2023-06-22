import 'package:leancode_contracts/leancode_contracts.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

final throwsAssertionError = throwsA(isA<AssertionError>());

void main() {
  group('TimeOnly', () {
    test('accepts correct durations', () {
      expect(
        TimeOnly.fromDuration(
          const Duration(days: 1) - const Duration(microseconds: 1),
        ),
        isA<TimeOnly>(),
      );
      expect(TimeOnly.fromDuration(Duration.zero), isA<TimeOnly>());
      expect(TimeOnly.fromDuration(const Duration(hours: 23)), isA<TimeOnly>());
    });

    test('rejects wrong durations', () {
      expect(
        () => TimeOnly.fromDuration(const Duration(days: 1)),
        throwsAssertionError,
      );
      expect(
        () => TimeOnly.fromDuration(const Duration(days: 24)),
        throwsAssertionError,
      );
      expect(
        () => TimeOnly.fromDuration(-const Duration(days: 1)),
        throwsAssertionError,
      );
      expect(
        () => TimeOnly.fromDuration(-const Duration(milliseconds: 1)),
        throwsAssertionError,
      );
    });

    test('fromDateTime', () {
      final dt1 = DateTime.parse('2022-06-15T08:54:44.923464+02:00');
      final dt2 = DateTime.parse('2022-06-15T08:54:44.923464-03:00');
      final dt3 = DateTime.parse('2022-06-15T08:54:44.923464Z');

      expect(
        TimeOnly.fromDateTime(dt1),
        TimeOnly.fromDuration(
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
        TimeOnly.fromDateTime(dt2),
        TimeOnly.fromDuration(
          const Duration(
            hours: 11,
            minutes: 54,
            seconds: 44,
            milliseconds: 923,
            microseconds: 464,
          ),
        ),
      );
      expect(
        TimeOnly.fromDateTime(dt3),
        TimeOnly.fromDuration(
          const Duration(
            hours: 8,
            minutes: 54,
            seconds: 44,
            milliseconds: 923,
            microseconds: 464,
          ),
        ),
      );
    });

    test('time part getters', () {
      final zero = TimeOnly.fromDuration(Duration.zero);
      final complex = TimeOnly.fromDuration(
        const Duration(hours: 23, minutes: 32, seconds: 42, milliseconds: 1),
      );

      expect(zero.hour, 0);
      expect(zero.minute, 0);
      expect(zero.second, 0);
      expect(zero.microsecond, 0);

      expect(complex.hour, 23);
      expect(complex.minute, 32);
      expect(complex.second, 42);
      expect(complex.microsecond, 1000);
    });

    test('toDuration', () {
      const zero = TimeOnly(0, 0, 0, 0);
      const complex = TimeOnly(23, 32, 42, 1000);

      expect(zero.toDuration(), Duration.zero);
      expect(
        complex.toDuration(),
        const Duration(hours: 23, minutes: 32, seconds: 42, milliseconds: 1),
      );
    });

    test('serialization', () {
      expect(TimeOnly.fromDuration(Duration.zero).toJson(), '00:00:00.000000');
      expect(
        TimeOnly.fromDuration(
          const Duration(days: 1) - const Duration(microseconds: 1),
        ).toJson(),
        '23:59:59.999999',
      );
      expect(
        TimeOnly.fromDuration(
          const Duration(hours: 23, minutes: 32, seconds: 42, milliseconds: 1),
        ).toJson(),
        '23:32:42.001000',
      );
    });

    test('deserialization', () {
      expect(
        TimeOnly.fromJson('00:00:00.000000'),
        TimeOnly.fromDuration(Duration.zero),
      );
      expect(
        TimeOnly.fromJson('23:59:59.999999'),
        TimeOnly.fromDuration(
          const Duration(days: 1) - const Duration(microseconds: 1),
        ),
      );
      expect(
        TimeOnly.fromJson('23:32:42.001000'),
        TimeOnly.fromDuration(
          const Duration(hours: 23, minutes: 32, seconds: 42, milliseconds: 1),
        ),
      );
    });

    group('compareTo', () {
      test('greater than', () {
        expect(
          TimeOnly.fromDuration(const Duration(hours: 1))
              .compareTo(TimeOnly.fromDuration(const Duration(minutes: 1))),
          isPositive,
        );
      });

      test('less than', () {
        expect(
          TimeOnly.fromDuration(const Duration(minutes: 1))
              .compareTo(TimeOnly.fromDuration(const Duration(hours: 1))),
          isNegative,
        );
      });

      test('equal', () {
        expect(
          TimeOnly.fromDuration(const Duration(hours: 1))
              .compareTo(TimeOnly.fromDuration(const Duration(hours: 1))),
          isZero,
        );
      });
    });
  });
}
