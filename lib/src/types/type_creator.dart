import 'package:code_builder/code_builder.dart';

import 'type_handler.dart';

class TypeCreator {
  const TypeCreator(this.handlers);

  final List<TypeHandler> handlers;

  Reference create(TypeRef typeRef) =>
      refer(TypeHandler.buildFrom(typeRef, handlers));
}
