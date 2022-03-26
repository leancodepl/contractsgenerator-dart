import 'package:leancode_contracts_generator/src/utils/rename_type.dart';

import '../generator_database.dart';
import 'type_handler.dart';

class InternalTypeHandler extends TypeHandler {
  const InternalTypeHandler(this.db);

  final GeneratorDatabase db;

  @override
  String build(TypeRef typeRef, Iterable<TypeHandler> handlers) {
    assert(canHandle(typeRef));

    final name = renameType(db.resolveName(typeRef.internal.name));

    if (typeRef.internal.arguments.isNotEmpty) {
      final argumentList = typeRef.internal.arguments
          .map((arg) => TypeHandler.buildFrom(arg, handlers))
          .join(',');

      return '$name<$argumentList>';
    }

    return name;
  }

  @override
  bool canHandle(TypeRef typeRef) => typeRef.hasInternal();
}
