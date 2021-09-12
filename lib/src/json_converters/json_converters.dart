import 'package:code_builder/code_builder.dart';

import '../types/type_handler.dart';
import 'duration_json_converter.dart';

class JsonConverters {
  // TODO: while https://github.com/google/json_serializable.dart/issues/822
  // is not resolved there needs to be two seperate converters for each type
  final converters = [durationJsonConverter, nullableDurationJsonConverter];

  Class? getConverter(TypeRef typeRef) {
    if (!typeRef.hasKnown()) return null;

    final knownType = typeRef.ensureKnown().type;

    switch (knownType) {
      case KnownType.TimeSpan:
        return typeRef.nullable
            ? nullableDurationJsonConverter
            : durationJsonConverter;
      default:
        return null;
    }
  }
}
