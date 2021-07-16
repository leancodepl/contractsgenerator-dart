import 'dart:collection';

import 'contracts_generator_config.dart';
import 'types/type_handler.dart';
import 'types/utils/known_type_kind.dart';

class GeneratorDatabase {
  GeneratorDatabase._(this.config, this._export)
      : _statements = LinkedHashMap.fromEntries(
          _export.statements.map((e) => MapEntry(e.name, e)),
        );

  static Future<GeneratorDatabase> fromConfig(
    ContractsGeneratorConfig config,
  ) async {
    final buffer = await config.script.run();

    return GeneratorDatabase._(
      config,
      Export.fromBuffer(buffer),
    );
  }

  final ContractsGeneratorConfig config;
  // ignore: unused_field, might be useful later
  final Export _export;
  final LinkedHashMap<String, Statement> _statements;

  Iterable<Statement> get statements => _statements.values;

  static const namespaceSeparator = '.';

  /// Checks against the config whether a fully qualified item should be included
  bool shouldInclude(String namespacedName) {
    return namespacedName.contains(config.includeNamespaceRegex);
  }

  /// Finds a statement by the fully qualified name
  Statement? find(String namespacedName) => _statements[namespacedName];

  final _resolveCache = HashMap<String, String>();
  late final _names = statements
      .where((e) => shouldInclude(e.name))
      .map((e) => MapEntry(e.name, e.name.split(namespaceSeparator)));

  /// Returns the shortest name that has no name conflicts
  String resolveName(String namespacedName) {
    if (_resolveCache.containsKey(namespacedName)) {
      return _resolveCache[namespacedName]!;
    }

    final top = namespacedName.split(namespaceSeparator).last;
    final conflicting = _names.where((e) => e.value.last == top).toList();

    if (conflicting.length == 1) {
      return _resolveCache[conflicting.first.key] = top;
    }

    for (var i = 2; conflicting.isNotEmpty; i++) {
      final curr = conflicting
          .map(
            (e) => MapEntry(
              e.key,
              e.value.getRange(e.value.length - i, e.value.length).join(),
            ),
          )
          .toList();

      for (final name in curr) {
        var isSafe = true;
        for (final other in curr) {
          if (name.key == other.key) continue;

          if (name.value == other.value) {
            isSafe = false;
            break;
          }
        }

        if (isSafe) {
          _resolveCache[name.key] = name.value;
          conflicting.removeWhere((e) => e.key == name.key);
        }
      }
    }

    return _resolveCache[namespacedName]!;
  }

  final _isCqrsCache = HashSet<String>();

  /// Deep check for whether this type is/extends a CQRS type
  bool isCqrs(TypeRef typeRef) {
    if (typeRef.hasKnown() &&
        knownTypeKind(typeRef.known.type) == KnownTypeKind.cqrs) {
      return true;
    } else if (typeRef.hasGeneric()) {
      return false;
    }

    final name = typeRef.ensureInternal().name;

    if (_isCqrsCache.contains(name)) return true;

    final statement = find(name)!;

    if (statement.extends_3.any(isCqrs)) {
      _isCqrsCache.add(name);
    }

    return _isCqrsCache.contains(name);
  }
}
