import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';

import '../utils/rename_type.dart';
import 'statement_handler.dart';

class DtoHandler extends StatementHandler {
  const DtoHandler(
    super.typeCreator,
    super.valueCreator,
    super.attributeCreator,
    super.db,
  );

  @override
  Spec build(Statement statement) {
    return createBase(statement).rebuild((b) {
      final typeDescriptor = statement.dto.typeDescriptor;

      // make it abstract if it extends a protocol type
      b.abstract = typeDescriptor.extends_1.any(db.isProtocol);

      if (b.abstract) {
        b
          ..annotations.clear()
          ..methods.clear()
          ..constructors.removeWhere((e) => e.name == 'fromJson');
        return;
      }

      // A DTO that extends a generic DTO must keep a `toJson` whose signature
      // stays override-compatible with the base's `toJson`. The base emits one
      // `Object? Function(<arg>)` factory per type argument (via
      // `genericArgumentFactories`), so we emit a matching override here.
      //
      // Previously the generator instead stripped `toJson` from *every* generic
      // DTO to dodge the invalid override. That made a generic DTO impossible to
      // serialize when used as a concretely-instantiated field, because
      // json_serializable could no longer find its `toJson` (issue #95). Generic
      // DTOs now keep their normal `toJson`; only subclasses need this fix-up.
      final genericBase = _genericDtoBase(typeDescriptor);
      if (genericBase != null) {
        final override = _inheritedToJson(statement, genericBase);
        if (override != null) {
          b.methods
            ..removeWhere((m) => m.name == 'toJson')
            ..add(override);
        }
      }
    });
  }

  /// Returns the `extends` entry that refers to an included generic DTO, if any.
  TypeRef? _genericDtoBase(TypeDescriptor typeDescriptor) {
    for (final e in typeDescriptor.extends_1) {
      if (!e.hasInternal() || !db.shouldInclude(e.internal.name)) {
        continue;
      }
      final base = db.find(e.internal.name);
      if (base != null &&
          base.hasDto() &&
          base.dto.typeDescriptor.genericParameters.isNotEmpty) {
        return e;
      }
    }
    return null;
  }

  /// Builds a `toJson` override compatible with a generic DTO base, or `null`
  /// when the normal `toJson` emitted by [createBase] is already a valid
  /// override (the degenerate `class Child<T> extends Base<T>` case).
  ///
  /// For `class Child<X1..Xn> extends Base<A1..Am>` the override:
  ///  * declares, in the base's argument order, one factory positional per base
  ///    argument (required when the child itself is generic, optional when the
  ///    child is concrete so the no-arg call site keeps working);
  ///  * appends the child's own type parameters not covered by a base argument
  ///    as optional trailing factory positionals;
  ///  * forwards to the json_serializable-generated `_$ChildToJson`, passing the
  ///    factories in that function's declaration order (the child's own type
  ///    parameter order) and defaulting any omitted optional factory to the
  ///    identity function.
  Method? _inheritedToJson(Statement statement, TypeRef baseRef) {
    final name = renameType(db.resolveName(statement.name));
    final childParams = statement.dto.typeDescriptor.genericParameters
        .map((g) => g.name)
        .toList();
    final baseArgs = baseRef.internal.arguments;
    final baseParams =
        db
            .find(baseRef.internal.name)
            ?.dto
            .typeDescriptor
            .genericParameters
            .map((g) => g.name)
            .toList() ??
        const [];

    // `class Child<T..> extends Base<T..>` with matching order: the normal
    // `toJson` is already a valid override, so leave it untouched.
    final baseArgNames = baseArgs
        .map((a) => a.hasGeneric() ? a.generic.name : null)
        .toList();
    if (childParams.isNotEmpty &&
        const ListEquality<String?>().equals(baseArgNames, childParams)) {
      return null;
    }

    final childIsConcrete = childParams.isEmpty;
    final coveredNames = baseArgs
        .where((a) => a.hasGeneric())
        .map((a) => a.generic.name)
        .toSet();

    final requiredPositional = <Parameter>[];
    final optionalPositional = <Parameter>[];

    for (final (i, arg) in baseArgs.indexed) {
      final typeSymbol = typeCreator.create(arg).symbol!;
      final paramName = arg.hasGeneric()
          ? 'toJson${arg.generic.name}'
          : 'toJson${i < baseParams.length ? baseParams[i] : 'Arg$i'}';

      if (childIsConcrete) {
        optionalPositional.add(
          Parameter(
            (p) => p
              ..name = paramName
              ..type = refer('Object? Function($typeSymbol)?'),
          ),
        );
      } else {
        requiredPositional.add(
          Parameter(
            (p) => p
              ..name = paramName
              ..type = refer('Object? Function($typeSymbol)'),
          ),
        );
      }
    }

    // Child type parameters that the base does not consume become optional
    // trailing factories.
    for (final param in childParams.where((n) => !coveredNames.contains(n))) {
      optionalPositional.add(
        Parameter(
          (p) => p
            ..name = 'toJson$param'
            ..type = refer('Object? Function($param)?'),
        ),
      );
    }

    // Forward to the generated function, factories in child declaration order.
    final forwarded = [
      'this',
      for (final param in childParams)
        if (coveredNames.contains(param))
          'toJson$param'
        else
          'toJson$param ?? ((v) => v)',
    ];

    return Method(
      (m) => m
        ..name = 'toJson'
        ..lambda = true
        ..returns = refer('Map<String, dynamic>')
        ..requiredParameters.addAll(requiredPositional)
        ..optionalParameters.addAll(optionalPositional)
        ..body = Code('_\$${name}ToJson(${forwarded.join(', ')})'),
    );
  }

  @override
  bool canHandle(Statement statement) => statement.hasDto();
}
