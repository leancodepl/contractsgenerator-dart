import 'package:leancode_contracts/leancode_contracts.dart';

/// Preset serialization config for generated contract types.
///
/// Standalone (not a [JsonSerializable] subtype) so stock json_serializable
/// skips it, leaving it to `leancode_contracts_generator`'s builder.
class ContractsSerializable {
  /// Creates the annotation; only [genericArgumentFactories] is meaningful.
  const ContractsSerializable({this.genericArgumentFactories});

  /// Whether generated (de)serializers take a factory per type argument.
  final bool? genericArgumentFactories;

  /// Preset: JSON keys use PascalCase.
  final FieldRename fieldRename = FieldRename.pascal;

  /// Preset converters applied to matching field types.
  final List<JsonConverter<dynamic, dynamic>> converters = const [
    DurationJsonConverter(),
  ];

  /// Unused; mirrors [JsonSerializable] so json_serializable's config reader,
  /// which reads every field by name, accepts an instance.
  final String? constructor = null;

  /// Unused; mirror [JsonSerializable] so json_serializable's config reader,
  /// which reads every field by name, accepts an instance.
  final bool? explicitToJson = null,
      anyMap = null,
      checked = null,
      createFactory = null,
      createToJson = null,
      createFieldMap = null,
      createJsonKeys = null,
      createPerFieldToJson = null,
      dateTimeUtc = null,
      disallowUnrecognizedKeys = null,
      ignoreUnannotated = null,
      includeIfNull = null,
      createJsonSchema = null;
}
