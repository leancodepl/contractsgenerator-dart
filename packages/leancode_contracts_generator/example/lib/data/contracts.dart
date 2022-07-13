// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
import 'package:leancode_contracts/leancode_contracts.dart';
part 'contracts.g.dart';

/// LeanCode.Contracts.Security.AllowUnauthorizedAttribute()
@JsonSerializable(fieldRename: FieldRename.pascal)
class Command_ with EquatableMixin implements Command {
  Command_();

  factory Command_.fromJson(Map<String, dynamic> json) =>
      _$Command_FromJson(json);

  get props => [];

  Map<String, dynamic> toJson() => _$Command_ToJson(this);
  String getFullName() => 'A.Command';
}

class CommandErrorCodes {}

/// LeanCode.Contracts.Security.AllowUnauthorizedAttribute()
@JsonSerializable(fieldRename: FieldRename.pascal)
class Query_ with EquatableMixin implements Query<int> {
  Query_();

  factory Query_.fromJson(Map<String, dynamic> json) => _$Query_FromJson(json);

  get props => [];

  Map<String, dynamic> toJson() => _$Query_ToJson(this);
  int resultFactory(dynamic decodedJson) => decodedJson as int;
  String getFullName() => 'B.Query';
}
