import 'package:cqrs/contracts.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'contracts.g.dart';

final _ = EquatableConfig.stringify = true;

class DurationJsonConverter extends JsonConverter<Duration, String> {
  const DurationJsonConverter();

  Duration fromJson(String json) {
    final m = RegExp(r'^-?((\d+)\.)?(\d\d):(\d\d):(\d\d)(\.(\d+))?$')
        .firstMatch(json)!;
    return Duration(
          days: int.parse(m[2] ?? '0'),
          hours: int.parse(m[3]!),
          minutes: int.parse(m[4]!),
          seconds: int.parse(m[5]!),
          microseconds: int.parse(m[7] ?? '0') ~/ 10,
        ) *
        (json.startsWith('-') ? -1 : 1);
  }

  String toJson(Duration value) {
    if (value.isNegative) return '-${toJson(-value)}';

    return '${value.inDays}.'
        '${value.inHours % Duration.hoursPerDay}:'
        '${value.inMinutes % Duration.minutesPerHour}:'
        '${value.inSeconds % Duration.secondsPerMinute}.'
        '${(value.inMicroseconds % Duration.microsecondsPerSecond).toString().padLeft(6, '0')}';
  }
}

class NullableDurationJsonConverter extends JsonConverter<Duration?, String?> {
  const NullableDurationJsonConverter();

  Duration? fromJson(String? json) =>
      json == null ? null : const DurationJsonConverter().fromJson(json);
  String? toJson(Duration? value) =>
      value == null ? null : const DurationJsonConverter().toJson(value);
}

/// [TimeOfDay] but with seconds precision
class Time with EquatableMixin {
  const Time(this.hour, this.minute, this.second)
      : assert(hour >= 0 && hour <= 23),
        assert(minute >= 0 && minute <= 59),
        assert(second >= 0 && second <= 59);

  factory Time.fromJson(String json) {
    final chunks = json.split(':');
    return Time(
      int.parse(chunks[0]),
      int.parse(chunks[1]),
      int.parse(chunks[2]),
    );
  }

  final int hour;

  final int minute;

  final int second;

  get props => [hour, minute, second];

  String toJson() => '$hour:$minute:$second';
}

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
