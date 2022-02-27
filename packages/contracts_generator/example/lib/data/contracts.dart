// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
import 'package:contracts_runtime/contracts.dart';
part 'contracts.g.dart';

/// LeanCode.CQRS.Security.AllowUnauthorizedAttribute()
@JsonSerializable(fieldRename: FieldRename.pascal)
class Command with EquatableMixin implements IRemoteCommand {
  Command();

  factory Command.fromJson(Map<String, dynamic> json) =>
      _$CommandFromJson(json);

  get props => [];

  Map<String, dynamic> toJson() => _$CommandToJson(this);
  String getFullName() => 'A.Command';
}

class CommandErrorCodes {}

/// LeanCode.CQRS.Security.AllowUnauthorizedAttribute()
@JsonSerializable(fieldRename: FieldRename.pascal)
class Query with EquatableMixin implements IRemoteQuery<int> {
  Query();

  factory Query.fromJson(Map<String, dynamic> json) => _$QueryFromJson(json);

  get props => [];

  Map<String, dynamic> toJson() => _$QueryToJson(this);
  int resultFactory(dynamic decodedJson) => decodedJson as int;
  String getFullName() => 'B.Query';
}
