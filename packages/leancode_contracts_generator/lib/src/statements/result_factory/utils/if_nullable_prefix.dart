import 'package:leancode_contracts_generator/src/proto/contracts.pb.dart';

String ifNullablePrefix(TypeRef typeRef, String paramName) =>
    typeRef.nullable ? '$paramName == null ? null : ' : '';
