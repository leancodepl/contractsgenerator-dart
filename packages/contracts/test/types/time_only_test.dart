import 'package:contracts/contracts.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

final throwsAssertionError = throwsA(isA<AssertionError>());

void main() {
  group('TimeOnly', () {
    test('accepts correct durations', () {
      expect(
        TimeOnly(const Duration(days: 1) - const Duration(microseconds: 1)),
        isA<TimeOnly>(),
      );
      expect(TimeOnly(Duration.zero), isA<TimeOnly>());
      expect(TimeOnly(const Duration(hours: 23)), isA<TimeOnly>());
    });

    test('rejects wrong durations', () {
      expect(() => TimeOnly(const Duration(days: 1)), throwsAssertionError);
      expect(() => TimeOnly(const Duration(days: 24)), throwsAssertionError);
      expect(() => TimeOnly(-const Duration(days: 1)), throwsAssertionError);
      expect(
        () => TimeOnly(-const Duration(milliseconds: 1)),
        throwsAssertionError,
      );
    });

    test('time part getters', () {
      final zero = TimeOnly(Duration.zero);
      final complex = TimeOnly(
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

    // TODO: json tests
  });
}
