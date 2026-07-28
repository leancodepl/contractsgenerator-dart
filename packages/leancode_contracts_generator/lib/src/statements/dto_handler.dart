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
      if (_inheritedToJson(statement) case final toJson?) {
        b.methods
          ..removeWhere((m) => m.name == 'toJson')
          ..add(toJson);
      }
    });
  }

  /// A `toJson` override for a DTO extending a generic DTO, or `null` otherwise.
  Method? _inheritedToJson(Statement statement) {
    // the base we must override is a generated (included) generic DTO; skip others.
    final base = statement.dto.typeDescriptor.extends_1.firstWhereOrNull((e) {
      if (!e.hasInternal() || !db.shouldInclude(e.internal.name)) {
        return false;
      }
      return switch (db.find(e.internal.name)) {
        final s? =>
          s.hasDto() && s.dto.typeDescriptor.genericParameters.isNotEmpty,
        _ => false,
      };
    });
    if (base == null) {
      return null;
    }

    final name = renameType(db.resolveName(statement.name));
    final childParams = statement.dto.typeDescriptor.genericParameters.map(
      (g) => g.name,
    );

    // child type params the base already threads through — no extra factory needed for these.
    final baseVars = {
      for (final arg in base.internal.arguments)
        if (arg.hasGeneric()) arg.generic.name,
    };

    Parameter optionalFactory(String on, String named) => Parameter(
      (p) => p
        ..name = named
        ..type = refer('Object? Function($on)?'),
    );

    // One optional factory per base type argument (base order keeps the override
    // slot-compatible) then one per uncovered child type parameter. Generic args
    // are named after their variable so the `toJson<param>` forwards below resolve.
    final params = [
      for (final (i, arg) in base.internal.arguments.indexed)
        optionalFactory(
          typeCreator.create(arg).symbol!,
          arg.hasGeneric() ? 'toJson${arg.generic.name}' : 'toJsonArg$i',
        ),
      for (final param in childParams.where((p) => !baseVars.contains(p)))
        optionalFactory(param, 'toJson$param'),
    ];

    // _$XToJson takes the child factories in declaration order; omitted optionals
    // fall back to identity.
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
