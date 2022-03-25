import 'package:code_builder/code_builder.dart';

import '../attributes/attribute_creator.dart';
import '../errors/error_creator.dart';
import '../generator_database.dart';
import '../json_converters/json_converters.dart';
import '../types/type_creator.dart';
import '../values/value_creator.dart';
import 'statement_handler.dart';
import 'utils/get_full_name_method.dart';

class CommandHandler extends StatementHandler {
  const CommandHandler(
    TypeCreator typeCreator,
    ValueCreator valueCreator,
    AttributeCreator attributeCreator,
    JsonConverters jsonConverters,
    GeneratorDatabase db,
    this.errorCreator,
  ) : super(typeCreator, valueCreator, attributeCreator, jsonConverters, db);

  final ErrorCreator errorCreator;

  @override
  Spec build(Statement statement) {
    return Library(
      (b) => b
        ..body.addAll(
          [
            createBase(statement).rebuild(
              (b) => b..methods.add(getFullNameMethod(statement)),
            ),
            errorCreator.create(
              statement.command.errorCodes,
              db.resolveName(statement.name),
            ),
          ],
        ),
    );
  }

  @override
  bool canHandle(Statement statement) => statement.hasCommand();
}
