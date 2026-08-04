import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:json_serializable/json_serializable.dart';
import 'package:leancode_contracts/leancode_contracts.dart';
import 'package:leancode_contracts_generator/src/serialization/contracts_generic_type_helper.dart';
import 'package:source_gen/source_gen.dart';

/// json_serializable generation keyed to `@ContractsSerializable`, letting it
/// coexist with stock `@JsonSerializable`.
class ContractsSerializableGenerator
    extends GeneratorForAnnotation<ContractsSerializable> {
  ContractsSerializableGenerator() : super(inPackage: 'leancode_contracts');

  final JsonSerializableGenerator _inner =
      JsonSerializableGenerator.withDefaultHelpers(const [
        ContractsGenericTypeHelper(),
      ]);

  @override
  Iterable<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) => _inner.generateForAnnotatedElement(element, annotation, buildStep);
}
