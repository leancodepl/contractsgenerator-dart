import '../time_class.dart';
import 'type_handler.dart';

class KnownTypeHandler extends TypeHandler {
  const KnownTypeHandler();

  static const knownTypeToDartType = {
    KnownType.Object_: 'Object',
    KnownType.String: 'String',
    KnownType.Guid: 'String',
    KnownType.Uri: 'Uri',
    KnownType.Boolean: 'bool',
    KnownType.UInt8: 'int',
    KnownType.Int8: 'int',
    KnownType.Int16: 'int',
    KnownType.UInt16: 'int',
    KnownType.Int32: 'int',
    KnownType.UInt32: 'int',
    KnownType.Int64: 'int',
    KnownType.UInt64: 'int',
    KnownType.Float: 'double',
    KnownType.Double: 'double',
    KnownType.Decimal: 'double',
    KnownType.Date: 'DateTime',
    KnownType.Time: timeClassName,
    KnownType.TimeSpan: 'Duration',
    KnownType.DateTime: 'DateTime',
    KnownType.DateTimeOffset: 'DateTime',
    KnownType.Array: 'List',
    KnownType.Map: 'Map',
    KnownType.Query: 'IRemoteQuery',
    KnownType.Command: 'IRemoteCommand',
    KnownType.AuthorizeWhenAttribute: 'TODO',
    KnownType.AuthorizeWhenHasAnyOfAttribute: 'TODO',
    KnownType.QueryCacheAttribute: 'TODO',
    KnownType.Attribute: 'TODO',
  };

  @override
  String build(TypeRef typeRef, Iterable<TypeHandler> handlers) {
    assert(canHandle(typeRef));

    final name = _toDartType(typeRef.known.type);

    if (typeRef.known.arguments.isNotEmpty) {
      final argumentList = typeRef.known.arguments
          .map((arg) => TypeHandler.buildFrom(arg, handlers))
          .join(',');

      return '$name<$argumentList>';
    }

    return name;
  }

  String _toDartType(KnownType knownType) {
    final dartTypeStr = knownTypeToDartType[knownType];

    if (dartTypeStr == null) {
      throw UnimplementedError(
        'There is a missing mapping for the type $knownType',
      );
    }

    return dartTypeStr;
  }

  @override
  bool canHandle(TypeRef typeRef) => typeRef.hasKnown();
}
