import 'package:code_builder/code_builder.dart';

import '../proto/contracts.pb.dart';

class ValueCreator {
  const ValueCreator();

  Field create(ValueRef valueRef) {
    final (type, value) = switch (valueRef.whichValue()) {
      ValueRef_Value.null_1 => ('Null', 'null'),
      ValueRef_Value.number => ('int', valueRef.number.value.toString()),
      ValueRef_Value.floatingPoint => (
          'double',
          valueRef.floatingPoint.value.toString()
        ),
      ValueRef_Value.string => ('String', "'${valueRef.string.value}'"),
      ValueRef_Value.bool_5 => ('bool', valueRef.bool_5.value.toString()),
      ValueRef_Value.notSet =>
        throw UnimplementedError('Missing handler of value $valueRef'),
    };

    return Field(
      (b) => b
        // Field requires a name when constructed
        ..name = 'replace me'
        ..type = refer(type)
        ..assignment = Code(value),
    );
  }
}
