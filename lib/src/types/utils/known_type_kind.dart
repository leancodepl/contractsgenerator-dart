import '../type_handler.dart';

enum KnownTypeKind {
  /// those that can be handled by a simple `as` cast
  primitive,

  /// require special serde
  complex,

  /// cqrs-related interfaces
  cqrs,

  /// attributes
  attribute
}

KnownTypeKind knownTypeKind(KnownType knownType) {
  switch (knownType) {
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
    case KnownType.Float:
    case KnownType.Double:
    case KnownType.Decimal:
      return KnownTypeKind.primitive;
    case KnownType.Uri:
    case KnownType.Date:
    case KnownType.Time:
    case KnownType.TimeSpan:
    case KnownType.DateTime:
    case KnownType.DateTimeOffset:
    case KnownType.Array:
    case KnownType.Map:
      return KnownTypeKind.complex;
    case KnownType.Query:
    case KnownType.Command:
      return KnownTypeKind.cqrs;
    case KnownType.AuthorizeWhenAttribute:
    case KnownType.AuthorizeWhenHasAnyOfAttribute:
    case KnownType.QueryCacheAttribute:
    case KnownType.Attribute:
      return KnownTypeKind.attribute;
  }

  throw UnimplementedError('There was no mapping for the type $knownType');
}
