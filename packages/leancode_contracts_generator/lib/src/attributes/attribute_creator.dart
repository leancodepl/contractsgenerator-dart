import 'package:collection/collection.dart';

import '../proto/contracts.pb.dart';
import '../values/value_creator.dart';

/// Translates attributes to a dartdoc comment,
/// or to a dart annotation if an appropriate mapping exists
class AttributeCreator {
  const AttributeCreator(this.valueCreator);

  final ValueCreator valueCreator;

  String create(AttributeRef attributeRef) {
    final knownMapping = maybeHandleDeprecated(attributeRef);
    if (knownMapping != null) {
      return knownMapping;
    }

    final params = [
      for (final param in attributeRef.argument)
        if (param.hasPositional())
          valueCreator.create(param.positional.value).assignment.toString()
        else if (param.hasNamed())
          '${param.named.name}: ${valueCreator.create(param.named.value).assignment}'
        else
          throw StateError('Unhandled AttributeRef variant'),
    ];

    return '/// ${attributeRef.attributeName}(${params.join(', ')})';
  }

  String? maybeHandleDeprecated(AttributeRef attributeRef) {
    if (attributeRef.attributeName != 'System.ObsoleteAttribute') {
      return null;
    }

    // this attribute can have zero, one, or two positional arguments
    // we don't care about the 'two' case
    final valueRef =
        attributeRef.argument.firstOrNull?.ensurePositional().value;

    if (valueRef == null) {
      return '@deprecated';
    } else {
      return '@Deprecated(${valueCreator.create(valueRef).assignment})';
    }
  }
}
