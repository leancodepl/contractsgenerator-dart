import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';

import '../utils/rename_type.dart';
import 'statement_handler.dart';

class DtoHandler extends StatementHandler {
  const DtoHandler(
    super.typeCreator,
    super.valueCreator,
    super.attributeCreator,
    super.db,
  );

  @override
  Spec build(Statement statement) {
    return createBase(statement).rebuild((b) {
      final typeDescriptor = statement.dto.typeDescriptor;

      // make it abstract if it extends a protocol type
      b.abstract = typeDescriptor.extends_1.any(db.isProtocol);

      if (b.abstract) {
        b
          ..annotations.clear()
          ..methods.clear()
          ..constructors.removeWhere((e) => e.name == 'fromJson');
        return;
      }

      // a subclass of a generic DTO needs a toJson that overrides the base's (#95)
      final toJson = _inheritedToJson(statement);
      if (toJson != null) {
        b.methods
          ..removeWhere((m) => m.name == 'toJson')
          ..add(toJson);
      }
    });
  }

  /// A `toJson` override for a DTO extending a generic DTO, or `null` otherwise.
  Method? _inheritedToJson(Statement statement) {
    final base = statement.dto.typeDescriptor.extends_1.firstWhereOrNull((e) {
      if (!e.hasInternal() || !db.shouldInclude(e.internal.name)) {
        return false;
      }
      final s = db.find(e.internal.name);
      return s != null &&
          s.hasDto() &&
          s.dto.typeDescriptor.genericParameters.isNotEmpty;
    });
    if (base == null) {
      return null;
    }

    final name = renameType(db.resolveName(statement.name));
    final childParams = statement.dto.typeDescriptor.genericParameters.map(
      (g) => g.name,
    );

    // All factories are optional (an optional positional validly overrides a
    // required one), base type-arg factories first so slots line up with the base.
    final params = <Parameter>[];
    final covered = <String>{};
    for (final arg in base.internal.arguments) {
      final symbol = typeCreator.create(arg).symbol!;
      if (arg.hasGeneric()) {
        covered.add(arg.generic.name);
      }
      params.add(
        Parameter(
          (p) => p
            ..name = arg.hasGeneric()
                ? 'toJson${arg.generic.name}'
                : 'toJsonArg${params.length}'
            ..type = refer('Object? Function($symbol)?'),
        ),
      );
    }
    for (final param in childParams.where((n) => !covered.contains(n))) {
      params.add(
        Parameter(
          (p) => p
            ..name = 'toJson$param'
            ..type = refer('Object? Function($param)?'),
        ),
      );
    }

    // _$XToJson wants factories in child type-param order; omitted ones default
    // to identity.
    final args = [
      'this',
      for (final param in childParams) 'toJson$param ?? ((v) => v)',
    ];

    return Method(
      (m) => m
        ..name = 'toJson'
        ..lambda = true
        ..returns = refer('Map<String, dynamic>')
        ..optionalParameters.addAll(params)
        ..body = Code('_\$${name}ToJson(${args.join(', ')})'),
    );
  }

  @override
  bool canHandle(Statement statement) => statement.hasDto();
}
