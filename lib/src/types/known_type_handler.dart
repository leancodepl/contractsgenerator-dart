import '../time_class.dart';
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
        return 'String';
      case KnownType.Guid:
        return 'String';
      case KnownType.Uri:
        return 'Uri';
      case KnownType.Boolean:
        return 'bool';
      case KnownType.UInt8:
        return 'int';
      case KnownType.Int8:
        return 'int';
      case KnownType.Int16:
        return 'int';
      case KnownType.UInt16:
        return 'int';
      case KnownType.Int32:
        return 'int';
      case KnownType.UInt32:
        return 'int';
      case KnownType.Int64:
        return 'int';
      case KnownType.UInt64:
        return 'int';
      case KnownType.Float:
        return 'double';
      case KnownType.Double:
        return 'double';
      case KnownType.Decimal:
        return 'double';
      case KnownType.Date:
        return 'DateTime';
      case KnownType.Time:
        return timeClassName;
      case KnownType.TimeSpan:
        return 'Duration';
      case KnownType.DateTime:
        return 'DateTime';
      case KnownType.DateTimeOffset:
        return 'DateTime';
      case KnownType.Array:
        return 'List';
      case KnownType.Map:
        return 'Map';
      case KnownType.Query:
        return 'IRemoteQuery';
      case KnownType.Command:
        return 'IRemoteCommand';
      case KnownType.CommandResult:
        return 'CommandResult';
      case KnownType.DateOnly:
      case KnownType.TimeOnly:
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
