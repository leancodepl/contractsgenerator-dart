import 'type_handler.dart';

class KnownTypeHandler extends TypeHandler {
  const KnownTypeHandler();

  @override
  String build(TypeRef typeRef, Iterable<TypeHandler> handlers) {
    assert(canHandle(typeRef));

    final name = toDartType(typeRef.known.type);

    if (typeRef.known.arguments.isNotEmpty) {
      final argumentList = typeRef.known.arguments
          .map((arg) => TypeHandler.buildFrom(arg, handlers))
          .join(',');

      return '$name<$argumentList>';
    }

    return name;
  }

  static String toDartType(KnownType knownType) {
    switch (knownType) {
      case KnownType.Object_:
        return 'Object';
      case KnownType.String:
      case KnownType.Guid:
        return 'String';
      case KnownType.Uri:
        return 'Uri';
      case KnownType.Boolean:
        return 'bool';
      case KnownType.UInt8:
      case KnownType.Int8:
      case KnownType.Int16:
      case KnownType.UInt16:
      case KnownType.Int32:
      case KnownType.UInt32:
      case KnownType.Int64:
      case KnownType.UInt64:
        return 'int';
      case KnownType.Float32:
      case KnownType.Float64:
        return 'double';
      case KnownType.TimeOnly:
        return 'TimeOnly';
      case KnownType.TimeSpan:
        return 'Duration';
      case KnownType.DateTimeOffset:
        return 'DateTimeOffset';
      case KnownType.DateOnly:
        return 'DateOnly';
      case KnownType.Binary:
        return 'Binary';
      case KnownType.Array:
        return 'List';
      case KnownType.Map:
        return 'Map';
      case KnownType.Query:
        return 'Query';
      case KnownType.Command:
        return 'Command';
      case KnownType.Operation:
        return 'Operation';
      case KnownType.CommandResult:
        return 'CommandResult';
      case KnownType.AuthorizeWhenAttribute:
      case KnownType.AuthorizeWhenHasAnyOfAttribute:
      case KnownType.QueryCacheAttribute:
      case KnownType.Attribute:
        throw UnimplementedError(
          'There is a missing mapping for the type $knownType',
        );
    }

    throw StateError('unreachable');
  }

  @override
  bool canHandle(TypeRef typeRef) => typeRef.hasKnown();
}
