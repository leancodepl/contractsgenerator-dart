import 'dart:convert';

import 'package:example/contracts.dart';

void main() {
  final report = Report(
    byPriority: PaginatedResult<Priority>(
      items: [Priority.high, Priority.low],
      totalCount: 2,
    ),
    paged: PaginatedResult<PaginatedResult<Priority>>(
      items: [
        PaginatedResult<Priority>(items: [Priority.high], totalCount: 1),
      ],
      totalCount: 1,
    ),
  );

  final encoded = jsonEncode(report);
  print('encoded -> $encoded');

  final decoded = Report.fromJson(jsonDecode(encoded) as Map<String, dynamic>);
  if (decoded != report) {
    throw StateError('round-trip changed the value');
  }
  print('round-trip OK');
}
