import 'package:leancode_contracts/leancode_contracts.dart';

/// A [JsonSerializable] annotation with preset configuration.
/// Only a subset of options can be changed, rest is set to adhere
/// to contracts serialization.
class ContractsSerializable extends JsonSerializable {
  /// Constructs a pre-configured [JsonSerializable] annotation.
  const ContractsSerializable({
    bool? explicitToJson,
    bool? genericArgumentFactories,
  }) : super(
          explicitToJson: explicitToJson,
          fieldRename: FieldRename.pascal,
          converters: const [DurationJsonConverter()],
          genericArgumentFactories: genericArgumentFactories,
        );
}
