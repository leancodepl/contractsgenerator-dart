//
//  Generated code. Do not modify.
//  source: contracts.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class KnownType extends $pb.ProtobufEnum {
  static const KnownType Object_ =
      KnownType._(0, _omitEnumNames ? '' : 'Object');
  static const KnownType String =
      KnownType._(1, _omitEnumNames ? '' : 'String');
  static const KnownType Guid = KnownType._(3, _omitEnumNames ? '' : 'Guid');
  static const KnownType Uri = KnownType._(4, _omitEnumNames ? '' : 'Uri');
  static const KnownType Boolean =
      KnownType._(5, _omitEnumNames ? '' : 'Boolean');
  static const KnownType UInt8 =
      KnownType._(100, _omitEnumNames ? '' : 'UInt8');
  static const KnownType Int8 = KnownType._(101, _omitEnumNames ? '' : 'Int8');
  static const KnownType Int16 =
      KnownType._(102, _omitEnumNames ? '' : 'Int16');
  static const KnownType UInt16 =
      KnownType._(103, _omitEnumNames ? '' : 'UInt16');
  static const KnownType Int32 =
      KnownType._(104, _omitEnumNames ? '' : 'Int32');
  static const KnownType UInt32 =
      KnownType._(105, _omitEnumNames ? '' : 'UInt32');
  static const KnownType Int64 =
      KnownType._(106, _omitEnumNames ? '' : 'Int64');
  static const KnownType UInt64 =
      KnownType._(107, _omitEnumNames ? '' : 'UInt64');
  static const KnownType Float32 =
      KnownType._(150, _omitEnumNames ? '' : 'Float32');
  static const KnownType Float64 =
      KnownType._(151, _omitEnumNames ? '' : 'Float64');
  static const KnownType DateOnly =
      KnownType._(200, _omitEnumNames ? '' : 'DateOnly');
  static const KnownType TimeOnly =
      KnownType._(201, _omitEnumNames ? '' : 'TimeOnly');
  static const KnownType DateTimeOffset =
      KnownType._(202, _omitEnumNames ? '' : 'DateTimeOffset');
  static const KnownType TimeSpan =
      KnownType._(203, _omitEnumNames ? '' : 'TimeSpan');
  static const KnownType DateTime =
      KnownType._(204, _omitEnumNames ? '' : 'DateTime');
  static const KnownType Array =
      KnownType._(300, _omitEnumNames ? '' : 'Array');
  static const KnownType Map = KnownType._(301, _omitEnumNames ? '' : 'Map');
  static const KnownType Query =
      KnownType._(1000, _omitEnumNames ? '' : 'Query');
  static const KnownType Command =
      KnownType._(1001, _omitEnumNames ? '' : 'Command');
  static const KnownType CommandResult =
      KnownType._(1002, _omitEnumNames ? '' : 'CommandResult');
  static const KnownType Operation =
      KnownType._(1003, _omitEnumNames ? '' : 'Operation');
  static const KnownType Binary =
      KnownType._(1004, _omitEnumNames ? '' : 'Binary');
  static const KnownType Topic =
      KnownType._(1005, _omitEnumNames ? '' : 'Topic');
  static const KnownType Attribute =
      KnownType._(1100, _omitEnumNames ? '' : 'Attribute');
  static const KnownType AuthorizeWhenAttribute =
      KnownType._(1101, _omitEnumNames ? '' : 'AuthorizeWhenAttribute');
  static const KnownType AuthorizeWhenHasAnyOfAttribute =
      KnownType._(1102, _omitEnumNames ? '' : 'AuthorizeWhenHasAnyOfAttribute');

  static const $core.List<KnownType> values = <KnownType>[
    Object_,
    String,
    Guid,
    Uri,
    Boolean,
    UInt8,
    Int8,
    Int16,
    UInt16,
    Int32,
    UInt32,
    Int64,
    UInt64,
    Float32,
    Float64,
    DateOnly,
    TimeOnly,
    DateTimeOffset,
    TimeSpan,
    DateTime,
    Array,
    Map,
    Query,
    Command,
    CommandResult,
    Operation,
    Binary,
    Topic,
    Attribute,
    AuthorizeWhenAttribute,
    AuthorizeWhenHasAnyOfAttribute,
  ];

  static final $core.Map<$core.int, KnownType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static KnownType? valueOf($core.int value) => _byValue[value];

  const KnownType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
