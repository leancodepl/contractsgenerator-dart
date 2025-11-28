import 'package:code_builder/code_builder.dart';
import 'package:leancode_contracts_generator/src/statements/utils/full_name_field.dart';

import '../errors/error_creator.dart';
import 'statement_handler.dart';
import 'utils/get_full_name_method.dart';

class CommandHandler extends StatementHandler {
  const CommandHandler(
    super.typeCreator,
    super.valueCreator,
    super.attributeCreator,
    super.db,
    this.errorCreator,
  );

  final ErrorCreator errorCreator;

  @override
  Spec build(Statement statement) {
    return Library(
      (b) => b
        ..body.addAll([
          createBase(statement, requiredParameters: true).rebuild(
            (b) => b
              ..fields.add(fullNameField(statement))
              ..methods.add(getFullNameMethod),
          ),
          errorCreator.create(
            statement.command.errorCodes,
            db.resolveName(statement.name),
          ),
        ]),
    );
  }

  @override
  bool canHandle(Statement statement) => statement.hasCommand();
}
