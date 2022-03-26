import 'package:code_builder/code_builder.dart';
import 'package:leancode_contracts_generator/src/utils/rename_type.dart';

import '../attributes/attribute_creator.dart';
import '../generator_database.dart';
import '../json_converters/json_converters.dart';
import '../types/type_creator.dart';
import '../utils/rename_field.dart';
import '../values/value_creator.dart';
import 'statement_handler.dart' hide EnumValue;
import 'utils/to_dartdoc.dart';

class EnumHandler extends StatementHandler {
  const EnumHandler(
    TypeCreator typeCreator,
    ValueCreator valueCreator,
    AttributeCreator attributeCreator,
    JsonConverters jsonConverters,
    GeneratorDatabase db,
  ) : super(typeCreator, valueCreator, attributeCreator, jsonConverters, db);

  @override
  Spec build(Statement statement) {
    final name = renameType(db.resolveName(statement.name));

    return Enum(
      (b) => b
        ..name = name
        ..docs.addAll([
          ...toDartdoc(statement.comment),
          ...statement.attributes.map(attributeCreator.create),
        ])
        ..values.addAll(
          statement.enum_11.members.map(
            (e) => EnumValue(
              (b) => b
                ..name = renameField(e.name)
                ..docs.addAll(toDartdoc(e.comment))
                ..annotations.add(
                  CodeExpression(Code('JsonValue(${e.value})')),
                ),
            ),
          ),
        ),
    );
  }

  @override
  bool canHandle(Statement statement) => statement.hasEnum_11();
}
