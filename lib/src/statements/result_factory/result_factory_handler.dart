import '../../proto/types.pb.dart';

export '../../proto/types.pb.dart';

abstract class ResultFactoryHandler {
  const ResultFactoryHandler();

  String build(
    TypeRef typeRef,
    Iterable<ResultFactoryHandler> handlers,
    String paramName,
  );

  static String buildFrom(
    TypeRef typeRef,
    Iterable<ResultFactoryHandler> handlers,
    String paramName,
  ) {
    for (final handler in handlers) {
      if (handler.canHandle(typeRef)) {
        return handler.build(typeRef, handlers, paramName);
      }
    }

    throw ArgumentError(
      'None of the generators could handle the type $typeRef',
    );
  }

  bool canHandle(TypeRef typeRef);
}
