import 'type_handler.dart';

class GenericTypeHandler extends TypeHandler {
  const GenericTypeHandler();

  @override
  String build(TypeRef typeRef, Iterable<TypeHandler> handlers) {
    assert(canHandle(typeRef));

    return typeRef.generic.name;
  }

  @override
  bool canHandle(TypeRef typeRef) => typeRef.hasGeneric();
}
