import '../statement_handler.dart';

/// Returns the TypeDescriptor of the statement if it is not an Enum
TypeDescriptor? typeDescriptorOf(Statement statement) {
  if (statement.hasDto()) return statement.dto.typeDescriptor;
  if (statement.hasQuery()) return statement.query.typeDescriptor;
  if (statement.hasCommand()) return statement.command.typeDescriptor;
}