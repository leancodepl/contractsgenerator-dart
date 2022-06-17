import 'package:leancode_contracts/src/types/date_only.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

final throwsAssertionError = throwsA(isA<AssertionError>());

void main() {
  group('DateOnly', () {
    test('accepts correct dates', () {
      expect(
        DateOnly(1999, 1, 29),
        isA<DateOnly>(),
      );
      expect(DateOnly(0, 1, 1), isA<DateOnly>());
      expect(DateOnly(23030, 12, 31), isA<DateOnly>());
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
      final one = DateOnly(1, 1, 1);
      final complex = DateOnly(1999, 1, 29);

      expect(one.year, 1);
      expect(one.month, 1);
      expect(one.day, 1);

      expect(complex.year, 1999);
      expect(complex.month, 1);
      expect(complex.day, 29);
    });

    test('serialization', () {
      expect(DateOnly(1, 1, 1).toJson(), '0001-01-01');
      expect(DateOnly(1999, 1, 29).toJson(), '1999-01-29');
    });

    test('deserialization', () {
      expect(DateOnly.fromJson('0001-01-01'), DateOnly(1, 1, 1));
      expect(
        DateOnly.fromJson('1999-01-29'),
        DateOnly(1999, 1, 29),
      );
    });

    group('compareTo', () {
      test('greater than', () {
        expect(
          DateOnly(2000, 1, 24).compareTo(DateOnly(2000, 1, 23)),
          isPositive,
        );
        expect(
          DateOnly(2000, 1, 24).compareTo(DateOnly(1999, 1, 24)),
          isPositive,
        );
        expect(
          DateOnly(2000, 2, 24).compareTo(DateOnly(2000, 1, 24)),
          isPositive,
        );
      });

      test('less than', () {
        expect(
          DateOnly(2000, 1, 23).compareTo(DateOnly(2000, 1, 24)),
          isNegative,
        );
        expect(
          DateOnly(1999, 1, 24).compareTo(DateOnly(2000, 1, 24)),
          isNegative,
        );
        expect(
          DateOnly(2000, 1, 24).compareTo(DateOnly(2000, 2, 24)),
          isNegative,
        );
      });

      test('equal', () {
        expect(
          DateOnly(2000, 1, 23).compareTo(DateOnly(2000, 1, 23)),
          isZero,
        );
      });
    });
  });
}
