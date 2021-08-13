import 'package:contracts_generator/src/utils/rename_field.dart';
import 'package:test/scaffolding.dart';
import 'package:test/test.dart';

// This being here and compiling shows that these keywords can be used as identifiers
enum A {
  abstract,
  import,
  show,
  as,
  static,
  export,
  interface,
  async,
  await,
  extension,
  late,
  sync,
  external,
  library,
  factory,
  mixin,
  on,
  typedef,
  operator,
  covariant,
  part,
  get,
  required,
  deferred,
  hide,
  yield,
  dynamic,
  implements,
  set,
}

void main() {
  group('renameField', () {
    test('correctly renames', () {
      expect(renameField('PascalCase'), 'pascalCase');
      expect(renameField('OtherPascalCase'), 'otherPascalCase');
      expect(renameField('lowercase'), 'lowercase');
      expect(renameField('alreadyCamelCase'), 'alreadyCamelCase');
      expect(renameField('New'), 'new_');
      expect(renameField('default'), 'default_');
      expect(renameField('VOID'), 'void_');
    });
  });
}
