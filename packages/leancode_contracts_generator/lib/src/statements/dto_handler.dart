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

      // a subclass of a generic DTO needs a toJson that overrides the base's (#95)
      if (_inheritedToJson(statement) case final toJson?) {
        b.methods
          ..removeWhere((m) => m.name == 'toJson')
          ..add(toJson);
      }
    });
  }

  /// A `toJson` override for a DTO extending a generic DTO, or `null` otherwise.
  ///
  /// A generic DTO's generated `toJson` takes one `Object? Function(T)` factory
  /// per type parameter; extending it forces an override-compatible `toJson`, so
  /// the factories can't be dropped. Here they're all *optional* (a concrete
  /// subclass stays callable as `toJson()`), ordered by the base's type
  /// arguments for override compatibility ([_toJsonFactoryParameters]) but
  /// forwarded to `_$ChildToJson` in the child's order ([_toJsonForwardedArguments]).
  ///
  /// e.g. `ChildResult<T> extends PaginatedResult<T>` gets
  /// `toJson([Object? Function(T)? toJsonT]) =>`
  /// `    _$ChildResultToJson(this, toJsonT ?? ((v) => v))`.
  Method? _inheritedToJson(Statement statement) {
    if (_extendedGenericBase(statement) case final base?) {
      final name = renameType(db.resolveName(statement.name));
      final childParams = statement.dto.typeDescriptor.genericParameters
          .map((g) => g.name)
          .toList();

      return Method(
        (m) => m
          ..name = 'toJson'
          ..lambda = true
          ..returns = refer('Map<String, dynamic>')
          ..optionalParameters.addAll(
            _toJsonFactoryParameters(base, childParams),
          )
          ..body = Code(
            '_\$${name}ToJson(${_toJsonForwardedArguments(childParams).join(', ')})',
          ),
      );
    }

    return null;
  }

  /// The generic DTO this one extends (at most one — a C# base class), whose
  /// `toJson` the override has to stay compatible with, or `null` if there's none.
  TypeRef? _extendedGenericBase(Statement statement) {
    return statement.dto.typeDescriptor.extends_1.firstWhereOrNull((e) {
      // Only a type we generate can be the base whose `toJson` we override, and
      // dropping the ones config excludes keeps us in sync with `createBase`,
      // which extends only included bases. The guard also makes reading
      // `e.internal.name` below safe (a non-internal ref has no name).
      if (!e.hasInternal() || !db.shouldInclude(e.internal.name)) {
        return false;
      }
      final resolved = db.find(e.internal.name);
      return resolved != null &&
          resolved.hasDto() &&
          resolved.dto.typeDescriptor.genericParameters.isNotEmpty;
    });
  }

  /// Optional `Object? Function(T)?` factory parameters, in the base's
  /// type-argument order then one per child param the base doesn't cover.
  /// A factory bound to a child type variable is named `toJson<var>` so
  /// [_toJsonForwardedArguments] can forward it; one for a *concrete* base
  /// argument is unused, so it's named `_` (a wildcard) to make that explicit.
  List<Parameter> _toJsonFactoryParameters(
    TypeRef base,
    List<String> childParams,
  ) {
    final baseVars = {
      for (final arg in base.internal.arguments)
        if (arg.hasGeneric()) arg.generic.name,
    };

    Parameter optionalFactory(String on, String named) => Parameter(
      (p) => p
        ..name = named
        ..type = refer('Object? Function($on)?'),
    );

    return [
      for (final arg in base.internal.arguments)
        optionalFactory(
          typeCreator.create(arg).symbol!,
          arg.hasGeneric() ? 'toJson${arg.generic.name}' : '_',
        ),
      for (final param in childParams.where((p) => !baseVars.contains(p)))
        optionalFactory(param, 'toJson$param'),
    ];
  }

  /// Arguments forwarded to the generated `_$ChildToJson`, in the child's
  /// type-parameter declaration order (what json_serializable expects). An
  /// omitted optional factory falls back to the identity function.
  List<String> _toJsonForwardedArguments(List<String> childParams) {
    return [
      'this',
      for (final param in childParams) 'toJson$param ?? ((v) => v)',
    ];
  }

  @override
  bool canHandle(Statement statement) => statement.hasDto();
}
