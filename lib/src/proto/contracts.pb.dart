///
//  Generated code. Do not modify.
//  source: contracts.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'contracts.pbenum.dart';

export 'contracts.pbenum.dart';

class ValueRef_Null extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ValueRef.Null',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'leancode.contracts'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  ValueRef_Null._() : super();
  factory ValueRef_Null() => create();
  factory ValueRef_Null.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ValueRef_Null.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ValueRef_Null clone() => ValueRef_Null()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ValueRef_Null copyWith(void Function(ValueRef_Null) updates) =>
      super.copyWith((message) => updates(message as ValueRef_Null))
          as ValueRef_Null; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ValueRef_Null create() => ValueRef_Null._();
  ValueRef_Null createEmptyInstance() => create();
  static $pb.PbList<ValueRef_Null> createRepeated() =>
      $pb.PbList<ValueRef_Null>();
  @$core.pragma('dart2js:noInline')
  static ValueRef_Null getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ValueRef_Null>(create);
  static ValueRef_Null? _defaultInstance;
}

class ValueRef_Number extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ValueRef.Number',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'leancode.contracts'),
      createEmptyInstance: create)
    ..aInt64(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'value')
    ..hasRequiredFields = false;

  ValueRef_Number._() : super();
  factory ValueRef_Number({
    $fixnum.Int64? value,
  }) {
    final _result = create();
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory ValueRef_Number.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ValueRef_Number.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ValueRef_Number clone() => ValueRef_Number()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ValueRef_Number copyWith(void Function(ValueRef_Number) updates) =>
      super.copyWith((message) => updates(message as ValueRef_Number))
          as ValueRef_Number; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ValueRef_Number create() => ValueRef_Number._();
  ValueRef_Number createEmptyInstance() => create();
  static $pb.PbList<ValueRef_Number> createRepeated() =>
      $pb.PbList<ValueRef_Number>();
  @$core.pragma('dart2js:noInline')
  static ValueRef_Number getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ValueRef_Number>(create);
  static ValueRef_Number? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get value => $_getI64(0);
  @$pb.TagNumber(1)
  set value($fixnum.Int64 v) {
    $_setInt64(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class ValueRef_FloatingPointNumber extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ValueRef.FloatingPointNumber',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'leancode.contracts'),
      createEmptyInstance: create)
    ..a<$core.double>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'value',
        $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

  ValueRef_FloatingPointNumber._() : super();
  factory ValueRef_FloatingPointNumber({
    $core.double? value,
  }) {
    final _result = create();
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory ValueRef_FloatingPointNumber.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ValueRef_FloatingPointNumber.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ValueRef_FloatingPointNumber clone() =>
      ValueRef_FloatingPointNumber()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ValueRef_FloatingPointNumber copyWith(
          void Function(ValueRef_FloatingPointNumber) updates) =>
      super.copyWith(
              (message) => updates(message as ValueRef_FloatingPointNumber))
          as ValueRef_FloatingPointNumber; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ValueRef_FloatingPointNumber create() =>
      ValueRef_FloatingPointNumber._();
  ValueRef_FloatingPointNumber createEmptyInstance() => create();
  static $pb.PbList<ValueRef_FloatingPointNumber> createRepeated() =>
      $pb.PbList<ValueRef_FloatingPointNumber>();
  @$core.pragma('dart2js:noInline')
  static ValueRef_FloatingPointNumber getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ValueRef_FloatingPointNumber>(create);
  static ValueRef_FloatingPointNumber? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get value => $_getN(0);
  @$pb.TagNumber(1)
  set value($core.double v) {
    $_setDouble(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class ValueRef_String extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ValueRef.String',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'leancode.contracts'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'value')
    ..hasRequiredFields = false;

  ValueRef_String._() : super();
  factory ValueRef_String({
    $core.String? value,
  }) {
    final _result = create();
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory ValueRef_String.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ValueRef_String.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ValueRef_String clone() => ValueRef_String()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ValueRef_String copyWith(void Function(ValueRef_String) updates) =>
      super.copyWith((message) => updates(message as ValueRef_String))
          as ValueRef_String; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ValueRef_String create() => ValueRef_String._();
  ValueRef_String createEmptyInstance() => create();
  static $pb.PbList<ValueRef_String> createRepeated() =>
      $pb.PbList<ValueRef_String>();
  @$core.pragma('dart2js:noInline')
  static ValueRef_String getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ValueRef_String>(create);
  static ValueRef_String? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get value => $_getSZ(0);
  @$pb.TagNumber(1)
  set value($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class ValueRef_Boolean extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ValueRef.Boolean',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'leancode.contracts'),
      createEmptyInstance: create)
    ..aOB(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'value')
    ..hasRequiredFields = false;

  ValueRef_Boolean._() : super();
  factory ValueRef_Boolean({
    $core.bool? value,
  }) {
    final _result = create();
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory ValueRef_Boolean.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ValueRef_Boolean.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ValueRef_Boolean clone() => ValueRef_Boolean()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ValueRef_Boolean copyWith(void Function(ValueRef_Boolean) updates) =>
      super.copyWith((message) => updates(message as ValueRef_Boolean))
          as ValueRef_Boolean; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ValueRef_Boolean create() => ValueRef_Boolean._();
  ValueRef_Boolean createEmptyInstance() => create();
  static $pb.PbList<ValueRef_Boolean> createRepeated() =>
      $pb.PbList<ValueRef_Boolean>();
  @$core.pragma('dart2js:noInline')
  static ValueRef_Boolean getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ValueRef_Boolean>(create);
  static ValueRef_Boolean? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get value => $_getBF(0);
  @$pb.TagNumber(1)
  set value($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

enum ValueRef_Value { null_1, number, floatingPoint, string, bool_5, notSet }

class ValueRef extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, ValueRef_Value> _ValueRef_ValueByTag = {
    1: ValueRef_Value.null_1,
    2: ValueRef_Value.number,
    3: ValueRef_Value.floatingPoint,
    4: ValueRef_Value.string,
    5: ValueRef_Value.bool_5,
    0: ValueRef_Value.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ValueRef',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'leancode.contracts'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5])
    ..aOM<ValueRef_Null>(
        1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'null',
        subBuilder: ValueRef_Null.create)
    ..aOM<ValueRef_Number>(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'number',
        subBuilder: ValueRef_Number.create)
    ..aOM<ValueRef_FloatingPointNumber>(
        3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'floatingPoint',
        protoName: 'floatingPoint',
        subBuilder: ValueRef_FloatingPointNumber.create)
    ..aOM<ValueRef_String>(
        4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'string',
        subBuilder: ValueRef_String.create)
    ..aOM<ValueRef_Boolean>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'bool', subBuilder: ValueRef_Boolean.create)
    ..hasRequiredFields = false;

  ValueRef._() : super();
  factory ValueRef({
    ValueRef_Null? null_1,
    ValueRef_Number? number,
    ValueRef_FloatingPointNumber? floatingPoint,
    ValueRef_String? string,
    ValueRef_Boolean? bool_5,
  }) {
    final _result = create();
    if (null_1 != null) {
      _result.null_1 = null_1;
    }
    if (number != null) {
      _result.number = number;
    }
    if (floatingPoint != null) {
      _result.floatingPoint = floatingPoint;
    }
    if (string != null) {
      _result.string = string;
    }
    if (bool_5 != null) {
      _result.bool_5 = bool_5;
    }
    return _result;
  }
  factory ValueRef.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ValueRef.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ValueRef clone() => ValueRef()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ValueRef copyWith(void Function(ValueRef) updates) =>
      super.copyWith((message) => updates(message as ValueRef))
          as ValueRef; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ValueRef create() => ValueRef._();
  ValueRef createEmptyInstance() => create();
  static $pb.PbList<ValueRef> createRepeated() => $pb.PbList<ValueRef>();
  @$core.pragma('dart2js:noInline')
  static ValueRef getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ValueRef>(create);
  static ValueRef? _defaultInstance;

  ValueRef_Value whichValue() => _ValueRef_ValueByTag[$_whichOneof(0)]!;
  void clearValue() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  ValueRef_Null get null_1 => $_getN(0);
  @$pb.TagNumber(1)
  set null_1(ValueRef_Null v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasNull_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearNull_1() => clearField(1);
  @$pb.TagNumber(1)
  ValueRef_Null ensureNull_1() => $_ensure(0);

  @$pb.TagNumber(2)
  ValueRef_Number get number => $_getN(1);
  @$pb.TagNumber(2)
  set number(ValueRef_Number v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearNumber() => clearField(2);
  @$pb.TagNumber(2)
  ValueRef_Number ensureNumber() => $_ensure(1);

  @$pb.TagNumber(3)
  ValueRef_FloatingPointNumber get floatingPoint => $_getN(2);
  @$pb.TagNumber(3)
  set floatingPoint(ValueRef_FloatingPointNumber v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasFloatingPoint() => $_has(2);
  @$pb.TagNumber(3)
  void clearFloatingPoint() => clearField(3);
  @$pb.TagNumber(3)
  ValueRef_FloatingPointNumber ensureFloatingPoint() => $_ensure(2);

  @$pb.TagNumber(4)
  ValueRef_String get string => $_getN(3);
  @$pb.TagNumber(4)
  set string(ValueRef_String v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasString() => $_has(3);
  @$pb.TagNumber(4)
  void clearString() => clearField(4);
  @$pb.TagNumber(4)
  ValueRef_String ensureString() => $_ensure(3);

  @$pb.TagNumber(5)
  ValueRef_Boolean get bool_5 => $_getN(4);
  @$pb.TagNumber(5)
  set bool_5(ValueRef_Boolean v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasBool_5() => $_has(4);
  @$pb.TagNumber(5)
  void clearBool_5() => clearField(5);
  @$pb.TagNumber(5)
  ValueRef_Boolean ensureBool_5() => $_ensure(4);
}

class TypeRef_Generic extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TypeRef.Generic',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'leancode.contracts'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..hasRequiredFields = false;

  TypeRef_Generic._() : super();
  factory TypeRef_Generic({
    $core.String? name,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory TypeRef_Generic.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TypeRef_Generic.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TypeRef_Generic clone() => TypeRef_Generic()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TypeRef_Generic copyWith(void Function(TypeRef_Generic) updates) =>
      super.copyWith((message) => updates(message as TypeRef_Generic))
          as TypeRef_Generic; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TypeRef_Generic create() => TypeRef_Generic._();
  TypeRef_Generic createEmptyInstance() => create();
  static $pb.PbList<TypeRef_Generic> createRepeated() =>
      $pb.PbList<TypeRef_Generic>();
  @$core.pragma('dart2js:noInline')
  static TypeRef_Generic getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TypeRef_Generic>(create);
  static TypeRef_Generic? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);
}

class TypeRef_Internal extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TypeRef.Internal',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'leancode.contracts'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..pc<TypeRef>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'arguments',
        $pb.PbFieldType.PM,
        subBuilder: TypeRef.create)
    ..hasRequiredFields = false;

  TypeRef_Internal._() : super();
  factory TypeRef_Internal({
    $core.String? name,
    $core.Iterable<TypeRef>? arguments,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (arguments != null) {
      _result.arguments.addAll(arguments);
    }
    return _result;
  }
  factory TypeRef_Internal.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TypeRef_Internal.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TypeRef_Internal clone() => TypeRef_Internal()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TypeRef_Internal copyWith(void Function(TypeRef_Internal) updates) =>
      super.copyWith((message) => updates(message as TypeRef_Internal))
          as TypeRef_Internal; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TypeRef_Internal create() => TypeRef_Internal._();
  TypeRef_Internal createEmptyInstance() => create();
  static $pb.PbList<TypeRef_Internal> createRepeated() =>
      $pb.PbList<TypeRef_Internal>();
  @$core.pragma('dart2js:noInline')
  static TypeRef_Internal getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TypeRef_Internal>(create);
  static TypeRef_Internal? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<TypeRef> get arguments => $_getList(1);
}

class TypeRef_Known extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TypeRef.Known',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'leancode.contracts'),
      createEmptyInstance: create)
    ..e<KnownType>(
        1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE,
        defaultOrMaker: KnownType.Object_,
        valueOf: KnownType.valueOf,
        enumValues: KnownType.values)
    ..pc<TypeRef>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'arguments',
        $pb.PbFieldType.PM,
        subBuilder: TypeRef.create)
    ..hasRequiredFields = false;

  TypeRef_Known._() : super();
  factory TypeRef_Known({
    KnownType? type,
    $core.Iterable<TypeRef>? arguments,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (arguments != null) {
      _result.arguments.addAll(arguments);
    }
    return _result;
  }
  factory TypeRef_Known.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TypeRef_Known.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TypeRef_Known clone() => TypeRef_Known()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TypeRef_Known copyWith(void Function(TypeRef_Known) updates) =>
      super.copyWith((message) => updates(message as TypeRef_Known))
          as TypeRef_Known; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TypeRef_Known create() => TypeRef_Known._();
  TypeRef_Known createEmptyInstance() => create();
  static $pb.PbList<TypeRef_Known> createRepeated() =>
      $pb.PbList<TypeRef_Known>();
  @$core.pragma('dart2js:noInline')
  static TypeRef_Known getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TypeRef_Known>(create);
  static TypeRef_Known? _defaultInstance;

  @$pb.TagNumber(1)
  KnownType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(KnownType v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<TypeRef> get arguments => $_getList(1);
}

enum TypeRef_Type { generic, internal, known, notSet }

class TypeRef extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, TypeRef_Type> _TypeRef_TypeByTag = {
    2: TypeRef_Type.generic,
    3: TypeRef_Type.internal,
    4: TypeRef_Type.known,
    0: TypeRef_Type.notSet
  };
  static final $pb.BuilderInfo _i =
      $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TypeRef',
          package: const $pb.PackageName(
              const $core.bool.fromEnvironment('protobuf.omit_message_names')
                  ? ''
                  : 'leancode.contracts'),
          createEmptyInstance: create)
        ..oo(0, [2, 3, 4])
        ..aOB(
            1,
            const $core.bool.fromEnvironment('protobuf.omit_field_names')
                ? ''
                : 'nullable')
        ..aOM<TypeRef_Generic>(
            2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'generic',
            subBuilder: TypeRef_Generic.create)
        ..aOM<TypeRef_Internal>(
            3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'internal',
            subBuilder: TypeRef_Internal.create)
        ..aOM<TypeRef_Known>(
            4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'known',
            subBuilder: TypeRef_Known.create)
        ..hasRequiredFields = false;

  TypeRef._() : super();
  factory TypeRef({
    $core.bool? nullable,
    TypeRef_Generic? generic,
    TypeRef_Internal? internal,
    TypeRef_Known? known,
  }) {
    final _result = create();
    if (nullable != null) {
      _result.nullable = nullable;
    }
    if (generic != null) {
      _result.generic = generic;
    }
    if (internal != null) {
      _result.internal = internal;
    }
    if (known != null) {
      _result.known = known;
    }
    return _result;
  }
  factory TypeRef.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TypeRef.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TypeRef clone() => TypeRef()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TypeRef copyWith(void Function(TypeRef) updates) =>
      super.copyWith((message) => updates(message as TypeRef))
          as TypeRef; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TypeRef create() => TypeRef._();
  TypeRef createEmptyInstance() => create();
  static $pb.PbList<TypeRef> createRepeated() => $pb.PbList<TypeRef>();
  @$core.pragma('dart2js:noInline')
  static TypeRef getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TypeRef>(create);
  static TypeRef? _defaultInstance;

  TypeRef_Type whichType() => _TypeRef_TypeByTag[$_whichOneof(0)]!;
  void clearType() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.bool get nullable => $_getBF(0);
  @$pb.TagNumber(1)
  set nullable($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasNullable() => $_has(0);
  @$pb.TagNumber(1)
  void clearNullable() => clearField(1);

  @$pb.TagNumber(2)
  TypeRef_Generic get generic => $_getN(1);
  @$pb.TagNumber(2)
  set generic(TypeRef_Generic v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGeneric() => $_has(1);
  @$pb.TagNumber(2)
  void clearGeneric() => clearField(2);
  @$pb.TagNumber(2)
  TypeRef_Generic ensureGeneric() => $_ensure(1);

  @$pb.TagNumber(3)
  TypeRef_Internal get internal => $_getN(2);
  @$pb.TagNumber(3)
  set internal(TypeRef_Internal v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasInternal() => $_has(2);
  @$pb.TagNumber(3)
  void clearInternal() => clearField(3);
  @$pb.TagNumber(3)
  TypeRef_Internal ensureInternal() => $_ensure(2);

  @$pb.TagNumber(4)
  TypeRef_Known get known => $_getN(3);
  @$pb.TagNumber(4)
  set known(TypeRef_Known v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasKnown() => $_has(3);
  @$pb.TagNumber(4)
  void clearKnown() => clearField(4);
  @$pb.TagNumber(4)
  TypeRef_Known ensureKnown() => $_ensure(3);
}

class GenericParameter extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GenericParameter',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'leancode.contracts'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..hasRequiredFields = false;

  GenericParameter._() : super();
  factory GenericParameter({
    $core.String? name,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory GenericParameter.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GenericParameter.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GenericParameter clone() => GenericParameter()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GenericParameter copyWith(void Function(GenericParameter) updates) =>
      super.copyWith((message) => updates(message as GenericParameter))
          as GenericParameter; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GenericParameter create() => GenericParameter._();
  GenericParameter createEmptyInstance() => create();
  static $pb.PbList<GenericParameter> createRepeated() =>
      $pb.PbList<GenericParameter>();
  @$core.pragma('dart2js:noInline')
  static GenericParameter getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GenericParameter>(create);
  static GenericParameter? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);
}

class AttributeArgument_Positional extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AttributeArgument.Positional',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'leancode.contracts'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'position',
        $pb.PbFieldType.O3)
    ..aOM<ValueRef>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'value',
        subBuilder: ValueRef.create)
    ..hasRequiredFields = false;

  AttributeArgument_Positional._() : super();
  factory AttributeArgument_Positional({
    $core.int? position,
    ValueRef? value,
  }) {
    final _result = create();
    if (position != null) {
      _result.position = position;
    }
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory AttributeArgument_Positional.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AttributeArgument_Positional.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AttributeArgument_Positional clone() =>
      AttributeArgument_Positional()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AttributeArgument_Positional copyWith(
          void Function(AttributeArgument_Positional) updates) =>
      super.copyWith(
              (message) => updates(message as AttributeArgument_Positional))
          as AttributeArgument_Positional; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AttributeArgument_Positional create() =>
      AttributeArgument_Positional._();
  AttributeArgument_Positional createEmptyInstance() => create();
  static $pb.PbList<AttributeArgument_Positional> createRepeated() =>
      $pb.PbList<AttributeArgument_Positional>();
  @$core.pragma('dart2js:noInline')
  static AttributeArgument_Positional getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AttributeArgument_Positional>(create);
  static AttributeArgument_Positional? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get position => $_getIZ(0);
  @$pb.TagNumber(1)
  set position($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPosition() => $_has(0);
  @$pb.TagNumber(1)
  void clearPosition() => clearField(1);

  @$pb.TagNumber(2)
  ValueRef get value => $_getN(1);
  @$pb.TagNumber(2)
  set value(ValueRef v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
  @$pb.TagNumber(2)
  ValueRef ensureValue() => $_ensure(1);
}

class AttributeArgument_Named extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AttributeArgument.Named',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'leancode.contracts'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOM<ValueRef>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'value',
        subBuilder: ValueRef.create)
    ..hasRequiredFields = false;

  AttributeArgument_Named._() : super();
  factory AttributeArgument_Named({
    $core.String? name,
    ValueRef? value,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (value != null) {
      _result.value = value;
    }
    return _result;
  }
  factory AttributeArgument_Named.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AttributeArgument_Named.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AttributeArgument_Named clone() =>
      AttributeArgument_Named()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AttributeArgument_Named copyWith(
          void Function(AttributeArgument_Named) updates) =>
      super.copyWith((message) => updates(message as AttributeArgument_Named))
          as AttributeArgument_Named; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AttributeArgument_Named create() => AttributeArgument_Named._();
  AttributeArgument_Named createEmptyInstance() => create();
  static $pb.PbList<AttributeArgument_Named> createRepeated() =>
      $pb.PbList<AttributeArgument_Named>();
  @$core.pragma('dart2js:noInline')
  static AttributeArgument_Named getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AttributeArgument_Named>(create);
  static AttributeArgument_Named? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  ValueRef get value => $_getN(1);
  @$pb.TagNumber(2)
  set value(ValueRef v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
  @$pb.TagNumber(2)
  ValueRef ensureValue() => $_ensure(1);
}

enum AttributeArgument_Attribute { positional, named, notSet }

class AttributeArgument extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, AttributeArgument_Attribute>
      _AttributeArgument_AttributeByTag = {
    1: AttributeArgument_Attribute.positional,
    2: AttributeArgument_Attribute.named,
    0: AttributeArgument_Attribute.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AttributeArgument',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'leancode.contracts'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<AttributeArgument_Positional>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'positional',
        subBuilder: AttributeArgument_Positional.create)
    ..aOM<AttributeArgument_Named>(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'named',
        subBuilder: AttributeArgument_Named.create)
    ..hasRequiredFields = false;

  AttributeArgument._() : super();
  factory AttributeArgument({
    AttributeArgument_Positional? positional,
    AttributeArgument_Named? named,
  }) {
    final _result = create();
    if (positional != null) {
      _result.positional = positional;
    }
    if (named != null) {
      _result.named = named;
    }
    return _result;
  }
  factory AttributeArgument.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AttributeArgument.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AttributeArgument clone() => AttributeArgument()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AttributeArgument copyWith(void Function(AttributeArgument) updates) =>
      super.copyWith((message) => updates(message as AttributeArgument))
          as AttributeArgument; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AttributeArgument create() => AttributeArgument._();
  AttributeArgument createEmptyInstance() => create();
  static $pb.PbList<AttributeArgument> createRepeated() =>
      $pb.PbList<AttributeArgument>();
  @$core.pragma('dart2js:noInline')
  static AttributeArgument getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AttributeArgument>(create);
  static AttributeArgument? _defaultInstance;

  AttributeArgument_Attribute whichAttribute() =>
      _AttributeArgument_AttributeByTag[$_whichOneof(0)]!;
  void clearAttribute() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  AttributeArgument_Positional get positional => $_getN(0);
  @$pb.TagNumber(1)
  set positional(AttributeArgument_Positional v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPositional() => $_has(0);
  @$pb.TagNumber(1)
  void clearPositional() => clearField(1);
  @$pb.TagNumber(1)
  AttributeArgument_Positional ensurePositional() => $_ensure(0);

  @$pb.TagNumber(2)
  AttributeArgument_Named get named => $_getN(1);
  @$pb.TagNumber(2)
  set named(AttributeArgument_Named v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasNamed() => $_has(1);
  @$pb.TagNumber(2)
  void clearNamed() => clearField(2);
  @$pb.TagNumber(2)
  AttributeArgument_Named ensureNamed() => $_ensure(1);
}

class AttributeRef extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AttributeRef',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'leancode.contracts'),
      createEmptyInstance: create)
    ..aOS(
        1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'attributeName',
        protoName: 'attributeName')
    ..pc<AttributeArgument>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'argument',
        $pb.PbFieldType.PM,
        subBuilder: AttributeArgument.create)
    ..hasRequiredFields = false;

  AttributeRef._() : super();
  factory AttributeRef({
    $core.String? attributeName,
    $core.Iterable<AttributeArgument>? argument,
  }) {
    final _result = create();
    if (attributeName != null) {
      _result.attributeName = attributeName;
    }
    if (argument != null) {
      _result.argument.addAll(argument);
    }
    return _result;
  }
  factory AttributeRef.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AttributeRef.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AttributeRef clone() => AttributeRef()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AttributeRef copyWith(void Function(AttributeRef) updates) =>
      super.copyWith((message) => updates(message as AttributeRef))
          as AttributeRef; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AttributeRef create() => AttributeRef._();
  AttributeRef createEmptyInstance() => create();
  static $pb.PbList<AttributeRef> createRepeated() =>
      $pb.PbList<AttributeRef>();
  @$core.pragma('dart2js:noInline')
  static AttributeRef getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AttributeRef>(create);
  static AttributeRef? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get attributeName => $_getSZ(0);
  @$pb.TagNumber(1)
  set attributeName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAttributeName() => $_has(0);
  @$pb.TagNumber(1)
  void clearAttributeName() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<AttributeArgument> get argument => $_getList(1);
}

class PropertyRef extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PropertyRef',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'leancode.contracts'),
      createEmptyInstance: create)
    ..aOM<TypeRef>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type',
        subBuilder: TypeRef.create)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..pc<AttributeRef>(
        3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'attributes', $pb.PbFieldType.PM,
        subBuilder: AttributeRef.create)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'comment')
    ..hasRequiredFields = false;

  PropertyRef._() : super();
  factory PropertyRef({
    TypeRef? type,
    $core.String? name,
    $core.Iterable<AttributeRef>? attributes,
    $core.String? comment,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (name != null) {
      _result.name = name;
    }
    if (attributes != null) {
      _result.attributes.addAll(attributes);
    }
    if (comment != null) {
      _result.comment = comment;
    }
    return _result;
  }
  factory PropertyRef.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PropertyRef.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PropertyRef clone() => PropertyRef()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PropertyRef copyWith(void Function(PropertyRef) updates) =>
      super.copyWith((message) => updates(message as PropertyRef))
          as PropertyRef; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PropertyRef create() => PropertyRef._();
  PropertyRef createEmptyInstance() => create();
  static $pb.PbList<PropertyRef> createRepeated() => $pb.PbList<PropertyRef>();
  @$core.pragma('dart2js:noInline')
  static PropertyRef getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PropertyRef>(create);
  static PropertyRef? _defaultInstance;

  @$pb.TagNumber(1)
  TypeRef get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(TypeRef v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);
  @$pb.TagNumber(1)
  TypeRef ensureType() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<AttributeRef> get attributes => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get comment => $_getSZ(3);
  @$pb.TagNumber(4)
  set comment($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasComment() => $_has(3);
  @$pb.TagNumber(4)
  void clearComment() => clearField(4);
}

class ConstantRef extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ConstantRef',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'leancode.contracts'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOM<ValueRef>(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'value',
        subBuilder: ValueRef.create)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'comment')
    ..hasRequiredFields = false;

  ConstantRef._() : super();
  factory ConstantRef({
    $core.String? name,
    ValueRef? value,
    $core.String? comment,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (value != null) {
      _result.value = value;
    }
    if (comment != null) {
      _result.comment = comment;
    }
    return _result;
  }
  factory ConstantRef.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConstantRef.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ConstantRef clone() => ConstantRef()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ConstantRef copyWith(void Function(ConstantRef) updates) =>
      super.copyWith((message) => updates(message as ConstantRef))
          as ConstantRef; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConstantRef create() => ConstantRef._();
  ConstantRef createEmptyInstance() => create();
  static $pb.PbList<ConstantRef> createRepeated() => $pb.PbList<ConstantRef>();
  @$core.pragma('dart2js:noInline')
  static ConstantRef getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConstantRef>(create);
  static ConstantRef? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  ValueRef get value => $_getN(1);
  @$pb.TagNumber(2)
  set value(ValueRef v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
  @$pb.TagNumber(2)
  ValueRef ensureValue() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get comment => $_getSZ(2);
  @$pb.TagNumber(3)
  set comment($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasComment() => $_has(2);
  @$pb.TagNumber(3)
  void clearComment() => clearField(3);
}

class EnumValue extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'EnumValue',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'leancode.contracts'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aInt64(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'value')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'comment')
    ..hasRequiredFields = false;

  EnumValue._() : super();
  factory EnumValue({
    $core.String? name,
    $fixnum.Int64? value,
    $core.String? comment,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (value != null) {
      _result.value = value;
    }
    if (comment != null) {
      _result.comment = comment;
    }
    return _result;
  }
  factory EnumValue.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EnumValue.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EnumValue clone() => EnumValue()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EnumValue copyWith(void Function(EnumValue) updates) =>
      super.copyWith((message) => updates(message as EnumValue))
          as EnumValue; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EnumValue create() => EnumValue._();
  EnumValue createEmptyInstance() => create();
  static $pb.PbList<EnumValue> createRepeated() => $pb.PbList<EnumValue>();
  @$core.pragma('dart2js:noInline')
  static EnumValue getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EnumValue>(create);
  static EnumValue? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get value => $_getI64(1);
  @$pb.TagNumber(2)
  set value($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get comment => $_getSZ(2);
  @$pb.TagNumber(3)
  set comment($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasComment() => $_has(2);
  @$pb.TagNumber(3)
  void clearComment() => clearField(3);
}

class ErrorCode_Single extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ErrorCode.Single',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'leancode.contracts'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'code',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  ErrorCode_Single._() : super();
  factory ErrorCode_Single({
    $core.String? name,
    $core.int? code,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (code != null) {
      _result.code = code;
    }
    return _result;
  }
  factory ErrorCode_Single.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ErrorCode_Single.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ErrorCode_Single clone() => ErrorCode_Single()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ErrorCode_Single copyWith(void Function(ErrorCode_Single) updates) =>
      super.copyWith((message) => updates(message as ErrorCode_Single))
          as ErrorCode_Single; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ErrorCode_Single create() => ErrorCode_Single._();
  ErrorCode_Single createEmptyInstance() => create();
  static $pb.PbList<ErrorCode_Single> createRepeated() =>
      $pb.PbList<ErrorCode_Single>();
  @$core.pragma('dart2js:noInline')
  static ErrorCode_Single getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ErrorCode_Single>(create);
  static ErrorCode_Single? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get code => $_getIZ(1);
  @$pb.TagNumber(2)
  set code($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);
}

class ErrorCode_Group extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ErrorCode.Group',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'leancode.contracts'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'groupId',
        protoName: 'groupId')
    ..pc<ErrorCode>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'innerCodes',
        $pb.PbFieldType.PM,
        protoName: 'innerCodes',
        subBuilder: ErrorCode.create)
    ..hasRequiredFields = false;

  ErrorCode_Group._() : super();
  factory ErrorCode_Group({
    $core.String? name,
    $core.String? groupId,
    $core.Iterable<ErrorCode>? innerCodes,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (groupId != null) {
      _result.groupId = groupId;
    }
    if (innerCodes != null) {
      _result.innerCodes.addAll(innerCodes);
    }
    return _result;
  }
  factory ErrorCode_Group.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ErrorCode_Group.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ErrorCode_Group clone() => ErrorCode_Group()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ErrorCode_Group copyWith(void Function(ErrorCode_Group) updates) =>
      super.copyWith((message) => updates(message as ErrorCode_Group))
          as ErrorCode_Group; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ErrorCode_Group create() => ErrorCode_Group._();
  ErrorCode_Group createEmptyInstance() => create();
  static $pb.PbList<ErrorCode_Group> createRepeated() =>
      $pb.PbList<ErrorCode_Group>();
  @$core.pragma('dart2js:noInline')
  static ErrorCode_Group getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ErrorCode_Group>(create);
  static ErrorCode_Group? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get groupId => $_getSZ(1);
  @$pb.TagNumber(2)
  set groupId($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGroupId() => $_has(1);
  @$pb.TagNumber(2)
  void clearGroupId() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<ErrorCode> get innerCodes => $_getList(2);
}

enum ErrorCode_Code { single, group, notSet }

class ErrorCode extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, ErrorCode_Code> _ErrorCode_CodeByTag = {
    1: ErrorCode_Code.single,
    2: ErrorCode_Code.group,
    0: ErrorCode_Code.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ErrorCode',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'leancode.contracts'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<ErrorCode_Single>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'single',
        subBuilder: ErrorCode_Single.create)
    ..aOM<ErrorCode_Group>(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'group',
        subBuilder: ErrorCode_Group.create)
    ..hasRequiredFields = false;

  ErrorCode._() : super();
  factory ErrorCode({
    ErrorCode_Single? single,
    ErrorCode_Group? group,
  }) {
    final _result = create();
    if (single != null) {
      _result.single = single;
    }
    if (group != null) {
      _result.group = group;
    }
    return _result;
  }
  factory ErrorCode.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ErrorCode.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ErrorCode clone() => ErrorCode()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ErrorCode copyWith(void Function(ErrorCode) updates) =>
      super.copyWith((message) => updates(message as ErrorCode))
          as ErrorCode; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ErrorCode create() => ErrorCode._();
  ErrorCode createEmptyInstance() => create();
  static $pb.PbList<ErrorCode> createRepeated() => $pb.PbList<ErrorCode>();
  @$core.pragma('dart2js:noInline')
  static ErrorCode getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ErrorCode>(create);
  static ErrorCode? _defaultInstance;

  ErrorCode_Code whichCode() => _ErrorCode_CodeByTag[$_whichOneof(0)]!;
  void clearCode() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  ErrorCode_Single get single => $_getN(0);
  @$pb.TagNumber(1)
  set single(ErrorCode_Single v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSingle() => $_has(0);
  @$pb.TagNumber(1)
  void clearSingle() => clearField(1);
  @$pb.TagNumber(1)
  ErrorCode_Single ensureSingle() => $_ensure(0);

  @$pb.TagNumber(2)
  ErrorCode_Group get group => $_getN(1);
  @$pb.TagNumber(2)
  set group(ErrorCode_Group v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasGroup() => $_has(1);
  @$pb.TagNumber(2)
  void clearGroup() => clearField(2);
  @$pb.TagNumber(2)
  ErrorCode_Group ensureGroup() => $_ensure(1);
}

class TypeDescriptor extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'TypeDescriptor',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'leancode.contracts'),
      createEmptyInstance: create)
    ..pc<TypeRef>(
        1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'extends', $pb.PbFieldType.PM,
        subBuilder: TypeRef.create)
    ..pc<GenericParameter>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'genericParameters',
        $pb.PbFieldType.PM,
        protoName: 'genericParameters',
        subBuilder: GenericParameter.create)
    ..pc<PropertyRef>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'properties', $pb.PbFieldType.PM, subBuilder: PropertyRef.create)
    ..pc<ConstantRef>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'constants', $pb.PbFieldType.PM, subBuilder: ConstantRef.create)
    ..hasRequiredFields = false;

  TypeDescriptor._() : super();
  factory TypeDescriptor({
    $core.Iterable<TypeRef>? extends_1,
    $core.Iterable<GenericParameter>? genericParameters,
    $core.Iterable<PropertyRef>? properties,
    $core.Iterable<ConstantRef>? constants,
  }) {
    final _result = create();
    if (extends_1 != null) {
      _result.extends_1.addAll(extends_1);
    }
    if (genericParameters != null) {
      _result.genericParameters.addAll(genericParameters);
    }
    if (properties != null) {
      _result.properties.addAll(properties);
    }
    if (constants != null) {
      _result.constants.addAll(constants);
    }
    return _result;
  }
  factory TypeDescriptor.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TypeDescriptor.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TypeDescriptor clone() => TypeDescriptor()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TypeDescriptor copyWith(void Function(TypeDescriptor) updates) =>
      super.copyWith((message) => updates(message as TypeDescriptor))
          as TypeDescriptor; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TypeDescriptor create() => TypeDescriptor._();
  TypeDescriptor createEmptyInstance() => create();
  static $pb.PbList<TypeDescriptor> createRepeated() =>
      $pb.PbList<TypeDescriptor>();
  @$core.pragma('dart2js:noInline')
  static TypeDescriptor getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TypeDescriptor>(create);
  static TypeDescriptor? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<TypeRef> get extends_1 => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<GenericParameter> get genericParameters => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<PropertyRef> get properties => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<ConstantRef> get constants => $_getList(3);
}

class Statement_DTO extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Statement.DTO',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'leancode.contracts'),
      createEmptyInstance: create)
    ..aOM<TypeDescriptor>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'typeDescriptor',
        protoName: 'typeDescriptor',
        subBuilder: TypeDescriptor.create)
    ..hasRequiredFields = false;

  Statement_DTO._() : super();
  factory Statement_DTO({
    TypeDescriptor? typeDescriptor,
  }) {
    final _result = create();
    if (typeDescriptor != null) {
      _result.typeDescriptor = typeDescriptor;
    }
    return _result;
  }
  factory Statement_DTO.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Statement_DTO.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Statement_DTO clone() => Statement_DTO()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Statement_DTO copyWith(void Function(Statement_DTO) updates) =>
      super.copyWith((message) => updates(message as Statement_DTO))
          as Statement_DTO; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Statement_DTO create() => Statement_DTO._();
  Statement_DTO createEmptyInstance() => create();
  static $pb.PbList<Statement_DTO> createRepeated() =>
      $pb.PbList<Statement_DTO>();
  @$core.pragma('dart2js:noInline')
  static Statement_DTO getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Statement_DTO>(create);
  static Statement_DTO? _defaultInstance;

  @$pb.TagNumber(1)
  TypeDescriptor get typeDescriptor => $_getN(0);
  @$pb.TagNumber(1)
  set typeDescriptor(TypeDescriptor v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTypeDescriptor() => $_has(0);
  @$pb.TagNumber(1)
  void clearTypeDescriptor() => clearField(1);
  @$pb.TagNumber(1)
  TypeDescriptor ensureTypeDescriptor() => $_ensure(0);
}

class Statement_Enum extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Statement.Enum',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'leancode.contracts'),
      createEmptyInstance: create)
    ..pc<EnumValue>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'members',
        $pb.PbFieldType.PM,
        subBuilder: EnumValue.create)
    ..hasRequiredFields = false;

  Statement_Enum._() : super();
  factory Statement_Enum({
    $core.Iterable<EnumValue>? members,
  }) {
    final _result = create();
    if (members != null) {
      _result.members.addAll(members);
    }
    return _result;
  }
  factory Statement_Enum.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Statement_Enum.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Statement_Enum clone() => Statement_Enum()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Statement_Enum copyWith(void Function(Statement_Enum) updates) =>
      super.copyWith((message) => updates(message as Statement_Enum))
          as Statement_Enum; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Statement_Enum create() => Statement_Enum._();
  Statement_Enum createEmptyInstance() => create();
  static $pb.PbList<Statement_Enum> createRepeated() =>
      $pb.PbList<Statement_Enum>();
  @$core.pragma('dart2js:noInline')
  static Statement_Enum getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Statement_Enum>(create);
  static Statement_Enum? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<EnumValue> get members => $_getList(0);
}

