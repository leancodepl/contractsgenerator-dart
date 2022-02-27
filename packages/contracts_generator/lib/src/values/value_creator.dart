import 'package:code_builder/code_builder.dart';

import '../proto/contracts.pb.dart';

class ValueCreator {
  const ValueCreator();

  Field create(ValueRef valueRef) {
    String type;
    String value;

    if (valueRef.hasNull_1()) {
      type = 'Null';
      value = 'null';
    } else if (valueRef.hasNumber()) {
      type = 'int';
      value = valueRef.number.value.toString();
    } else if (valueRef.hasFloatingPoint()) {
      type = 'double';
      value = valueRef.floatingPoint.value.toString();
    } else if (valueRef.hasString()) {
      type = 'String';
      value = "'${valueRef.string.value}'";
    } else if (valueRef.hasBool_5()) {
      type = 'bool';
      value = valueRef.bool_5.value.toString();
    } else {
      throw UnimplementedError('Missing handler of value $valueRef');
    }

    return Field(
      (b) => b
        // Field requires a name when constructed
        ..name = 'replace me'
        ..type = refer(type)
        ..assignment = Code(value),
    );
  }
}
