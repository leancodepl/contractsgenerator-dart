///
//  Generated code. Do not modify.
//  source: contracts.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class KnownType extends $pb.ProtobufEnum {
  static const KnownType Object_ = KnownType._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Object');
  static const KnownType String = KnownType._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'String');
  static const KnownType Guid = KnownType._(
      3,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Guid');
  static const KnownType Uri = KnownType._(
      4,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Uri');
  static const KnownType Boolean = KnownType._(
      5,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Boolean');
  static const KnownType UInt8 = KnownType._(
      100,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'UInt8');
  static const KnownType Int8 = KnownType._(
      101,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Int8');
  static const KnownType Int16 = KnownType._(
      102,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Int16');
  static const KnownType UInt16 = KnownType._(
      103,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'UInt16');
  static const KnownType Int32 = KnownType._(
      104,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Int32');
  static const KnownType UInt32 = KnownType._(
      105,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'UInt32');
  static const KnownType Int64 = KnownType._(
      106,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Int64');
  static const KnownType UInt64 = KnownType._(
      107,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'UInt64');
  static const KnownType Float = KnownType._(
      150,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Float');
  static const KnownType Double = KnownType._(
      151,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Double');
  static const KnownType Decimal = KnownType._(
      152,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Decimal');
  static const KnownType Date = KnownType._(
      200,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Date');
  static const KnownType Time = KnownType._(
      201,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Time');
  static const KnownType DateTime = KnownType._(
      202,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'DateTime');
  static const KnownType DateTimeOffset = KnownType._(
      203,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'DateTimeOffset');
  static const KnownType Array = KnownType._(
      300,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Array');
  static const KnownType Map = KnownType._(
      301,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Map');
  static const KnownType Query = KnownType._(
      1000,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Query');
  static const KnownType Command = KnownType._(
      1001,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Command');
  static const KnownType AuthorizeWhenAttribute = KnownType._(
      1002,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'AuthorizeWhenAttribute');
  static const KnownType AuthorizeWhenHasAnyOfAttribute = KnownType._(
      1003,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'AuthorizeWhenHasAnyOfAttribute');
  static const KnownType QueryCacheAttribute = KnownType._(
      1004,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'QueryCacheAttribute');
  static const KnownType Attribute = KnownType._(
      1005,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'Attribute');

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
    Float,
    Double,
    Decimal,
    Date,
    Time,
    DateTime,
    DateTimeOffset,
    Array,
    Map,
    Query,
    Command,
    AuthorizeWhenAttribute,
    AuthorizeWhenHasAnyOfAttribute,
    QueryCacheAttribute,
    Attribute,
  ];

  static final $core.Map<$core.int, KnownType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static KnownType? valueOf($core.int value) => _byValue[value];

  const KnownType._($core.int v, $core.String n) : super(v, n);
}