class Statement_Query extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Statement.Query',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'leancode.contracts'),
      createEmptyInstance: create)
    ..aOM<TypeDescriptor>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'typeDescriptor',
        protoName: 'typeDescriptor',
        subBuilder: TypeDescriptor.create)
    ..aOM<TypeRef>(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'returnType',
        protoName: 'returnType', subBuilder: TypeRef.create)
    ..hasRequiredFields = false;

  Statement_Query._() : super();
  factory Statement_Query({
    TypeDescriptor? typeDescriptor,
    TypeRef? returnType,
  }) {
    final _result = create();
    if (typeDescriptor != null) {
      _result.typeDescriptor = typeDescriptor;
    }
    if (returnType != null) {
      _result.returnType = returnType;
    }
    return _result;
  }
  factory Statement_Query.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Statement_Query.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Statement_Query clone() => Statement_Query()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Statement_Query copyWith(void Function(Statement_Query) updates) =>
      super.copyWith((message) => updates(message as Statement_Query))
          as Statement_Query; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Statement_Query create() => Statement_Query._();
  Statement_Query createEmptyInstance() => create();
  static $pb.PbList<Statement_Query> createRepeated() =>
      $pb.PbList<Statement_Query>();
  @$core.pragma('dart2js:noInline')
  static Statement_Query getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Statement_Query>(create);
  static Statement_Query? _defaultInstance;

  @$pb.TagNumber(1)
  TypeDescriptor get typeDescriptor => $_getN(0);
  @$pb.TagNumber(1)
  set typeDescriptor(TypeDescriptor v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTypeDescriptor() => $_has(0);
  @$pb.TagNumber(1)
  void clearTypeDescriptor() => clearField(1);
  @$pb.TagNumber(1)
  TypeDescriptor ensureTypeDescriptor() => $_ensure(0);

  @$pb.TagNumber(2)
  TypeRef get returnType => $_getN(1);
  @$pb.TagNumber(2)
  set returnType(TypeRef v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasReturnType() => $_has(1);
  @$pb.TagNumber(2)
  void clearReturnType() => clearField(2);
  @$pb.TagNumber(2)
  TypeRef ensureReturnType() => $_ensure(1);
}

class Statement_Command extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Statement.Command',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'leancode.contracts'),
      createEmptyInstance: create)
    ..aOM<TypeDescriptor>(
        1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'typeDescriptor',
        protoName: 'typeDescriptor', subBuilder: TypeDescriptor.create)
    ..pc<ErrorCode>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'errorCodes',
        $pb.PbFieldType.PM,
        protoName: 'errorCodes',
        subBuilder: ErrorCode.create)
    ..hasRequiredFields = false;

  Statement_Command._() : super();
  factory Statement_Command({
    TypeDescriptor? typeDescriptor,
    $core.Iterable<ErrorCode>? errorCodes,
  }) {
    final _result = create();
    if (typeDescriptor != null) {
      _result.typeDescriptor = typeDescriptor;
    }
    if (errorCodes != null) {
      _result.errorCodes.addAll(errorCodes);
    }
    return _result;
  }
  factory Statement_Command.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Statement_Command.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Statement_Command clone() => Statement_Command()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Statement_Command copyWith(void Function(Statement_Command) updates) =>
      super.copyWith((message) => updates(message as Statement_Command))
          as Statement_Command; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Statement_Command create() => Statement_Command._();
  Statement_Command createEmptyInstance() => create();
  static $pb.PbList<Statement_Command> createRepeated() =>
      $pb.PbList<Statement_Command>();
  @$core.pragma('dart2js:noInline')
  static Statement_Command getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Statement_Command>(create);
  static Statement_Command? _defaultInstance;

  @$pb.TagNumber(1)
  TypeDescriptor get typeDescriptor => $_getN(0);
  @$pb.TagNumber(1)
  set typeDescriptor(TypeDescriptor v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTypeDescriptor() => $_has(0);
  @$pb.TagNumber(1)
  void clearTypeDescriptor() => clearField(1);
  @$pb.TagNumber(1)
  TypeDescriptor ensureTypeDescriptor() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<ErrorCode> get errorCodes => $_getList(1);
}

