## 0.1.0

- Initial draft. `ContractsGenericTypeHelper` — a json_serializable `TypeHelper`
  that serializes generic contract types (`PaginatedResult<T>`, generics with
  enum / nested-generic arguments) as fields, which stock json_serializable
  cannot (issue #95). Ships as the `contractsJsonSerializable` builder, used as
  a dev dependency in place of `json_serializable` — auto-applies, no build.yaml.
