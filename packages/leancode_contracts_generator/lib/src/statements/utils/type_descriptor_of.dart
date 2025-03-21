import '../statement_handler.dart';

/// Returns the TypeDescriptor of the statement if it is not an Enum
TypeDescriptor? typeDescriptorOf(Statement statement) {
  return switch (statement.whichContent()) {
    Statement_Content.dto => statement.dto.typeDescriptor,
    Statement_Content.query => statement.query.typeDescriptor,
    Statement_Content.command => statement.command.typeDescriptor,
    Statement_Content.operation => statement.operation.typeDescriptor,
    Statement_Content.topic => statement.topic.typeDescriptor,
    Statement_Content.enum_11 || Statement_Content.notSet => null,
  };
}
