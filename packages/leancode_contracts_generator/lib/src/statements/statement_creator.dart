import 'package:code_builder/code_builder.dart';

import 'package:leancode_contracts_generator/src/statements/statement_handler.dart';

class StatementCreator {
  const StatementCreator(this.handlers);

  final List<StatementHandler> handlers;

  Spec create(Statement statement) {
    for (final handler in handlers) {
      if (handler.canHandle(statement)) {
        return handler.build(statement);
      }
    }

    throw UnimplementedError(
      'There were no handlers for the statement $statement',
    );
  }
}
