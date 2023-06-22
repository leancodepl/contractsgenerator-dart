# 0.6.0

- **BREAKING**: Removed `DateOnly.source`. Use `DateOnly.toDateTimeLocal()` or `DateOnly.toDateTimeUtc()` instead
- **BREAKING**: Removed `TimeOnly.source`. Use `DateOnly.toDuration()` instead
- **BREAKING**: `TimeOnly` constructor now accepts individual components instead of a `Duration` object. Use `TimeOnly.fromDuration` instead
- Allow `cqrs` v9

# 0.5.0

- **BREAKING**: Bump minimum dart SDK to 2.17.0
- Change the `pacakge:cqrs` constraint to `">=7.0.0 <9.0.0"`

# 0.4.1

- Fix `Binary` type not being exported

# 0.4.0

- **BREAKING**: Remove `NullableDurationJsonConverter`
- Add `@ContractsSerializable` annotation with pre-configured options for contracts

# 0.3.0

- Add `Binary` type
- Bump `package:cqrs` to `7.0.0`

# 0.2.2

- Add `DateTimeOffset` type
- Implement `Comparable` for `DateOnly` and `TimeOnly`

# 0.2.1

- Fix `DateOnly` not dropping time part

# 0.2.0

- Fix `TimeOnly` serde
- Fix `Duration` serde
- Add `DateOnly` type
- Export `package:cqrs/cqrs.dart` instead of `package:cqrs/contracts.dart`

# 0.1.0

- Initial release
