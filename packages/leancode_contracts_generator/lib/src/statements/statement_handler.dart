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

    return Class((b) {
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
          ...properties.map(_createToJsonHelper).whereType<Method>(),
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

    // json_serializable emits a field whose type is (or contains) a generic DTO
    // subclass without threading the generic-argument factories, so the value in
    // the map stays a live Dart object instead of a fully serialized map. Route
    // such fields through a generated helper so `toJson()` is self-contained.
    final needsHelper = _needsSelfContainedToJson(prop.type);

    final jsonKeyArgs = [
      if (needsExplicitRename) 'name: ${literalString(prop.name)}',
      if (needsHelper) 'toJson: ${_selfContainedHelperName(prop)}',
    ];

    return Field(
      (b) => b
        ..type = type
        ..annotations.addAll([
          if (jsonKeyArgs.isNotEmpty)
            CodeExpression(Code('JsonKey(${jsonKeyArgs.join(', ')})')),
        ])
        ..name = renamed
        ..modifier = FieldModifier.final$
        ..docs.addAll([
          ...toDartdoc(prop.comment),
          ...prop.attributes.map(attributeCreator.create),
        ]),
    );
  }

  /// A static helper method that fully serializes [prop] to a self-contained
  /// (map/list/primitive) tree, or `null` when the default json_serializable
  /// output is already self-contained.
  Method? _createToJsonHelper(PropertyRef prop) {
    if (!_needsSelfContainedToJson(prop.type)) {
      return null;
    }

    final type = typeCreator.create(prop.type);

    return Method(
      (m) => m
        ..name = _selfContainedHelperName(prop)
        ..static = true
        ..lambda = true
        ..returns = refer('Object?')
        ..requiredParameters.add(
          Parameter(
            (p) => p
              ..name = 'v'
              ..type = type,
          ),
        )
        ..body = Code(_serializeToJson(prop.type, 'v', 0)),
    );
  }

  String _selfContainedHelperName(PropertyRef prop) =>
      '_\$${renameField(prop.name)}ToJson';

  /// The generic DTO base that [statement] extends and which therefore carries a
  /// `toJson` override, or `null` when there is none. Such subclasses are the
  /// ones json_serializable emits without threading factories.
  @protected
  TypeRef? genericDtoBaseOf(Statement statement) {
    final typeDescriptor = typeDescriptorOf(statement);
    if (typeDescriptor == null) {
      return null;
    }

    return typeDescriptor.extends_1.firstWhereOrNull((e) {
      if (!e.hasInternal() || !db.shouldInclude(e.internal.name)) {
        return false;
      }
      return switch (db.find(e.internal.name)) {
        final s? =>
          s.hasDto() && s.dto.typeDescriptor.genericParameters.isNotEmpty,
        _ => false,
      };
    });
  }

  /// Whether [type] is, or transitively contains, a generic DTO subclass whose
  /// generated `toJson` does not thread the generic-argument factories.
  bool _needsSelfContainedToJson(TypeRef type) {
    if (type.hasKnown()) {
      return type.known.arguments.any(_needsSelfContainedToJson);
    }
    if (type.hasInternal()) {
      final statement = db.find(type.internal.name);
      if (statement != null &&
          statement.hasDto() &&
          genericDtoBaseOf(statement) != null) {
        return true;
      }
      return type.internal.arguments.any(_needsSelfContainedToJson);
    }
    return false;
  }

  /// Builds an expression that serializes [expr] (of type [type]) into a tree of
  /// maps/lists/primitives, threading the real generic-argument factories all the
  /// way down. Types that json_serializable already serializes correctly are left
  /// untouched (the returned expression equals [expr]).
  String _serializeToJson(TypeRef type, String expr, int depth) {
    if (type.hasKnown() && type.known.type == KnownType.Array) {
      final element = type.known.arguments.first;
      final item = 'e$depth';
      final serialized = _serializeToJson(element, item, depth + 1);
      if (serialized == item) {
        return expr;
      }
      final access = type.nullable ? '$expr?' : expr;
      return '$access.map(($item) => $serialized).toList()';
    }

    if (type.hasKnown() && type.known.type == KnownType.Map) {
      final value = type.known.arguments.last;
      final val = 'e$depth';
      final serialized = _serializeToJson(value, val, depth + 1);
      if (serialized == val) {
        return expr;
      }
      final key = 'k$depth';
      final access = type.nullable ? '$expr?' : expr;
      return '$access.map(($key, $val) => MapEntry($key, $serialized))';
    }

    if (type.hasInternal()) {
      final statement = db.find(type.internal.name);
      if (statement != null && statement.hasDto()) {
        final call = _toJsonInvocation(type, statement, expr, depth);
        if (type.nullable) {
          return '$expr == null ? null : ${_toJsonInvocation(type, statement, '$expr!', depth)}';
        }
        return call;
      }
    }

    // Primitives, enums and generic parameters are serialized by
    // json_serializable's own factory threading; leave them untouched.
    return expr;
  }

  /// A `receiver.toJson(...)` invocation whose factory arguments serialize the
  /// concrete type arguments of [type], matching the parameter order of the
  /// generated `toJson` (including the leading unused base-argument slots of a
  /// subclass override).
  String _toJsonInvocation(
    TypeRef type,
    Statement statement,
    String receiver,
    int depth,
  ) {
    final typeDescriptor = statement.dto.typeDescriptor;
    final params = typeDescriptor.genericParameters.map((g) => g.name).toList();
    final concreteArgs = type.internal.arguments;

    String factoryFor(TypeRef arg) {
      final param = 'p$depth';
      return '($param) => ${_serializeToJson(arg, param, depth + 1)}';
    }

    TypeRef concreteOf(String paramName) =>
        concreteArgs[params.indexOf(paramName)];

    final args = <String>[];
    final base = genericDtoBaseOf(statement);
    if (base != null) {
      final baseVars = {
        for (final arg in base.internal.arguments)
          if (arg.hasGeneric()) arg.generic.name,
      };
      for (final arg in base.internal.arguments) {
        if (arg.hasGeneric()) {
          args.add(factoryFor(concreteOf(arg.generic.name)));
        } else {
          args.add('null');
        }
      }
      for (final param in params.where((p) => !baseVars.contains(p))) {
        args.add(factoryFor(concreteOf(param)));
      }
    } else {
      for (final param in params) {
        args.add(factoryFor(concreteOf(param)));
      }
    }

    return args.isEmpty
        ? '$receiver.toJson()'
        : '$receiver.toJson(${args.join(', ')})';
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
