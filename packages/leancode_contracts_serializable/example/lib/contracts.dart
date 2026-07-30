// Mirrors generator output: generic DTOs have no `toJson`. Stock
// json_serializable can't serialize them as fields; this builder can.
// ignore_for_file: type=lint
import 'package:leancode_contracts/leancode_contracts.dart';

part 'contracts.g.dart';

enum Priority {
  @JsonValue(0)
  low,
  @JsonValue(1)
  high,
}

@ContractsSerializable(genericArgumentFactories: true)
class PaginatedResult<T> with Equatable {
  PaginatedResult({required this.items, required this.totalCount});
  factory PaginatedResult.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$PaginatedResultFromJson(json, fromJsonT);
  final List<T> items;
  final int totalCount;
  @override
  List<Object?> get props => [items, totalCount];
}

@ContractsSerializable()
class Report with Equatable {
  Report({required this.byPriority, required this.paged, this.maybePaged});
  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);

  /// enum as a generic argument
  final PaginatedResult<Priority> byPriority;

  /// nested generic with an enum leaf
  final PaginatedResult<PaginatedResult<Priority>> paged;

  /// nullable generic field
  final PaginatedResult<Priority>? maybePaged;

  @override
  List<Object?> get props => [byPriority, paged, maybePaged];
  Map<String, dynamic> toJson() => _$ReportToJson(this);
}
