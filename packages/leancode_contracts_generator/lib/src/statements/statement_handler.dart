import 'package:code_builder/code_builder.dart';
import 'package:leancode_contracts_generator/src/utils/rename_type.dart';
import 'package:meta/meta.dart';
import 'package:source_helper/source_helper.dart';

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
    assert(
      typeDescriptorOf(statement) != null,
      'createBase should be used with statements that have a typeDescriptor',
    );
    assert(canHandle(statement));

    final name = renameType(db.resolveName(statement.name));
    final typeDescriptor = typeDescriptorOf(statement)!;
    final properties = db.allPropertiesOf(statement);

    final parameters = properties
        .map((e) => _createParameter(e, required: requiredParameters))
        .toList();

    final genericFactories = typeDescriptor.genericParameters
        .map((e) => _GenericFactory(e.name))
        .toList();

    return Class((b) {
      b
        ..name = name
        ..fields.addAll([
          ...typeDescriptor.constants.map(_createConstant),
          ...properties.map(_createField),
          // workaround to generate a getter
          Field(
            (b) => b
              ..name =
                  'get props => [${properties.map((e) => renameField(e.name)).join(',')}]'
              ..type = refer('List<Object?>'),
          ),
        ])
        ..constructors.addAll([
          Constructor(
            (b) => b..optionalParameters.addAll(parameters),
          ),
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
                '_\$${name}FromJson(${[
                  'json',
                  ...genericFactories.map((e) => e.fromJsonName),
                ].join(',')})',
              ),
          ),
        ])
        ..methods.add(
          Method(
            (b) => b
              ..name = 'toJson'
              ..lambda = true
              ..returns = refer('Map<String, dynamic>')
              ..body = Code(
                '_\$${name}ToJson(${[
                  'this',
                  ...genericFactories.map((e) => e.toJsonName),
                ].join(',')})',
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
        )
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
              .map(typeCreator.create),
        )
        ..mixins.add(refer('EquatableMixin'));
    });
  }

  Parameter _createParameter(
    PropertyRef prop, {
    required bool required,
  }) {
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
    return valueCreator.create(prop.value).rebuild(
          (b) => b
            ..name = renameField(prop.name)
            ..modifier = FieldModifier.constant
            ..static = true
            ..docs.addAll(toDartdoc(prop.comment)),
        );
  }
}

class _GenericFactory {
  const _GenericFactory(this.paramName);

  final String paramName;

  Reference get toJsonType => refer('Object? Function($paramName)');
  String get toJsonName => 'toJson$paramName';

  Reference get fromJsonType => refer('$paramName Function(Object?)');
  String get fromJsonName => 'fromJson$paramName';
}
