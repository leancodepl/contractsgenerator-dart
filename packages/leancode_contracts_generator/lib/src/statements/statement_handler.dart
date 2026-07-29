import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';
import 'package:leancode_contracts_generator/src/utils/case_helpers.dart';
import 'package:leancode_contracts_generator/src/utils/rename_type.dart';
import 'package:meta/meta.dart';

import '../attributes/attribute_creator.dart';
import '../generator_database.dart';
import '../proto/contracts.pb.dart';
import '../types/type_creator.dart';
import '../utils/rename_field.dart';
import '../values/value_creator.dart';
import 'utils/to_dartdoc.dart';
import 'utils/type_descriptor_of.dart';

export '../proto/contracts.pb.dart';

abstract class StatementHandler {
  const StatementHandler(
    this.typeCreator,
    this.valueCreator,
    this.attributeCreator,
    this.db,
  );

  final TypeCreator typeCreator;
  final ValueCreator valueCreator;
  final AttributeCreator attributeCreator;
  final GeneratorDatabase db;

  Spec build(Statement statement);

  bool canHandle(Statement statement);

  @protected
  Class createBase(Statement statement, {bool requiredParameters = false}) {
    final typeDescriptor = typeDescriptorOf(statement);
    if (typeDescriptor == null) {
      throw StateError(
        'createBase should be used with statements that have a typeDescriptor',
      );
    }
    assert(canHandle(statement));

    final name = renameType(db.resolveName(statement.name));
    final properties = db.allPropertiesOf(statement);

    final parameters = properties
        .map((e) => _createParameter(e, required: requiredParameters))
        .toList();

    final genericFactories = typeDescriptor.genericParameters
        .map((e) => _GenericFactory(e.name))
        .toList();

    db.markAsUsingJsonSerialization();

    final base = Class((b) {
      b
        ..name = name
        ..fields.addAll([
          ...typeDescriptor.constants.map(_createConstant),
          ...properties.map(_createField),
          Field(
            (f) => f
              ..name = fullNameFieldName
              ..static = true
              ..modifier = FieldModifier.constant
              ..assignment = literalString(statement.name).code,
          ),
        ])
        ..constructors.addAll([
          Constructor((b) => b..optionalParameters.addAll(parameters)),
          Constructor(
            (b) => b
              ..factory = true
              ..name = 'fromJson'
              ..lambda = true
              ..requiredParameters.addAll([
                Parameter(
                  (b) => b
                    ..name = 'json'
                    ..type = refer('Map<String, dynamic>'),
                ),
                for (final genericFactory in genericFactories)
                  Parameter(
                    (b) => b
                      ..name = genericFactory.fromJsonName
                      ..type = genericFactory.fromJsonType,
                  ),
              ])
              ..body = Code(
                '_\$${name}FromJson(${['json', ...genericFactories.map((e) => e.fromJsonName)].join(',')})',
              ),
          ),
        ])
        ..methods.addAll([
          Method(
            (m) => m
              ..returns = refer('List<Object?>')
              ..type = MethodType.getter
              ..name = 'props'
              ..lambda = true
              ..body = Code(
                '[${properties.map((e) => renameField(e.name)).join(',')}]',
              ),
          ),
          Method(
            (b) => b
              ..name = 'toJson'
              ..lambda = true
              ..returns = refer('Map<String, dynamic>')
              ..body = Code(
                '_\$${name}ToJson(${['this', ...genericFactories.map((e) => e.toJsonName)].join(',')})',
              )
              ..requiredParameters.addAll([
                for (final genericFactory in genericFactories)
                  Parameter(
                    (b) => b
                      ..name = genericFactory.toJsonName
                      ..type = genericFactory.toJsonType,
                  ),
              ]),
          ),
        ])
        ..types.addAll(
          typeDescriptor.genericParameters.map((t) => refer(t.name)),
        )
        ..annotations.addAll([
          CodeExpression(
            Code(
              'ContractsSerializable(${genericFactories.isEmpty ? '' : 'genericArgumentFactories: true'})',
            ),
          ),
        ])
        ..docs.addAll([
          ...toDartdoc(statement.comment),
          ...statement.attributes.map(attributeCreator.create),
        ])
        ..implements.addAll(
          typeDescriptor.extends_1
              // exclude extends that won't be included anyways
              .where(
                (e) => !e.hasInternal() || db.shouldInclude(e.internal.name),
              )
              // edge case: implementing the topic type does not mean anything since we
              // don't know what are the notification types
              .whereNot((e) => e.hasKnown() && e.known.type == KnownType.Topic)
              // edge case: we need to forfeit implementation of other topics. This can
              // lead to implementing the Topic interface multiple times for different
              // notification types. Dart will not allow that.
              .whereNot(
                (e) =>
                    e.hasInternal() &&
                    (db.find(e.internal.name)?.hasTopic() ?? false),
              )
              .map(typeCreator.create),
        )
        ..implements.addAll(
          db.getImplementingNotifications(statement.name).map(refer),
        )
        ..mixins.add(refer('Equatable'));
    });

    // A type extending/implementing a generic base must override its `toJson`.
    if (_inheritedToJson(statement) case final toJson?) {
      return base.rebuild(
        (b) => b.methods
          ..removeWhere((m) => m.name == 'toJson')
          ..add(toJson),
      );
    }

    return base;
  }

