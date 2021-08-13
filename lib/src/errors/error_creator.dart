import 'package:code_builder/code_builder.dart';

import '../proto/contracts.pb.dart';
import '../utils/rename_field.dart';

// TODO: split into handlers?
class ErrorCreator {
  const ErrorCreator();

  static const _errorClassSuffix = 'ErrorCodes';

  Spec create(List<ErrorCode> errorCodes, String context) {
    return Class(
      (b) => b
        ..name = '$context$_errorClassSuffix'
        ..fields.addAll(
          errorCodes.map((code) => _createFields(code, '')).expand((e) => e),
        ),
    );
  }

  List<Field> _createFields(ErrorCode errorCode, String context) {
    if (errorCode.hasSingle()) {
      return [
        Field(
          (b) => b
            ..name = renameField(context + errorCode.single.name)
            ..static = true
            ..modifier = FieldModifier.constant
            ..assignment = Code(errorCode.single.code.toString()),
        ),
      ];
    } else if (errorCode.hasGroup()) {
      return errorCode.group.innerCodes
          .map((code) => _createFields(code, errorCode.group.name))
          .expand((e) => e)
          .toList();
    }

    throw UnimplementedError('ErrorCode $errorCode has no handler');
  }
}
