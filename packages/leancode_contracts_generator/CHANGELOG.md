# 0.9.0

- Fix double trailing commas. More trailing commas will appear with statements.
- **BREAKING**: Bump Dart SDK to 2.17

# 0.8.1

- Fix missing type cast in result factories

# 0.8.0

- Annotate statements with `ContractsSerializable` instead of plain `JsonSerializable`
- **BREAKING**: Generated `Command`s, `Query`s, and `Operation`s now require all constructor parameters to be provided

# 0.7.0

- Add verbose CLI logging under the `--verbose`/`-v` flag
- Sort generated statements according to namespace
- Add support for `KnownType::Binary`
- Add support for `KnownType::Operation`
- **BREAKING**: Bump `LeanCode.ContractsGenerator` to `v2.0.0-alpha.1`

# 0.6.1

- Add missing result factory mapping for `DateTimeOffset`

# 0.6.0

- Support `LeanCode.ContractsGenerator` `v1.0.0`
- **BREAKING**: `KnownType::DateTimeOffset` is now correctly (de)serialized to a dedicated `DateTimeOffset` type from `package:leancode_contracts`. See the type's definition for more info about conversions between `DateTime`, `DateOnly`, `TimeOnly`, and `DateTimeOffset`.

# 0.5.0

- **BREAKING**: generates contracts now depend on `package:leancode_contracts`
- **BREAKING**: `package:contracts_generator` has been discontinued and replaced with `package:leancode_contracts_generator`
- **BREAKING**: generated contracts use `Query` and `Command` from `package:cqrs` instead of `IRemoteQuery` and `IRemoteCommand`
- **BREAKING**: Generate `DateOnly` instead of `DateTime` where appropriate

Migration from `v0.4.x` to `v0.5.0`:

- Remove `contracts_generator` and install `leancode_contracts_generator`: `dart pub remove contracts_generator && dart pub add leancode_contracts_generator --dev`
- Add `leancode_contracts` package: `dart pub add leancode_contracts`
- If you ever imported generated contracts for a contract type (such as `TimeOnly`) you will now have to import `package:leancode_contracts/leancode_contracts.dart`
- _Optional_: if you are not using them directly, you can remove dependency on `package:equatable`, `package:cqrs`, and `package:json_annotation`

# 0.4.3

- Remove dependency on `package:build_test`

# 0.4.2

- Require `cqrs: ^6.2.0` and remove unused generated import

# 0.4.1

- Generated contracts now ignore the linter

# 0.4.0

- **Breaking**: Drop support for `json_serializable: ^4.0.0`
- Allow overriding generator version with `input.override_generator_version`
- Support `LeanCode.ContractsGenerator` `v0.1.0-alpha10`
  - Drop support for `System.decimal`
- **Breaking**: Remove `toJson` method on generic DTOs

# 0.3.0

- **Breaking**: require .NET 6
- Add support for `CommandResult`
- Add support for `TimeOnly` and `DateOnly`
- Correctly deserialize `TimeSpan`

# 0.2.4

- Relax `json_serializable` version requirement (now `4.x.x`, `5.x.x`, and `6.x.x` are accepted)

# 0.2.3

- Relax `json_serializable` version requirement (now both `4.x.x` and `5.x.x` is accepted)

# 0.2.2

- Attributes are now generated as dartdoc unless there exists a known mapping to an existing dart annotation. For now `@[Dd]eprecated` is the only known mapping

# 0.2.1

- Rename identifiers that would cause syntax errors
- Improve error reporting

# 0.2.0+2

- Bump `LeanCode.ContractsGenerator` to `v0.1.0-alpha3`

# 0.2.0+1

- Republish missing commits

# 0.2.0

- **BREAKING**: Add support for `project` and `path` input methods in config file
- Add directives config option
- Fix incorrect field renaming
- Stopped generating redundant dart doc from constructor parameters
- Annotate generic classes with `genericArgumentFactories: true`

# 0.1.0

- Initial release

# 0.0.1

- Big Bang
