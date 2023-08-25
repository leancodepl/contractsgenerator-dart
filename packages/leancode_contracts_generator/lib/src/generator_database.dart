import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:meta/meta.dart';
import 'package:protobuf/protobuf.dart';

import 'contracts_generator_config.dart';
import 'contracts_generator_exception.dart';
import 'statements/utils/type_descriptor_of.dart';
import 'types/type_handler.dart';
import 'types/utils/known_type_kind.dart';

class GeneratorDatabase {
  @visibleForTesting
  GeneratorDatabase(this.config, this._export)
      : _statements = LinkedHashMap.fromEntries(
          _export.statements
              .map((e) => MapEntry(e.name, e))
              .sortedBy((e) => e.key),
        );

  static Future<GeneratorDatabase> fromConfig(
    ContractsGeneratorConfig config,
  ) async {
    final buffer = await config.input.run();

    return GeneratorDatabase(
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
    return namespacedName.contains(config.include);
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
    } else if (!_names.any((e) => e.key == namespacedName)) {
      throw ContractsGeneratorException(
        'Tried to use a statement that is not included in the `include` config field: $namespacedName\n'
        'Consider adding ${RegExp.escape(namespacedName)} to `include` or moving this statement to an included namespace.',
      );
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
          if (name.key == other.key) {
            continue;
          }

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

  final _isKindCache = {
    KnownTypeKind.protocol: HashSet<String>(),
    KnownTypeKind.attribute: HashSet<String>(),
  };

  /// Deep check for whether this type is/extends a protocol type
  bool _isKind(TypeRef typeRef, KnownTypeKind kind) {
    assert(kind == KnownTypeKind.protocol || kind == KnownTypeKind.attribute);

    if (typeRef.hasKnown()) {
      return KnownTypeKind.fromKnownType(typeRef.known.type) == kind;
    } else if (typeRef.hasGeneric()) {
      return false;
    }

    final name = typeRef.ensureInternal().name;

    if (_isKindCache[kind]!.contains(name)) {
      return true;
    }

    final statement = find(name)!;

    if (typeDescriptorOf(statement)?.extends_1.any((e) => _isKind(e, kind)) ??
        false) {
      _isKindCache[kind]!.add(name);
    }

    return _isKindCache[kind]!.contains(name);
  }

  /// Deep check for whether this type is/extends a protocol type
  bool isProtocol(TypeRef typeRef) {
    return _isKind(typeRef, KnownTypeKind.protocol);
  }

  /// Deep check for whether this statement is/extends an Attribute type
  bool isAttribute(Statement statement) {
    return statement.hasDto() &&
        statement.dto.typeDescriptor.extends_1.any(
          (e) => _isKind(e, KnownTypeKind.attribute),
        );
  }

  final _allPropsCache = HashMap<String, List<PropertyRef>>();

  /// Follows the extension tree to retrieve all properties of the given statement.
  /// Performs monomorphization.
  List<PropertyRef> allPropertiesOf(Statement statement) {
    if (_allPropsCache.containsKey(statement.name)) {
      return _allPropsCache[statement.name]!;
    }

    final resolvedGenerics = typeDescriptorOf(statement)
            ?.genericParameters
            .fold<Map<String, TypeRef>>(
          {},
          (acc, curr) => {
            ...acc,
            // initially, generics should resolve to a generic
            curr.name: TypeRef(
              generic: TypeRef_Generic(name: curr.name),
              nullable: false,
            ),
          },
        ) ??
        {};

    return _allPropsCache[statement.name] =
        _allPropertiesOfAux(statement, resolvedGenerics);
  }

  TypeRef _resolveType(TypeRef type, Map<String, TypeRef> generics) {
    if (type.hasGeneric()) {
      final arg = generics[type.generic.name];
      if (arg == null) {
        return type;
      }

      return (arg..freeze()).rebuild((arg) {
        arg.nullable = type.nullable || arg.nullable;
      });
    } else if (type.hasInternal()) {
      return TypeRef(
        nullable: type.nullable,
        internal: TypeRef_Internal(
          name: type.internal.name,
          arguments: type.internal.arguments
              .map((type) => _resolveType(type, generics)),
        ),
      );
    } else if (type.hasKnown()) {
      return TypeRef(
        nullable: type.nullable,
        known: TypeRef_Known(
          type: type.known.type,
          arguments:
              type.known.arguments.map((type) => _resolveType(type, generics)),
        ),
      );
    } else {
      throw StateError('Unhandled TypeRef type');
    }
  }

  /// Given a statement and a map of resolving generics (for example {'T': List<int>})
  /// returns all properties of the statement with resolved generics
  List<PropertyRef> _allPropertiesOfAux(
    Statement statement,
    Map<String, TypeRef> resolvedGenerics,
  ) {
    final typeDescriptor = typeDescriptorOf(statement);

    if (typeDescriptor == null) {
      return [];
    }

    final properties = typeDescriptor.extends_1
        .where((typeRef) => typeRef.hasInternal())
        .expand((typeRef) {
          final internal = typeRef.ensureInternal();
          final statement = find(internal.name);
          if (statement == null) {
            return <PropertyRef>[];
          }

          final resolvedGenerics = typeDescriptorOf(statement)
                  ?.genericParameters
                  .foldIndexed<Map<String, TypeRef>>(
                {},
                (i, acc, curr) => {
                  ...acc,
                  // get the concrete type from child's generic argument list
                  curr.name: internal.arguments[i],
                },
              ) ??
              {};

          return _allPropertiesOfAux(statement, resolvedGenerics);
        })
        .followedBy(typeDescriptor.properties)
        // remove duplicate properties which come from implementing an interface
        .groupFoldBy(
          (property) => property.name,
          (_, property) => property,
        )
        .values
        // resolve generics to concrete types
        .map(
          (property) => PropertyRef(
            name: property.name,
            attributes: property.attributes,
            comment: property.comment,
            type: _resolveType(property.type, resolvedGenerics),
          ),
        )
        .toList();

    return properties;
  }
}
