import '../statement_handler.dart';

/// Returns the TypeDescriptor of the statement if it is not an Enum
TypeDescriptor? typeDescriptorOf(Statement statement) {
  if (statement.hasDto()) {
    return statement.dto.typeDescriptor;
  } else if (statement.hasQuery()) {
    return statement.query.typeDescriptor;
  } else if (statement.hasCommand()) {
    return statement.command.typeDescriptor;
  } else if (statement.hasOperation()) {
    return statement.operation.typeDescriptor;
  }

  return null;
}
