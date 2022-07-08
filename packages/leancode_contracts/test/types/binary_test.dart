import 'dart:convert';

import 'package:leancode_contracts/src/types/binary.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Binary', () {
    group('bytes constructor', () {
      test('accepts bytes', () {
        final bytes = [12, 32];
        final data = Binary(bytes);

        expect(data.base64, base64Encode(bytes));
      });

      test('accepts empty bytes', () {
        final bytes = <int>[];
        final data = Binary(bytes);

        expect(data.base64, base64Encode(bytes));
      });

      test('does not accept ints larger than u8', () {
        void constructor() => Binary([256]);

        expect(constructor, throwsArgumentError);
      });

      test('does not accept negative ints', () {
        void constructor() => Binary([-1]);

        expect(constructor, throwsArgumentError);
      });
    });

    group('base64 constructor', () {
      test('accepts base64', () {
        const base64 = 'eW91cmVzdWNoYW5lcmQ=';
        final data = Binary.fromJson(base64);

        expect(data.base64, base64);
      });

      test('accepts empty base64', () {
        const base64 = '';
        final data = Binary.fromJson(base64);

        expect(data.base64, base64);
      });

      test('does not accept invalid encoding', () {
        void constructor() => Binary.fromJson('eW91cmVzdWNoYW5lc');

        expect(constructor, throwsFormatException);
      });
    });

    group('toBytes', () {
      test('returns empty list', () {
        final data = Binary.fromJson('');

        expect(data.toBytes(), <int>[]);
      });

      test('decodes into bytes', () {
        final bytes = [1, 2, 3];
        final data = Binary(bytes);

        expect(data.toBytes(), bytes);
      });
    });

    test('toString', () {
      final bytes = [222, 173, 190, 239];
      final data = Binary(bytes);

      expect(data.toString(), 'Binary(0xde, 0xad, 0xbe, 0xef)');
    });

    test('toJson uses base64', () {
      final bytes = [1, 2, 3];
      final data = Binary(bytes);

      expect(identical(data.toJson(), data.base64), true);
    });
  });
}
