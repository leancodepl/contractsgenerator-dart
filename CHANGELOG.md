# Unreleased

- Drop support for `json_serializable: ^4.0.0`

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
