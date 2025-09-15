import '../proto/contracts.pb.dart';
import 'utils/nullable_suffix.dart';

export '../proto/contracts.pb.dart';

abstract class TypeHandler {
  const TypeHandler();

  String build(TypeRef typeRef, Iterable<TypeHandler> handlers);

  static String buildFrom(TypeRef typeRef, Iterable<TypeHandler> handlers) {
    for (final handler in handlers) {
      if (handler.canHandle(typeRef)) {
        return handler.build(typeRef, handlers) + nullableSuffix(typeRef);
      }
    }

    throw ArgumentError(
      'None of the generators could handle the type $typeRef',
    );
  }

  bool canHandle(TypeRef typeRef);
}
