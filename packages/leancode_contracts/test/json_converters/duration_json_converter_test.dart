import 'package:leancode_contracts/leancode_contracts.dart';
import 'package:test/test.dart';

void main() {
  group('DurationJsonConverter', () {
    const conv = DurationJsonConverter();

    test('serialize', () {
      expect(conv.toJson(Duration.zero), '0.00:00:00.000000');
      expect(
        conv.toJson(
          const Duration(days: 3, hours: 23, seconds: 8, microseconds: 56),
        ),
        '3.23:00:08.000056',
      );
      expect(
        conv.toJson(
          -const Duration(
            days: 3,
            hours: 23,
            seconds: 8,
            microseconds: 56,
          ),
        ),
        '-3.23:00:08.000056',
      );
    });

    test('deserialize', () {
      expect(conv.fromJson('0.00:00:00.000000'), Duration.zero);
      expect(conv.fromJson('0.00:00:00.001'), const Duration(milliseconds: 1));
      expect(
        conv.fromJson('0.00:00:00.000100123678'),
        const Duration(microseconds: 100),
      );
      expect(
        conv.fromJson(
          '3.23:00:08.000056',
        ),
        const Duration(days: 3, hours: 23, seconds: 8, microseconds: 56),
      );
      expect(
        conv.fromJson(
          '-3.23:00:08.000056',
        ),
        -const Duration(
          days: 3,
          hours: 23,
          seconds: 8,
          microseconds: 56,
        ),
      );
    });
  });
}
