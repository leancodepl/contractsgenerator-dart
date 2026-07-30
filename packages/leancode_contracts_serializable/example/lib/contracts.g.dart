// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contracts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedResult<T> _$PaginatedResultFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => PaginatedResult<T>(
  items: (json['Items'] as List<dynamic>).map(fromJsonT).toList(),
  totalCount: (json['TotalCount'] as num).toInt(),
);

Map<String, dynamic> _$PaginatedResultToJson<T>(
  PaginatedResult<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'Items': instance.items.map(toJsonT).toList(),
  'TotalCount': instance.totalCount,
};

Report _$ReportFromJson(Map<String, dynamic> json) => Report(
  byPriority: _$PaginatedResultFromJson(
    json['ByPriority'] as Map<String, dynamic>,
    (value) => $enumDecode(_$PriorityEnumMap, value),
  ),
  paged: _$PaginatedResultFromJson(
    json['Paged'] as Map<String, dynamic>,
    (value) => _$PaginatedResultFromJson(
      value as Map<String, dynamic>,
      (value) => $enumDecode(_$PriorityEnumMap, value),
    ),
  ),
  maybePaged: json['MaybePaged'] == null
      ? null
      : _$PaginatedResultFromJson(
          json['MaybePaged'] as Map<String, dynamic>,
          (value) => $enumDecode(_$PriorityEnumMap, value),
        ),
);

Map<String, dynamic> _$ReportToJson(Report instance) => <String, dynamic>{
  'ByPriority': _$PaginatedResultToJson(
    instance.byPriority,
    (value) => _$PriorityEnumMap[value]!,
  ),
  'Paged': _$PaginatedResultToJson(
    instance.paged,
    (value) =>
        _$PaginatedResultToJson(value, (value) => _$PriorityEnumMap[value]!),
  ),
  'MaybePaged': instance.maybePaged == null
      ? null
      : _$PaginatedResultToJson(
          instance.maybePaged!,
          (value) => _$PriorityEnumMap[value]!,
        ),
};

const _$PriorityEnumMap = {Priority.low: 0, Priority.high: 1};
