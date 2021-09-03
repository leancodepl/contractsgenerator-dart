import 'package:contracts_generator/src/attributes/attribute_creator.dart';
import 'package:contracts_generator/src/types/type_handler.dart';
import 'package:contracts_generator/src/values/value_creator.dart';
import 'package:fixnum/fixnum.dart';
import 'package:test/scaffolding.dart';
import 'package:test/test.dart';

void main() {
  const attributeCreator = AttributeCreator(ValueCreator());

  group('AttributeCreator', () {
    test('correctly creates @deprecated', () {
      final noParams = AttributeRef(attributeName: 'System.ObsoleteAttribute');
      final oneParam = AttributeRef(
        attributeName: 'System.ObsoleteAttribute',
        argument: [
          AttributeArgument(
            positional: AttributeArgument_Positional(
              value: ValueRef(
                string: ValueRef_String(value: 'Use something else'),
              ),
            ),
          ),
        ],
      );
      final twoParams = AttributeRef(
        attributeName: 'System.ObsoleteAttribute',
        argument: [
          AttributeArgument(
            positional: AttributeArgument_Positional(
              value: ValueRef(
                string: ValueRef_String(value: 'Use something else'),
              ),
            ),
          ),
          AttributeArgument(
            positional: AttributeArgument_Positional(
              value: ValueRef(
                bool_5: ValueRef_Boolean(value: true),
              ),
            ),
          ),
        ],
      );

      expect(attributeCreator.create(noParams), '@deprecated');
      expect(
        attributeCreator.create(oneParam),
        "@Deprecated('Use something else')",
      );
      expect(
        attributeCreator.create(twoParams),
        "@Deprecated('Use something else')",
      );
    });

    test('correctly creates dartdoc', () {
      final noParams = AttributeRef(attributeName: 'Some.Attribute');
      final oneParam = AttributeRef(
        attributeName: 'Some.Attribute',
        argument: [
          AttributeArgument(
            positional: AttributeArgument_Positional(
              value: ValueRef(
                number: ValueRef_Number(value: Int64(123)),
              ),
            ),
          ),
        ],
      );
      final twoParams = AttributeRef(
        attributeName: 'Some.Attribute',
        argument: [
          AttributeArgument(
            positional: AttributeArgument_Positional(
              value: ValueRef(
                number: ValueRef_Number(value: Int64(123)),
              ),
            ),
          ),
          AttributeArgument(
            named: AttributeArgument_Named(
              name: 'cool',
              value: ValueRef(
                bool_5: ValueRef_Boolean(value: true),
              ),
            ),
          ),
        ],
      );

      expect(attributeCreator.create(noParams), '/// Some.Attribute()');
      expect(
        attributeCreator.create(oneParam),
        '/// Some.Attribute(123)',
      );
      expect(
        attributeCreator.create(twoParams),
        '/// Some.Attribute(123, cool: true)',
      );
    });
  });
}
