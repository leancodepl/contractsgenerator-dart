import 'package:code_builder/code_builder.dart';
import 'package:leancode_contracts_generator/src/statements/statement_handler.dart'
    hide EnumValue;
import 'package:leancode_contracts_generator/src/statements/utils/to_dartdoc.dart';
import 'package:leancode_contracts_generator/src/utils/rename_field.dart';
import 'package:leancode_contracts_generator/src/utils/rename_type.dart';

class EnumHandler extends StatementHandler {
  const EnumHandler(
    super.typeCreator,
    super.valueCreator,
    super.attributeCreator,
    super.db,
  );

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
                ..docs.addAll([
                  ...toDartdoc(e.comment),
                  ...e.attributes.map(attributeCreator.create),
                ])
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
