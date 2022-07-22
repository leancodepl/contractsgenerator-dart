import '../types/type_handler.dart';

class JsonConverters {
  String? getConverter(TypeRef typeRef) {
    if (!typeRef.hasKnown()) {
      return null;
    }

    final knownType = typeRef.ensureKnown().type;

    switch (knownType) {
      case KnownType.TimeSpan:
        return 'DurationJsonConverter';
      default:
        return null;
    }
  }
}
