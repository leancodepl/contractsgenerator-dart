import '../../time_class.dart';
import '../../types/known_type_handler.dart';
import '../../types/utils/known_type_type.dart';
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

    switch (knownTypeType(known.type)) {
      case KnownTypeType.primitive:
        final outType = KnownTypeHandler.knownTypeToDartType[known.type];

        // edge case: a double in the json might be deserialized into an int
        if (outType == 'double') {
          return '($paramName as num$q)$q.toDouble()';
        }
        return '$paramName as $outType$q';

      case KnownTypeType.complex:
        switch (known.type) {
          case KnownType.Array:
            return '($paramName as Iterable<dynamic>$q)$q '
                '.map((dynamic e) => ${ResultFactoryHandler.buildFrom(known.arguments.first, handlers, 'e')}).toList()';

          case KnownType.Map:
            return '($paramName as Map$q)$q.map((dynamic k, dynamic v) => MapEntry( '
                '${ResultFactoryHandler.buildFrom(known.arguments[0], handlers, 'k')}, '
                '${ResultFactoryHandler.buildFrom(known.arguments[1], handlers, 'v')}),)';

          case KnownType.Uri:
            return '${ifNullablePrefix(typeRef, paramName)}Uri.parse($paramName)';

          case KnownType.Date:
          case KnownType.DateTime:
          case KnownType.DateTimeOffset:
            return '${ifNullablePrefix(typeRef, paramName)}DateTime.parse($paramName)';

          case KnownType.Time:
            return '${ifNullablePrefix(typeRef, paramName)}$timeClassName.fromJson($paramName)';

          default:
            throw UnimplementedError(
              'No mapping available for type ${known.type}',
            );
        }

      case KnownTypeType.attribute:
      case KnownTypeType.cqrs:
        throw UnimplementedError(
          'Cannot generate a resultFactory for ${known.type}',
        );
    }
  }

  @override
  bool canHandle(TypeRef typeRef) => typeRef.hasKnown();
}
