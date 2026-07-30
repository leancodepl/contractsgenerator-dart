import 'package:analyzer/dart/element/type.dart';
import 'package:json_serializable/type_helper.dart';
import 'package:source_gen/source_gen.dart';
import 'package:source_helper/source_helper.dart';

/// Serializes generic `@ContractsSerializable` fields, which json_serializable
/// can't (their `toJson` is dropped or optional), by calling the generated
/// `_$<Name>ToJson`/`FromJson` free functions with one factory per type
/// argument, composed recursively.
class ContractsGenericTypeHelper
    extends TypeHelper<TypeHelperContextWithConfig> {
  const ContractsGenericTypeHelper();

  static const _contract = TypeChecker.typeNamedLiterally(
    'ContractsSerializable',
    inPackage: 'leancode_contracts',
  );

  @override
  Object? serialize(
    DartType targetType,
    String expression,
    TypeHelperContextWithConfig context,
  ) => _emit(
    'ToJson',
    targetType,
    expression,
    context.serialize,
    (type) => type.isNullableType ? '$expression!' : expression,
  );

  @override
  Object? deserialize(
    DartType targetType,
    String expression,
    TypeHelperContextWithConfig context,
    bool _,
  ) => _emit(
    'FromJson',
    targetType,
    expression,
    context.deserialize,
    (_) => '$expression as Map<String, dynamic>',
  );

  Object? _emit(
    String suffix,
    DartType targetType,
    String expression,
    Object? Function(DartType type, String expression) convertArgument,
    String Function(InterfaceType type) receiver,
  ) {
    if (targetType case final InterfaceType type
        when type.typeArguments.isNotEmpty &&
            _contract.hasAnnotationOf(type.element)) {
      // convertArgument is null when the argument is already JSON (e.g. a
      // primitive) and needs no transformation, so fall back to identity.
      final factories = type.typeArguments
          .map(
            (argument) =>
                '($_value) => ${convertArgument(argument, _value) ?? _value}',
          )
          .join(', ');
      final invocation =
          '_\$${type.element.name}$suffix(${receiver(type)}, $factories)';
      return type.isNullableType
          ? '$expression == null ? null : $invocation'
          : invocation;
    }
    return null;
  }
}

const _value = 'value';
