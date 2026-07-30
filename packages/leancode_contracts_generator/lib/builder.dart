import 'package:build/build.dart';
import 'package:leancode_contracts_generator/src/serialization/contracts_serializable_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder contractsSerializable(BuilderOptions options) =>
    SharedPartBuilder([ContractsSerializableGenerator()], 'contracts');
