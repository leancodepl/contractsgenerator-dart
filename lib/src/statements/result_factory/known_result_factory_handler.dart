import '../../time_class.dart';
import '../../types/known_type_handler.dart';
import '../../types/utils/nullable_suffix.dart';
import 'result_factory_handler.dart';
import 'utils/if_nullable_prefix.dart';

class KnownResultFactoryHandler extends ResultFactoryHandler {
  const KnownResultFactoryHandler();

  @override
  String build(
    TypeRef typeRef,
    Iterable<ResultFactoryHandler> handlers,
    String paramName,
  ) {
    assert(canHandle(typeRef));

    final known = typeRef.known;
    final q = nullableSuffix(typeRef);

    switch (known.type) {
      case KnownType.Object_:
      case KnownType.Guid:
      case KnownType.String:
      case KnownType.Boolean:
      case KnownType.UInt8:
      case KnownType.Int8:
      case KnownType.Int16:
      case KnownType.UInt16:
      case KnownType.Int32:
      case KnownType.UInt32:
      case KnownType.Int64:
      case KnownType.UInt64:
        final outType = KnownTypeHandler.knownTypeToDartType[known.type];

        return '$paramName as $outType$q';

      case KnownType.Float:
      case KnownType.Double:
      case KnownType.Decimal:
        return '($paramName as num$q)$q.toDouble()';

      case KnownType.Uri:
        return '${ifNullablePrefix(typeRef, paramName)}Uri.parse($paramName)';

      case KnownType.Date:
      case KnownType.DateTime:
      case KnownType.DateTimeOffset:
        return '${ifNullablePrefix(typeRef, paramName)}DateTime.parse($paramName)';

      case KnownType.Time:
        return '${ifNullablePrefix(typeRef, paramName)}$timeClassName.fromJson($paramName)';

      case KnownType.Array:
        return '($paramName as Iterable<dynamic>$q)$q '
            '.map((dynamic e) => ${ResultFactoryHandler.buildFrom(known.arguments.first, handlers, 'e')}).toList()';

      case KnownType.Map:
        return '($paramName as Map$q)$q.map((dynamic k, dynamic v) => MapEntry( '
            '${ResultFactoryHandler.buildFrom(known.arguments[0], handlers, 'k')}, '
            '${ResultFactoryHandler.buildFrom(known.arguments[1], handlers, 'v')}),)';

      case KnownType.Query:
      case KnownType.Command:
      case KnownType.AuthorizeWhenAttribute:
      case KnownType.AuthorizeWhenHasAnyOfAttribute:
      case KnownType.QueryCacheAttribute:
      case KnownType.Attribute:
        throw UnimplementedError(
          'Cannot generate a resultFactory for ${known.type}',
        );
    }

    throw StateError('unreachable');
  }

  @override
  bool canHandle(TypeRef typeRef) => typeRef.hasKnown();
}