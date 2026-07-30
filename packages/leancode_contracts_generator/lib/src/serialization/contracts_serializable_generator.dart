import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:json_serializable/json_serializable.dart';
import 'package:leancode_contracts_generator/src/serialization/contracts_generic_type_helper.dart';
import 'package:source_gen/source_gen.dart';

/// json_serializable generation keyed to `@ContractsSerializable` (matched by
/// name, so this package needs no dependency on the annotation), letting it
/// coexist with stock `@JsonSerializable`.
class ContractsSerializableGenerator extends GeneratorForAnnotation<Object> {
  ContractsSerializableGenerator()
    : _inner = JsonSerializableGenerator.withDefaultHelpers(const [
        ContractsGenericTypeHelper(),
      ]);

  final JsonSerializableGenerator _inner;

  @override
  TypeChecker get typeChecker => const TypeChecker.typeNamedLiterally(
    'ContractsSerializable',
    inPackage: 'leancode_contracts',
  );

  @override
  Iterable<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) => _inner.generateForAnnotatedElement(element, annotation, buildStep);
}