  /// A `toJson` override for a type extending/implementing a generic base, or
  /// `null` otherwise.
  ///
  /// A generic base's generated `toJson` takes one `Object? Function(T)` factory
  /// per type parameter, so extending it forces an override-compatible `toJson`.
  /// Here the factories are all *optional* (a concrete subtype stays callable as
  /// `toJson()`), ordered for override compatibility ([_toJsonFactoryParameters])
  /// but forwarded to `_$ChildToJson` in the child's order
  /// ([_toJsonForwardedArguments]).
  ///
  /// e.g. `ChildResult<T> extends PaginatedResult<T>` gets
  /// `toJson([Object? Function(T)? toJsonT]) =>`
  /// `    _$ChildResultToJson(this, toJsonT ?? ((v) => v))`.
  Method? _inheritedToJson(Statement statement) {
    final bases = _extendedGenericBases(statement);
    if (bases.isEmpty) {
      return null;
    }

    final name = renameType(db.resolveName(statement.name));
    final childParams = typeDescriptorOf(
      statement,
    )!.genericParameters.map((g) => g.name).toList();

    return Method(
      (m) => m
        ..name = 'toJson'
        ..lambda = true
        ..returns = refer('Map<String, dynamic>')
        ..optionalParameters.addAll(
          _toJsonFactoryParameters(bases, childParams),
        )
        ..body = Code(
          '_\$${name}ToJson(${_toJsonForwardedArguments(childParams).join(', ')})',
        ),
    );
  }

  /// The generic bases this statement extends/implements — a C# base class
  /// and/or one or more generic interfaces — whose `toJson` the override has to
  /// stay compatible with. Empty if there are none.
  List<TypeRef> _extendedGenericBases(Statement statement) {
    // Non-null: createBase already rejects typeless statements.
    return typeDescriptorOf(statement)!.extends_1.where((e) {
      // Only a type we generate can be a base whose `toJson` we override, and
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
    }).toList();
  }

  /// Optional factory parameters for the override: one per position of the
  /// widest base, plus one per child type variable no position forwards.
  ///
  /// A position all bases bind to the same type variable forwards it as
  /// `Object? Function(<var>)?` named `toJson<var>`, but only from its first
  /// such position. Any other position — a disagreement, a concrete type, or a
  /// variable forwarded earlier (as in `IPairFacet<T, T>`) — is unused:
  /// `Object? Function(Never)?` named `_` (`Never` validly overrides any type).
  List<Parameter> _toJsonFactoryParameters(
    List<TypeRef> bases,
    List<String> childParams,
  ) {
    Parameter optionalFactory(String? childVar) => Parameter(
      (p) => p
        ..name = childVar != null ? 'toJson$childVar' : '_'
        ..type = refer('Object? Function(${childVar ?? 'Never'})?'),
    );

    final arity = bases.map((b) => b.internal.arguments.length).max;

    // The variable each position agrees on, or null if the bases disagree or
    // bind a concrete type there.
    final agreed = [
      for (var i = 0; i < arity; i++)
        bases
            .map((b) => b.internal.arguments)
            .where((args) => i < args.length)
            .map((args) => args[i].hasGeneric() ? args[i].generic.name : null)
            .toSet()
            .singleOrNull,
    ];

    // Forward each variable only from its first position, so one bound at
    // several positions doesn't emit duplicate parameter names.
    final forwarded = <String>{};
    return [
      for (final childVar in agreed)
        optionalFactory(
          childVar != null && forwarded.add(childVar) ? childVar : null,
        ),
      for (final param in childParams.whereNot(forwarded.contains))
        optionalFactory(param),
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

  Parameter _createParameter(PropertyRef prop, {required bool required}) {
    final type = typeCreator.create(prop.type);

    return Parameter(
      (b) => b
        ..name = renameField(prop.name)
        ..required = !(type.symbol?.endsWith('?') ?? false) || required
        ..named = true
        ..toThis = true,
    );
  }

  Field _createField(PropertyRef prop) {
    final type = typeCreator.create(prop.type);
    final renamed = renameField(prop.name);

    final needsExplicitRename = renamed.pascal != prop.name;

    return Field(
      (b) => b
        ..type = type
        ..annotations.addAll([
          if (needsExplicitRename)
            CodeExpression(Code('JsonKey(name: ${literalString(prop.name)})')),
        ])
        ..name = renamed
        ..modifier = FieldModifier.final$
        ..docs.addAll([
          ...toDartdoc(prop.comment),
          ...prop.attributes.map(attributeCreator.create),
        ]),
    );
  }

  Field _createConstant(ConstantRef prop) {
    return valueCreator
        .create(prop.value)
        .rebuild(
          (b) => b
            ..name = renameField(prop.name)
            ..modifier = FieldModifier.constant
            ..static = true
            ..docs.addAll(toDartdoc(prop.comment)),
        );
  }
}

const fullNameFieldName = r'fullName$';

class _GenericFactory {
  const _GenericFactory(this.paramName);

  final String paramName;

  Reference get toJsonType => refer('Object? Function($paramName)');
  String get toJsonName => 'toJson$paramName';

  Reference get fromJsonType => refer('$paramName Function(Object?)');
  String get fromJsonName => 'fromJson$paramName';
}
