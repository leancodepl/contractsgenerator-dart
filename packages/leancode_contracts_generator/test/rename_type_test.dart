import 'package:leancode_contracts_generator/src/utils/rename_type.dart';
import 'package:test/test.dart';

void main() {
  group('renameType', () {
    test('correctly renames', () {
      expect(renameType('Duration'), 'Duration_');
      expect(renameType('Query'), 'Query_');
      expect(renameType('Command'), 'Command_');
      expect(renameType('Object'), 'Object_');
      expect(renameType('await'), 'await');
      expect(renameType('Something'), 'Something');
    });
  });
}
