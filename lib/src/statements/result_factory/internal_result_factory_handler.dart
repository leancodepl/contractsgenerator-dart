import 'package:recase/recase.dart';

import '../../generator_database.dart';
import 'result_factory_handler.dart';
import 'utils/if_nullable_prefix.dart';

class InternalResultFactoryHandler extends ResultFactoryHandler {
  const InternalResultFactoryHandler(this.db);

  final GeneratorDatabase db;

  @override
  String build(
    TypeRef typeRef,
    Iterable<ResultFactoryHandler> handlers,
    String paramName,
  ) {
    assert(canHandle(typeRef));

    final name = db.resolveName(typeRef.internal.name);

    // enums do not get a _$FromJson generated
    final statement = db.find(typeRef.internal.name);
    if (statement != null && statement.hasEnum_11()) {
      return [
        'const {',
        for (final member in statement.enum_11.members)
          '${member.value}: $name.${ReCase(member.name).camelCase},',
        '}[$paramName as int]',
        if (!typeRef.nullable) '!'
      ].join();
    }

    final fromJsonParams = [
      '$paramName as Map<String, dynamic>',
      for (final generic in typeRef.internal.arguments)
        '(e) => ${ResultFactoryHandler.buildFrom(generic, handlers, 'e')}'
    ].join(',');

    return '${ifNullablePrefix(typeRef, paramName)}_\$${name}FromJson($fromJsonParams)';
  }

  @override
  bool canHandle(TypeRef typeRef) => typeRef.hasInternal();
}
