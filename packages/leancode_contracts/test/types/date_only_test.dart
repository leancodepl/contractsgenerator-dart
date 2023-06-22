import 'package:leancode_contracts/src/types/date_only.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

final throwsAssertionError = throwsA(isA<AssertionError>());

void main() {
  group('DateOnly', () {
    test('accepts correct dates', () {
      expect(
        const DateOnly(1999, 1, 29),
        isA<DateOnly>(),
      );
      expect(const DateOnly(0, 1, 1), isA<DateOnly>());
      expect(const DateOnly(23030, 12, 31), isA<DateOnly>());
    });

    test('drops time from DateTime', () {
      expect(
        DateOnly.fromDateTime(DateTime(1999, 1, 2, 23, 2, 1)),
        DateOnly.fromDateTime(DateTime(1999, 1, 2)),
      );
      expect(
        DateOnly.fromDateTime(DateTime(1999, 1, 2, 0, 0, 0, 0, 1)),
        DateOnly.fromDateTime(DateTime(1999, 1, 2)),
      );
      expect(
        DateOnly.fromDateTime(DateTime(1999, 1, 2, 1)),
        DateOnly.fromDateTime(DateTime(1999, 1, 2)),
      );
    });

    test('rejects negative years', () {
      expect(() => DateOnly(-10, 1, 1), throwsAssertionError);
      expect(() => DateOnly(-1, 1, 1), throwsAssertionError);
    });

    test('date part getters', () {
      const one = DateOnly(1, 1, 1);
      const complex = DateOnly(1999, 1, 29);

      expect(one.year, 1);
      expect(one.month, 1);
      expect(one.day, 1);

      expect(complex.year, 1999);
      expect(complex.month, 1);
      expect(complex.day, 29);
    });

    test('toDateTimeLocal', () {
      const one = DateOnly(1, 1, 1);
      const complex = DateOnly(1999, 1, 29);

      expect(one.toDateTimeLocal(), DateTime(1));
      expect(complex.toDateTimeLocal(), DateTime(1999, 1, 29));
    });

    test('toDateTimeUtc', () {
      const one = DateOnly(1, 1, 1);
      const complex = DateOnly(1999, 1, 29);

      expect(one.toDateTimeUtc(), DateTime.utc(1));
      expect(complex.toDateTimeUtc(), DateTime.utc(1999, 1, 29));
    });

    test('serialization', () {
      expect(const DateOnly(1, 1, 1).toJson(), '0001-01-01');
      expect(const DateOnly(1999, 1, 29).toJson(), '1999-01-29');
    });

    test('deserialization', () {
      expect(DateOnly.fromJson('0001-01-01'), const DateOnly(1, 1, 1));
      expect(
        DateOnly.fromJson('1999-01-29'),
        const DateOnly(1999, 1, 29),
      );
    });

    group('compareTo', () {
      test('greater than', () {
        expect(
          const DateOnly(2000, 1, 24).compareTo(const DateOnly(2000, 1, 23)),
          isPositive,
        );
        expect(
          const DateOnly(2000, 1, 24).compareTo(const DateOnly(1999, 1, 24)),
          isPositive,
        );
        expect(
          const DateOnly(2000, 2, 24).compareTo(const DateOnly(2000, 1, 24)),
          isPositive,
        );
      });

      test('less than', () {
        expect(
          const DateOnly(2000, 1, 23).compareTo(const DateOnly(2000, 1, 24)),
          isNegative,
        );
        expect(
          const DateOnly(1999, 1, 24).compareTo(const DateOnly(2000, 1, 24)),
          isNegative,
        );
        expect(
          const DateOnly(2000, 1, 24).compareTo(const DateOnly(2000, 2, 24)),
          isNegative,
        );
      });

      test('equal', () {
        expect(
          const DateOnly(2000, 1, 23).compareTo(const DateOnly(2000, 1, 23)),
          isZero,
        );
      });
    });
  });
}
