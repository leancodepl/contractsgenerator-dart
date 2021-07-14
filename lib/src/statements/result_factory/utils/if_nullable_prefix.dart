import '../../../proto/types.pb.dart';

String ifNullablePrefix(TypeRef typeRef, String paramName) =>
    typeRef.nullable ? '$paramName == null ? null : ' : '';
