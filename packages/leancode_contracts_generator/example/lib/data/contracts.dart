// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
import 'package:leancode_contracts/leancode_contracts.dart';
import 'package:leancode_pipe/leancode_pipe.dart';
part 'contracts.g.dart';

/// LeanCode.Contracts.Security.AllowUnauthorizedAttribute()
@ContractsSerializable()
class Command_ with EquatableMixin implements Command {
  Command_();

  factory Command_.fromJson(Map<String, dynamic> json) =>
      _$Command_FromJson(json);

  List<Object?> get props => [];

  Map<String, dynamic> toJson() => _$Command_ToJson(this);

  String getFullName() => 'A.Command';
}

class CommandErrorCodes {}

/// LeanCode.Contracts.Security.AllowUnauthorizedAttribute()
@ContractsSerializable()
class Query_ with EquatableMixin implements Query<int> {
  Query_();

  factory Query_.fromJson(Map<String, dynamic> json) => _$Query_FromJson(json);

  List<Object?> get props => [];

  Map<String, dynamic> toJson() => _$Query_ToJson(this);

  int resultFactory(dynamic decodedJson) => decodedJson as int;

  String getFullName() => 'B.Query';
}

@ContractsSerializable()
class Notification with EquatableMixin implements TopicNotification {
  Notification();

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);

  List<Object?> get props => [];

  Map<String, dynamic> toJson() => _$NotificationToJson(this);
}

@ContractsSerializable()
class Topic_ with EquatableMixin implements Topic<TopicNotification> {
  Topic_();

  factory Topic_.fromJson(Map<String, dynamic> json) => _$Topic_FromJson(json);

  List<Object?> get props => [];

  Map<String, dynamic> toJson() => _$Topic_ToJson(this);

  TopicNotification? castNotification(String tag, dynamic json) =>
      switch (tag) {
            'C.Notification' => _$NotificationFromJson(
              json as Map<String, dynamic>,
            ),
            _ => null,
          }
          as TopicNotification?;

  Topic_ fromJson(Map<String, dynamic> json) => Topic_.fromJson(json);

  String getFullName() => 'C.Topic';
}

sealed class TopicNotification {}
