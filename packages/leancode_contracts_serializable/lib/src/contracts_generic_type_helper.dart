import 'package:analyzer/dart/element/type.dart';
import 'package:json_serializable/type_helper.dart';
import 'package:source_gen/source_gen.dart';
import 'package:source_helper/source_helper.dart';

/// Serializes fields whose type is a generic `@JsonSerializable`/
/// `@ContractsSerializable` contract (`PaginatedResult<T>`, `Foo<SomeEnum>`,
/// nested generics).
///
/// json_serializable only forwards factories to a type's `toJson` when it has
/// required positional params. Contract generics have no `toJson` (dropped to
/// keep inheritance) or an optional one, so json_serializable emits them raw or
/// fails the build (issue #95). This drives off the field's own type arguments
/// instead, calling the generated `_$<Name>ToJson`/`_$<Name>FromJson` free
/// functions (same library) with one factory per argument, composed
/// recursively via [context].
class ContractsGenericTypeHelper
    extends TypeHelper<TypeHelperContextWithConfig> {
  const ContractsGenericTypeHelper();

  // Scope strictly to our generated contracts: only they carry
  // `@ContractsSerializable` and get the `_$…ToJson`/`_$…FromJson` free
  // functions. A user's own `@JsonSerializable` generics stay with
  // json_serializable, untouched.
  static const _contract = TypeChecker.typeNamedLiterally(
    'ContractsSerializable',
    inPackage: 'leancode_contracts',
  );

  bool _isGenericContract(InterfaceType type) =>
      type.typeArguments.isNotEmpty &&
      _contract.hasAnnotationOf(type.element);

  @override
  Object? serialize(
    DartType targetType,
    String expression,
    TypeHelperContextWithConfig context,
  ) {
    if (targetType is! InterfaceType || !_isGenericContract(targetType)) {
      return null;
    }
    final factories = targetType.typeArguments
        .map((a) => '($_v) => ${context.serialize(a, _v) ?? _v}')
        .join(', ');
    final nn = targetType.isNullableType;
    final call =
        '_\$${targetType.element.name}ToJson($expression${nn ? '!' : ''}, $factories)';
    return nn ? '$expression == null ? null : $call' : call;
  }

  @override
  Object? deserialize(
    DartType targetType,
    String expression,
    TypeHelperContextWithConfig context,
    bool defaultProvided,
  ) {
    if (targetType is! InterfaceType || !_isGenericContract(targetType)) {
      return null;
    }
    final revivers = targetType.typeArguments
        .map((a) => '($_v) => ${context.deserialize(a, _v) ?? _v}')
        .join(', ');
    final call =
        '_\$${targetType.element.name}FromJson($expression as Map<String, dynamic>, $revivers)';
    return targetType.isNullableType ? '$expression == null ? null : $call' : call;
  }
}

const _v = 'value';