enum Statement_Content { dto, enum_11, query, command, notSet }

class Statement extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, Statement_Content> _Statement_ContentByTag =
      {
    10: Statement_Content.dto,
    11: Statement_Content.enum_11,
    12: Statement_Content.query,
    13: Statement_Content.command,
    0: Statement_Content.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Statement',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'leancode.contracts'),
      createEmptyInstance: create)
    ..oo(0, [10, 11, 12, 13])
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'comment')
    ..pc<AttributeRef>(
        3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'attributes', $pb.PbFieldType.PM,
        subBuilder: AttributeRef.create)
    ..aOM<Statement_DTO>(
        10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dto',
        subBuilder: Statement_DTO.create)
    ..aOM<Statement_Enum>(
        11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'enum',
        subBuilder: Statement_Enum.create)
    ..aOM<Statement_Query>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'query', subBuilder: Statement_Query.create)
    ..aOM<Statement_Command>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'command', subBuilder: Statement_Command.create)
    ..hasRequiredFields = false;

  Statement._() : super();
  factory Statement({
    $core.String? name,
    $core.String? comment,
    $core.Iterable<AttributeRef>? attributes,
    Statement_DTO? dto,
    Statement_Enum? enum_11,
    Statement_Query? query,
    Statement_Command? command,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (comment != null) {
      _result.comment = comment;
    }
    if (attributes != null) {
      _result.attributes.addAll(attributes);
    }
    if (dto != null) {
      _result.dto = dto;
    }
    if (enum_11 != null) {
      _result.enum_11 = enum_11;
    }
    if (query != null) {
      _result.query = query;
    }
    if (command != null) {
      _result.command = command;
    }
    return _result;
  }
  factory Statement.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Statement.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Statement clone() => Statement()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Statement copyWith(void Function(Statement) updates) =>
      super.copyWith((message) => updates(message as Statement))
          as Statement; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Statement create() => Statement._();
  Statement createEmptyInstance() => create();
  static $pb.PbList<Statement> createRepeated() => $pb.PbList<Statement>();
  @$core.pragma('dart2js:noInline')
  static Statement getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Statement>(create);
  static Statement? _defaultInstance;

  Statement_Content whichContent() => _Statement_ContentByTag[$_whichOneof(0)]!;
  void clearContent() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get comment => $_getSZ(1);
  @$pb.TagNumber(2)
  set comment($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasComment() => $_has(1);
  @$pb.TagNumber(2)
  void clearComment() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<AttributeRef> get attributes => $_getList(2);

  @$pb.TagNumber(10)
  Statement_DTO get dto => $_getN(3);
  @$pb.TagNumber(10)
  set dto(Statement_DTO v) {
    setField(10, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasDto() => $_has(3);
  @$pb.TagNumber(10)
  void clearDto() => clearField(10);
  @$pb.TagNumber(10)
  Statement_DTO ensureDto() => $_ensure(3);

  @$pb.TagNumber(11)
  Statement_Enum get enum_11 => $_getN(4);
  @$pb.TagNumber(11)
  set enum_11(Statement_Enum v) {
    setField(11, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasEnum_11() => $_has(4);
  @$pb.TagNumber(11)
  void clearEnum_11() => clearField(11);
  @$pb.TagNumber(11)
  Statement_Enum ensureEnum_11() => $_ensure(4);

  @$pb.TagNumber(12)
  Statement_Query get query => $_getN(5);
  @$pb.TagNumber(12)
  set query(Statement_Query v) {
    setField(12, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasQuery() => $_has(5);
  @$pb.TagNumber(12)
  void clearQuery() => clearField(12);
  @$pb.TagNumber(12)
  Statement_Query ensureQuery() => $_ensure(5);

  @$pb.TagNumber(13)
  Statement_Command get command => $_getN(6);
  @$pb.TagNumber(13)
  set command(Statement_Command v) {
    setField(13, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasCommand() => $_has(6);
  @$pb.TagNumber(13)
  void clearCommand() => clearField(13);
  @$pb.TagNumber(13)
  Statement_Command ensureCommand() => $_ensure(6);
}

class Export extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Export',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'leancode.contracts'),
      createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'projectName',
        protoName: 'projectName')
    ..pc<Statement>(
        2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'statements', $pb.PbFieldType.PM,
        subBuilder: Statement.create)
    ..pc<ErrorCode_Group>(
        3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'knownErrorGroups', $pb.PbFieldType.PM,
        protoName: 'knownErrorGroups', subBuilder: ErrorCode_Group.create)
    ..hasRequiredFields = false;

  Export._() : super();
  factory Export({
    $core.String? projectName,
    $core.Iterable<Statement>? statements,
    $core.Iterable<ErrorCode_Group>? knownErrorGroups,
  }) {
    final _result = create();
    if (projectName != null) {
      _result.projectName = projectName;
    }
    if (statements != null) {
      _result.statements.addAll(statements);
    }
    if (knownErrorGroups != null) {
      _result.knownErrorGroups.addAll(knownErrorGroups);
    }
    return _result;
  }
  factory Export.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Export.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Export clone() => Export()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Export copyWith(void Function(Export) updates) =>
      super.copyWith((message) => updates(message as Export))
          as Export; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Export create() => Export._();
  Export createEmptyInstance() => create();
  static $pb.PbList<Export> createRepeated() => $pb.PbList<Export>();
  @$core.pragma('dart2js:noInline')
  static Export getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Export>(create);
  static Export? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get projectName => $_getSZ(0);
  @$pb.TagNumber(1)
  set projectName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasProjectName() => $_has(0);
  @$pb.TagNumber(1)
  void clearProjectName() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<Statement> get statements => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<ErrorCode_Group> get knownErrorGroups => $_getList(2);
}
