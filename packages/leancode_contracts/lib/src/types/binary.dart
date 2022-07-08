import 'dart:convert';
import 'dart:typed_data';

/// Stores binary data as a base64 encoded string.
class Binary {
  /// Constructs [Binary] given a list of bytes.
  Binary(List<int> bytes) : this.fromJson(base64Encode(bytes));

  /// Deserializes a valid base64 string into [Binary].
  Binary.fromJson(this.base64)
      : assert(
          () {
            // check validity by trying to decode into bytes
            base64Decode(base64);
            return true;
          }(),
        );

  /// A [base64](https://tools.ietf.org/html/rfc4648) encoded list of bytes.
  final String base64;

  /// Decodes [base64] into a list of bytes.
  Uint8List toBytes() => base64Decode(base64);

  /// Serializes [Binary] into its base64 representation.
  String toJson() => base64;

  @override
  String toString() {
    return 'Binary(${toBytes().map((e) => '0x${e.toRadixString(16)}').join(', ')})';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is Binary && base64 == other.base64;
  }

  @override
  int get hashCode => base64.hashCode;
}
