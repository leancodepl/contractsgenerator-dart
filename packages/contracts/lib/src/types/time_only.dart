import 'package:equatable/equatable.dart';

import '../json_converters/duration_json_converter.dart';

class TimeOnly with EquatableMixin {
  const TimeOnly(this._source)
      : assert(_source < const Duration(days: 1) && _source >= Duration.zero);

  TimeOnly.fromJson(String json)
      : this(const DurationJsonConverter().fromJson(json));

  final Duration _source;

  int get hour => _source.inHours % Duration.hoursPerDay;
  int get minute => _source.inMinutes % Duration.minutesPerHour;
  int get second => _source.inSeconds % Duration.secondsPerMinute;
  int get microsecond =>
      _source.inMicroseconds % Duration.microsecondsPerSecond;

  @override
  List<Object> get props => [_source];

  String toJson() => const DurationJsonConverter().toJson(_source);
}
