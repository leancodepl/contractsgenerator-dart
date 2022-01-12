import 'package:code_builder/code_builder.dart';

import '../attributes/attribute_creator.dart';
import '../generator_database.dart';
import '../json_converters/json_converters.dart';
import '../types/type_creator.dart';
import '../values/value_creator.dart';
import 'statement_handler.dart';

class DtoHandler extends StatementHandler {
  const DtoHandler(
    TypeCreator typeCreator,
    ValueCreator valueCreator,
    AttributeCreator attributeCreator,
    JsonConverters jsonConverters,
    GeneratorDatabase db,
  ) : super(typeCreator, valueCreator, attributeCreator, jsonConverters, db);

  @override
  Spec build(Statement statement) {
    return createBase(statement).rebuild((b) {
      final typeDescriptor = statement.dto.typeDescriptor;

      // make it abstract if it extends a cqrs type
      b.abstract = typeDescriptor.extends_1.any(db.isCqrs);

      if (b.abstract) {
        b
          ..annotations.clear()
          ..methods.clear()
          ..constructors.removeWhere((e) => e.name == 'fromJson');
      }

      // remove serde from generic DTOs
      if (typeDescriptor.genericParameters.isNotEmpty) {
        b.methods.clear();
      }
    });
  }

  @override
  bool canHandle(Statement statement) => statement.hasDto();
}
