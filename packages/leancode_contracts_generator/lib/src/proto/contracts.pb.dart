//
//  Generated code. Do not modify.
//  source: contracts.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'contracts.pbenum.dart';

export 'contracts.pbenum.dart';

class ValueRef_Null extends $pb.GeneratedMessage {
  factory ValueRef_Null() => create();
  ValueRef_Null._() : super();
  factory ValueRef_Null.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ValueRef_Null.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ValueRef.Null',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'leancode.contracts'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ValueRef_Null clone() => ValueRef_Null()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ValueRef_Null copyWith(void Function(ValueRef_Null) updates) =>
      super.copyWith((message) => updates(message as ValueRef_Null))
          as ValueRef_Null;

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
  factory ValueRef_Number({
    $fixnum.Int64? value,
  }) {
    final $result = create();
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  ValueRef_Number._() : super();
  factory ValueRef_Number.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ValueRef_Number.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ValueRef.Number',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'leancode.contracts'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'value')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ValueRef_Number clone() => ValueRef_Number()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ValueRef_Number copyWith(void Function(ValueRef_Number) updates) =>
      super.copyWith((message) => updates(message as ValueRef_Number))
          as ValueRef_Number;

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
  factory ValueRef_FloatingPointNumber({
    $core.double? value,
  }) {
    final $result = create();
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  ValueRef_FloatingPointNumber._() : super();
  factory ValueRef_FloatingPointNumber.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ValueRef_FloatingPointNumber.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ValueRef.FloatingPointNumber',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'leancode.contracts'),
      createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

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
          as ValueRef_FloatingPointNumber;

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
  factory ValueRef_String({
    $core.String? value,
  }) {
    final $result = create();
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  ValueRef_String._() : super();
  factory ValueRef_String.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ValueRef_String.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ValueRef.String',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'leancode.contracts'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'value')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ValueRef_String clone() => ValueRef_String()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ValueRef_String copyWith(void Function(ValueRef_String) updates) =>
      super.copyWith((message) => updates(message as ValueRef_String))
          as ValueRef_String;

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
  factory ValueRef_Boolean({
    $core.bool? value,
  }) {
    final $result = create();
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  ValueRef_Boolean._() : super();
  factory ValueRef_Boolean.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ValueRef_Boolean.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ValueRef.Boolean',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'leancode.contracts'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'value')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ValueRef_Boolean clone() => ValueRef_Boolean()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ValueRef_Boolean copyWith(void Function(ValueRef_Boolean) updates) =>
      super.copyWith((message) => updates(message as ValueRef_Boolean))
          as ValueRef_Boolean;

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
  factory ValueRef({
    ValueRef_Null? null_1,
    ValueRef_Number? number,
    ValueRef_FloatingPointNumber? floatingPoint,
    ValueRef_String? string,
    ValueRef_Boolean? bool_5,
  }) {
    final $result = create();
    if (null_1 != null) {
      $result.null_1 = null_1;
    }
    if (number != null) {
      $result.number = number;
    }
    if (floatingPoint != null) {
      $result.floatingPoint = floatingPoint;
    }
    if (string != null) {
      $result.string = string;
    }
    if (bool_5 != null) {
      $result.bool_5 = bool_5;
    }
    return $result;
  }
  ValueRef._() : super();
  factory ValueRef.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ValueRef.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, ValueRef_Value> _ValueRef_ValueByTag = {
    1: ValueRef_Value.null_1,
    2: ValueRef_Value.number,
    3: ValueRef_Value.floatingPoint,
    4: ValueRef_Value.string,
    5: ValueRef_Value.bool_5,
    0: ValueRef_Value.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ValueRef',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'leancode.contracts'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5])
    ..aOM<ValueRef_Null>(1, _omitFieldNames ? '' : 'null',
        subBuilder: ValueRef_Null.create)
    ..aOM<ValueRef_Number>(2, _omitFieldNames ? '' : 'number',
        subBuilder: ValueRef_Number.create)
    ..aOM<ValueRef_FloatingPointNumber>(
        3, _omitFieldNames ? '' : 'floatingPoint',
        protoName: 'floatingPoint',
        subBuilder: ValueRef_FloatingPointNumber.create)
    ..aOM<ValueRef_String>(4, _omitFieldNames ? '' : 'string',
        subBuilder: ValueRef_String.create)
    ..aOM<ValueRef_Boolean>(5, _omitFieldNames ? '' : 'bool',
        subBuilder: ValueRef_Boolean.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ValueRef clone() => ValueRef()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ValueRef copyWith(void Function(ValueRef) updates) =>
      super.copyWith((message) => updates(message as ValueRef)) as ValueRef;

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
  factory TypeRef_Generic({
    $core.String? name,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  TypeRef_Generic._() : super();
  factory TypeRef_Generic.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TypeRef_Generic.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TypeRef.Generic',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'leancode.contracts'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TypeRef_Generic clone() => TypeRef_Generic()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TypeRef_Generic copyWith(void Function(TypeRef_Generic) updates) =>
      super.copyWith((message) => updates(message as TypeRef_Generic))
          as TypeRef_Generic;

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
  factory TypeRef_Internal({
    $core.String? name,
    $core.Iterable<TypeRef>? arguments,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (arguments != null) {
      $result.arguments.addAll(arguments);
    }
    return $result;
  }
  TypeRef_Internal._() : super();
  factory TypeRef_Internal.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TypeRef_Internal.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TypeRef.Internal',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'leancode.contracts'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..pc<TypeRef>(2, _omitFieldNames ? '' : 'arguments', $pb.PbFieldType.PM,
        subBuilder: TypeRef.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TypeRef_Internal clone() => TypeRef_Internal()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TypeRef_Internal copyWith(void Function(TypeRef_Internal) updates) =>
      super.copyWith((message) => updates(message as TypeRef_Internal))
          as TypeRef_Internal;

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
  factory TypeRef_Known({
    KnownType? type,
    $core.Iterable<TypeRef>? arguments,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (arguments != null) {
      $result.arguments.addAll(arguments);
    }
    return $result;
  }
  TypeRef_Known._() : super();
  factory TypeRef_Known.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TypeRef_Known.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TypeRef.Known',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'leancode.contracts'),
      createEmptyInstance: create)
    ..e<KnownType>(1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE,
        defaultOrMaker: KnownType.Object_,
        valueOf: KnownType.valueOf,
        enumValues: KnownType.values)
    ..pc<TypeRef>(2, _omitFieldNames ? '' : 'arguments', $pb.PbFieldType.PM,
        subBuilder: TypeRef.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TypeRef_Known clone() => TypeRef_Known()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TypeRef_Known copyWith(void Function(TypeRef_Known) updates) =>
      super.copyWith((message) => updates(message as TypeRef_Known))
          as TypeRef_Known;

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
  factory TypeRef({
    $core.bool? nullable,
    TypeRef_Generic? generic,
    TypeRef_Internal? internal,
    TypeRef_Known? known,
  }) {
    final $result = create();
    if (nullable != null) {
      $result.nullable = nullable;
    }
    if (generic != null) {
      $result.generic = generic;
    }
    if (internal != null) {
      $result.internal = internal;
    }
    if (known != null) {
      $result.known = known;
    }
    return $result;
  }
  TypeRef._() : super();
  factory TypeRef.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TypeRef.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, TypeRef_Type> _TypeRef_TypeByTag = {
    2: TypeRef_Type.generic,
    3: TypeRef_Type.internal,
    4: TypeRef_Type.known,
    0: TypeRef_Type.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TypeRef',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'leancode.contracts'),
      createEmptyInstance: create)
    ..oo(0, [2, 3, 4])
    ..aOB(1, _omitFieldNames ? '' : 'nullable')
    ..aOM<TypeRef_Generic>(2, _omitFieldNames ? '' : 'generic',
        subBuilder: TypeRef_Generic.create)
    ..aOM<TypeRef_Internal>(3, _omitFieldNames ? '' : 'internal',
        subBuilder: TypeRef_Internal.create)
    ..aOM<TypeRef_Known>(4, _omitFieldNames ? '' : 'known',
        subBuilder: TypeRef_Known.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TypeRef clone() => TypeRef()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TypeRef copyWith(void Function(TypeRef) updates) =>
      super.copyWith((message) => updates(message as TypeRef)) as TypeRef;

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

class NotificationTypeRef extends $pb.GeneratedMessage {
  factory NotificationTypeRef({
    TypeRef? type,
    $core.String? tag,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (tag != null) {
      $result.tag = tag;
    }
    return $result;
  }
  NotificationTypeRef._() : super();
  factory NotificationTypeRef.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory NotificationTypeRef.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NotificationTypeRef',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'leancode.contracts'),
      createEmptyInstance: create)
    ..aOM<TypeRef>(1, _omitFieldNames ? '' : 'type', subBuilder: TypeRef.create)
    ..aOS(2, _omitFieldNames ? '' : 'tag')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  NotificationTypeRef clone() => NotificationTypeRef()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  NotificationTypeRef copyWith(void Function(NotificationTypeRef) updates) =>
      super.copyWith((message) => updates(message as NotificationTypeRef))
          as NotificationTypeRef;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NotificationTypeRef create() => NotificationTypeRef._();
  NotificationTypeRef createEmptyInstance() => create();
  static $pb.PbList<NotificationTypeRef> createRepeated() =>
      $pb.PbList<NotificationTypeRef>();
  @$core.pragma('dart2js:noInline')
  static NotificationTypeRef getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NotificationTypeRef>(create);
  static NotificationTypeRef? _defaultInstance;

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
  $core.String get tag => $_getSZ(1);
  @$pb.TagNumber(2)
  set tag($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTag() => $_has(1);
  @$pb.TagNumber(2)
  void clearTag() => clearField(2);
}

class GenericParameter extends $pb.GeneratedMessage {
  factory GenericParameter({
    $core.String? name,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  GenericParameter._() : super();
  factory GenericParameter.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GenericParameter.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GenericParameter',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'leancode.contracts'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GenericParameter clone() => GenericParameter()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GenericParameter copyWith(void Function(GenericParameter) updates) =>
      super.copyWith((message) => updates(message as GenericParameter))
          as GenericParameter;

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
  factory AttributeArgument_Positional({
    $core.int? position,
    ValueRef? value,
  }) {
    final $result = create();
    if (position != null) {
      $result.position = position;
    }
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  AttributeArgument_Positional._() : super();
  factory AttributeArgument_Positional.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AttributeArgument_Positional.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AttributeArgument.Positional',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'leancode.contracts'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'position', $pb.PbFieldType.O3)
    ..aOM<ValueRef>(2, _omitFieldNames ? '' : 'value',
        subBuilder: ValueRef.create)
    ..hasRequiredFields = false;

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
          as AttributeArgument_Positional;

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
  factory AttributeArgument_Named({
    $core.String? name,
    ValueRef? value,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  AttributeArgument_Named._() : super();
  factory AttributeArgument_Named.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AttributeArgument_Named.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AttributeArgument.Named',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'leancode.contracts'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOM<ValueRef>(2, _omitFieldNames ? '' : 'value',
        subBuilder: ValueRef.create)
    ..hasRequiredFields = false;

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
          as AttributeArgument_Named;

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
  factory AttributeArgument({
    AttributeArgument_Positional? positional,
    AttributeArgument_Named? named,
  }) {
    final $result = create();
    if (positional != null) {
      $result.positional = positional;
    }
    if (named != null) {
      $result.named = named;
    }
    return $result;
  }
  AttributeArgument._() : super();
  factory AttributeArgument.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AttributeArgument.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, AttributeArgument_Attribute>
      _AttributeArgument_AttributeByTag = {
    1: AttributeArgument_Attribute.positional,
    2: AttributeArgument_Attribute.named,
    0: AttributeArgument_Attribute.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AttributeArgument',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'leancode.contracts'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<AttributeArgument_Positional>(1, _omitFieldNames ? '' : 'positional',
        subBuilder: AttributeArgument_Positional.create)
    ..aOM<AttributeArgument_Named>(2, _omitFieldNames ? '' : 'named',
        subBuilder: AttributeArgument_Named.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AttributeArgument clone() => AttributeArgument()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AttributeArgument copyWith(void Function(AttributeArgument) updates) =>
      super.copyWith((message) => updates(message as AttributeArgument))
          as AttributeArgument;

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
  factory AttributeRef({
    $core.String? attributeName,
    $core.Iterable<AttributeArgument>? argument,
  }) {
    final $result = create();
    if (attributeName != null) {
      $result.attributeName = attributeName;
    }
    if (argument != null) {
      $result.argument.addAll(argument);
    }
    return $result;
  }
  AttributeRef._() : super();
  factory AttributeRef.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AttributeRef.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AttributeRef',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'leancode.contracts'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'attributeName', protoName: 'attributeName')
    ..pc<AttributeArgument>(
        2, _omitFieldNames ? '' : 'argument', $pb.PbFieldType.PM,
        subBuilder: AttributeArgument.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AttributeRef clone() => AttributeRef()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AttributeRef copyWith(void Function(AttributeRef) updates) =>
      super.copyWith((message) => updates(message as AttributeRef))
          as AttributeRef;

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
  factory PropertyRef({
    TypeRef? type,
    $core.String? name,
    $core.Iterable<AttributeRef>? attributes,
    $core.String? comment,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (name != null) {
      $result.name = name;
    }
    if (attributes != null) {
      $result.attributes.addAll(attributes);
    }
    if (comment != null) {
      $result.comment = comment;
    }
    return $result;
  }
  PropertyRef._() : super();
  factory PropertyRef.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PropertyRef.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PropertyRef',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'leancode.contracts'),
      createEmptyInstance: create)
    ..aOM<TypeRef>(1, _omitFieldNames ? '' : 'type', subBuilder: TypeRef.create)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..pc<AttributeRef>(
        3, _omitFieldNames ? '' : 'attributes', $pb.PbFieldType.PM,
        subBuilder: AttributeRef.create)
    ..aOS(4, _omitFieldNames ? '' : 'comment')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PropertyRef clone() => PropertyRef()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PropertyRef copyWith(void Function(PropertyRef) updates) =>
      super.copyWith((message) => updates(message as PropertyRef))
          as PropertyRef;

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
  factory ConstantRef({
    $core.String? name,
    ValueRef? value,
    $core.String? comment,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (value != null) {
      $result.value = value;
    }
    if (comment != null) {
      $result.comment = comment;
    }
    return $result;
  }
  ConstantRef._() : super();
  factory ConstantRef.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConstantRef.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConstantRef',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'leancode.contracts'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOM<ValueRef>(2, _omitFieldNames ? '' : 'value',
        subBuilder: ValueRef.create)
    ..aOS(3, _omitFieldNames ? '' : 'comment')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ConstantRef clone() => ConstantRef()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ConstantRef copyWith(void Function(ConstantRef) updates) =>
      super.copyWith((message) => updates(message as ConstantRef))
          as ConstantRef;

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
  factory EnumValue({
    $core.String? name,
    $fixnum.Int64? value,
    $core.String? comment,
    $core.Iterable<AttributeRef>? attributes,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (value != null) {
      $result.value = value;
    }
    if (comment != null) {
      $result.comment = comment;
    }
    if (attributes != null) {
      $result.attributes.addAll(attributes);
    }
    return $result;
  }
  EnumValue._() : super();
  factory EnumValue.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory EnumValue.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EnumValue',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'leancode.contracts'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aInt64(2, _omitFieldNames ? '' : 'value')
    ..aOS(3, _omitFieldNames ? '' : 'comment')
    ..pc<AttributeRef>(
        4, _omitFieldNames ? '' : 'attributes', $pb.PbFieldType.PM,
        subBuilder: AttributeRef.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  EnumValue clone() => EnumValue()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  EnumValue copyWith(void Function(EnumValue) updates) =>
      super.copyWith((message) => updates(message as EnumValue)) as EnumValue;

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

  @$pb.TagNumber(4)
  $core.List<AttributeRef> get attributes => $_getList(3);
}

class ErrorCode_Single extends $pb.GeneratedMessage {
  factory ErrorCode_Single({
    $core.String? name,
    $core.int? code,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (code != null) {
      $result.code = code;
    }
    return $result;
  }
  ErrorCode_Single._() : super();
  factory ErrorCode_Single.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ErrorCode_Single.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ErrorCode.Single',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'leancode.contracts'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'code', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ErrorCode_Single clone() => ErrorCode_Single()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ErrorCode_Single copyWith(void Function(ErrorCode_Single) updates) =>
      super.copyWith((message) => updates(message as ErrorCode_Single))
          as ErrorCode_Single;

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
  factory ErrorCode_Group({
    $core.String? name,
    $core.String? groupId,
    $core.Iterable<ErrorCode>? innerCodes,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (groupId != null) {
      $result.groupId = groupId;
    }
    if (innerCodes != null) {
      $result.innerCodes.addAll(innerCodes);
    }
    return $result;
  }
  ErrorCode_Group._() : super();
  factory ErrorCode_Group.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ErrorCode_Group.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ErrorCode.Group',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'leancode.contracts'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'groupId', protoName: 'groupId')
    ..pc<ErrorCode>(3, _omitFieldNames ? '' : 'innerCodes', $pb.PbFieldType.PM,
        protoName: 'innerCodes', subBuilder: ErrorCode.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ErrorCode_Group clone() => ErrorCode_Group()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ErrorCode_Group copyWith(void Function(ErrorCode_Group) updates) =>
      super.copyWith((message) => updates(message as ErrorCode_Group))
          as ErrorCode_Group;

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
  factory ErrorCode({
    ErrorCode_Single? single,
    ErrorCode_Group? group,
  }) {
    final $result = create();
    if (single != null) {
      $result.single = single;
    }
    if (group != null) {
      $result.group = group;
    }
    return $result;
  }
  ErrorCode._() : super();
  factory ErrorCode.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ErrorCode.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, ErrorCode_Code> _ErrorCode_CodeByTag = {
    1: ErrorCode_Code.single,
    2: ErrorCode_Code.group,
    0: ErrorCode_Code.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ErrorCode',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'leancode.contracts'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<ErrorCode_Single>(1, _omitFieldNames ? '' : 'single',
        subBuilder: ErrorCode_Single.create)
    ..aOM<ErrorCode_Group>(2, _omitFieldNames ? '' : 'group',
        subBuilder: ErrorCode_Group.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ErrorCode clone() => ErrorCode()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ErrorCode copyWith(void Function(ErrorCode) updates) =>
      super.copyWith((message) => updates(message as ErrorCode)) as ErrorCode;

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
  factory TypeDescriptor({
    $core.Iterable<TypeRef>? extends_1,
    $core.Iterable<GenericParameter>? genericParameters,
    $core.Iterable<PropertyRef>? properties,
    $core.Iterable<ConstantRef>? constants,
  }) {
    final $result = create();
    if (extends_1 != null) {
      $result.extends_1.addAll(extends_1);
    }
    if (genericParameters != null) {
      $result.genericParameters.addAll(genericParameters);
    }
    if (properties != null) {
      $result.properties.addAll(properties);
    }
    if (constants != null) {
      $result.constants.addAll(constants);
    }
    return $result;
  }
  TypeDescriptor._() : super();
  factory TypeDescriptor.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TypeDescriptor.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TypeDescriptor',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'leancode.contracts'),
      createEmptyInstance: create)
    ..pc<TypeRef>(1, _omitFieldNames ? '' : 'extends', $pb.PbFieldType.PM,
        subBuilder: TypeRef.create)
    ..pc<GenericParameter>(
        2, _omitFieldNames ? '' : 'genericParameters', $pb.PbFieldType.PM,
        protoName: 'genericParameters', subBuilder: GenericParameter.create)
    ..pc<PropertyRef>(
        3, _omitFieldNames ? '' : 'properties', $pb.PbFieldType.PM,
        subBuilder: PropertyRef.create)
    ..pc<ConstantRef>(4, _omitFieldNames ? '' : 'constants', $pb.PbFieldType.PM,
        subBuilder: ConstantRef.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TypeDescriptor clone() => TypeDescriptor()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TypeDescriptor copyWith(void Function(TypeDescriptor) updates) =>
      super.copyWith((message) => updates(message as TypeDescriptor))
          as TypeDescriptor;

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
  factory Statement_DTO({
    TypeDescriptor? typeDescriptor,
  }) {
    final $result = create();
    if (typeDescriptor != null) {
      $result.typeDescriptor = typeDescriptor;
    }
    return $result;
  }
  Statement_DTO._() : super();
  factory Statement_DTO.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Statement_DTO.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Statement.DTO',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'leancode.contracts'),
      createEmptyInstance: create)
    ..aOM<TypeDescriptor>(1, _omitFieldNames ? '' : 'typeDescriptor',
        protoName: 'typeDescriptor', subBuilder: TypeDescriptor.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Statement_DTO clone() => Statement_DTO()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Statement_DTO copyWith(void Function(Statement_DTO) updates) =>
      super.copyWith((message) => updates(message as Statement_DTO))
          as Statement_DTO;

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
  factory Statement_Enum({
    $core.Iterable<EnumValue>? members,
  }) {
    final $result = create();
    if (members != null) {
      $result.members.addAll(members);
    }
    return $result;
  }
  Statement_Enum._() : super();
  factory Statement_Enum.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Statement_Enum.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Statement.Enum',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'leancode.contracts'),
      createEmptyInstance: create)
    ..pc<EnumValue>(1, _omitFieldNames ? '' : 'members', $pb.PbFieldType.PM,
        subBuilder: EnumValue.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Statement_Enum clone() => Statement_Enum()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Statement_Enum copyWith(void Function(Statement_Enum) updates) =>
      super.copyWith((message) => updates(message as Statement_Enum))
          as Statement_Enum;

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
  factory Statement_Query({
    TypeDescriptor? typeDescriptor,
    TypeRef? returnType,
  }) {
    final $result = create();
    if (typeDescriptor != null) {
      $result.typeDescriptor = typeDescriptor;
    }
    if (returnType != null) {
      $result.returnType = returnType;
    }
    return $result;
  }
  Statement_Query._() : super();
  factory Statement_Query.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Statement_Query.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Statement.Query',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'leancode.contracts'),
      createEmptyInstance: create)
    ..aOM<TypeDescriptor>(1, _omitFieldNames ? '' : 'typeDescriptor',
        protoName: 'typeDescriptor', subBuilder: TypeDescriptor.create)
    ..aOM<TypeRef>(2, _omitFieldNames ? '' : 'returnType',
        protoName: 'returnType', subBuilder: TypeRef.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Statement_Query clone() => Statement_Query()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Statement_Query copyWith(void Function(Statement_Query) updates) =>
      super.copyWith((message) => updates(message as Statement_Query))
          as Statement_Query;

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
  factory Statement_Command({
    TypeDescriptor? typeDescriptor,
    $core.Iterable<ErrorCode>? errorCodes,
  }) {
    final $result = create();
    if (typeDescriptor != null) {
      $result.typeDescriptor = typeDescriptor;
    }
    if (errorCodes != null) {
      $result.errorCodes.addAll(errorCodes);
    }
    return $result;
  }
  Statement_Command._() : super();
  factory Statement_Command.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Statement_Command.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Statement.Command',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'leancode.contracts'),
      createEmptyInstance: create)
    ..aOM<TypeDescriptor>(1, _omitFieldNames ? '' : 'typeDescriptor',
        protoName: 'typeDescriptor', subBuilder: TypeDescriptor.create)
    ..pc<ErrorCode>(2, _omitFieldNames ? '' : 'errorCodes', $pb.PbFieldType.PM,
        protoName: 'errorCodes', subBuilder: ErrorCode.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Statement_Command clone() => Statement_Command()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Statement_Command copyWith(void Function(Statement_Command) updates) =>
      super.copyWith((message) => updates(message as Statement_Command))
          as Statement_Command;

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

class Statement_Operation extends $pb.GeneratedMessage {
  factory Statement_Operation({
    TypeDescriptor? typeDescriptor,
    TypeRef? returnType,
  }) {
    final $result = create();
    if (typeDescriptor != null) {
      $result.typeDescriptor = typeDescriptor;
    }
    if (returnType != null) {
      $result.returnType = returnType;
    }
    return $result;
  }
  Statement_Operation._() : super();
  factory Statement_Operation.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Statement_Operation.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Statement.Operation',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'leancode.contracts'),
      createEmptyInstance: create)
    ..aOM<TypeDescriptor>(1, _omitFieldNames ? '' : 'typeDescriptor',
        protoName: 'typeDescriptor', subBuilder: TypeDescriptor.create)
    ..aOM<TypeRef>(2, _omitFieldNames ? '' : 'returnType',
        protoName: 'returnType', subBuilder: TypeRef.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Statement_Operation clone() => Statement_Operation()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Statement_Operation copyWith(void Function(Statement_Operation) updates) =>
      super.copyWith((message) => updates(message as Statement_Operation))
          as Statement_Operation;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Statement_Operation create() => Statement_Operation._();
  Statement_Operation createEmptyInstance() => create();
  static $pb.PbList<Statement_Operation> createRepeated() =>
      $pb.PbList<Statement_Operation>();
  @$core.pragma('dart2js:noInline')
  static Statement_Operation getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Statement_Operation>(create);
  static Statement_Operation? _defaultInstance;

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

class Statement_Topic extends $pb.GeneratedMessage {
  factory Statement_Topic({
    TypeDescriptor? typeDescriptor,
    $core.Iterable<NotificationTypeRef>? notifications,
  }) {
    final $result = create();
    if (typeDescriptor != null) {
      $result.typeDescriptor = typeDescriptor;
    }
    if (notifications != null) {
      $result.notifications.addAll(notifications);
    }
    return $result;
  }
  Statement_Topic._() : super();
  factory Statement_Topic.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Statement_Topic.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Statement.Topic',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'leancode.contracts'),
      createEmptyInstance: create)
    ..aOM<TypeDescriptor>(1, _omitFieldNames ? '' : 'typeDescriptor',
        protoName: 'typeDescriptor', subBuilder: TypeDescriptor.create)
    ..pc<NotificationTypeRef>(
        2, _omitFieldNames ? '' : 'notifications', $pb.PbFieldType.PM,
        subBuilder: NotificationTypeRef.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Statement_Topic clone() => Statement_Topic()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Statement_Topic copyWith(void Function(Statement_Topic) updates) =>
      super.copyWith((message) => updates(message as Statement_Topic))
          as Statement_Topic;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Statement_Topic create() => Statement_Topic._();
  Statement_Topic createEmptyInstance() => create();
  static $pb.PbList<Statement_Topic> createRepeated() =>
      $pb.PbList<Statement_Topic>();
  @$core.pragma('dart2js:noInline')
  static Statement_Topic getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Statement_Topic>(create);
  static Statement_Topic? _defaultInstance;

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
  $core.List<NotificationTypeRef> get notifications => $_getList(1);
}

enum Statement_Content {
  dto,
  enum_11,
  query,
  command,
  operation,
  topic,
  notSet
}

class Statement extends $pb.GeneratedMessage {
  factory Statement({
    $core.String? name,
    $core.String? comment,
    $core.Iterable<AttributeRef>? attributes,
    Statement_DTO? dto,
    Statement_Enum? enum_11,
    Statement_Query? query,
    Statement_Command? command,
    Statement_Operation? operation,
    Statement_Topic? topic,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (comment != null) {
      $result.comment = comment;
    }
    if (attributes != null) {
      $result.attributes.addAll(attributes);
    }
    if (dto != null) {
      $result.dto = dto;
    }
    if (enum_11 != null) {
      $result.enum_11 = enum_11;
    }
    if (query != null) {
      $result.query = query;
    }
    if (command != null) {
      $result.command = command;
    }
    if (operation != null) {
      $result.operation = operation;
    }
    if (topic != null) {
      $result.topic = topic;
    }
    return $result;
  }
  Statement._() : super();
  factory Statement.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Statement.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Statement_Content> _Statement_ContentByTag =
      {
    10: Statement_Content.dto,
    11: Statement_Content.enum_11,
    12: Statement_Content.query,
    13: Statement_Content.command,
    14: Statement_Content.operation,
    15: Statement_Content.topic,
    0: Statement_Content.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Statement',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'leancode.contracts'),
      createEmptyInstance: create)
    ..oo(0, [10, 11, 12, 13, 14, 15])
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'comment')
    ..pc<AttributeRef>(
        3, _omitFieldNames ? '' : 'attributes', $pb.PbFieldType.PM,
        subBuilder: AttributeRef.create)
    ..aOM<Statement_DTO>(10, _omitFieldNames ? '' : 'dto',
        subBuilder: Statement_DTO.create)
    ..aOM<Statement_Enum>(11, _omitFieldNames ? '' : 'enum',
        subBuilder: Statement_Enum.create)
    ..aOM<Statement_Query>(12, _omitFieldNames ? '' : 'query',
        subBuilder: Statement_Query.create)
    ..aOM<Statement_Command>(13, _omitFieldNames ? '' : 'command',
        subBuilder: Statement_Command.create)
    ..aOM<Statement_Operation>(14, _omitFieldNames ? '' : 'operation',
        subBuilder: Statement_Operation.create)
    ..aOM<Statement_Topic>(15, _omitFieldNames ? '' : 'topic',
        subBuilder: Statement_Topic.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Statement clone() => Statement()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Statement copyWith(void Function(Statement) updates) =>
      super.copyWith((message) => updates(message as Statement)) as Statement;

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

  @$pb.TagNumber(14)
  Statement_Operation get operation => $_getN(7);
  @$pb.TagNumber(14)
  set operation(Statement_Operation v) {
    setField(14, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasOperation() => $_has(7);
  @$pb.TagNumber(14)
  void clearOperation() => clearField(14);
  @$pb.TagNumber(14)
  Statement_Operation ensureOperation() => $_ensure(7);

  @$pb.TagNumber(15)
  Statement_Topic get topic => $_getN(8);
  @$pb.TagNumber(15)
  set topic(Statement_Topic v) {
    setField(15, v);
  }

  @$pb.TagNumber(15)
  $core.bool hasTopic() => $_has(8);
  @$pb.TagNumber(15)
  void clearTopic() => clearField(15);
  @$pb.TagNumber(15)
  Statement_Topic ensureTopic() => $_ensure(8);
}

class Export extends $pb.GeneratedMessage {
  factory Export({
    $core.String? projectName,
    $core.Iterable<Statement>? statements,
    $core.Iterable<ErrorCode_Group>? knownErrorGroups,
  }) {
    final $result = create();
    if (projectName != null) {
      $result.projectName = projectName;
    }
    if (statements != null) {
      $result.statements.addAll(statements);
    }
    if (knownErrorGroups != null) {
      $result.knownErrorGroups.addAll(knownErrorGroups);
    }
    return $result;
  }
  Export._() : super();
  factory Export.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Export.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Export',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'leancode.contracts'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'projectName', protoName: 'projectName')
    ..pc<Statement>(2, _omitFieldNames ? '' : 'statements', $pb.PbFieldType.PM,
        subBuilder: Statement.create)
    ..pc<ErrorCode_Group>(
        3, _omitFieldNames ? '' : 'knownErrorGroups', $pb.PbFieldType.PM,
        protoName: 'knownErrorGroups', subBuilder: ErrorCode_Group.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Export clone() => Export()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Export copyWith(void Function(Export) updates) =>
      super.copyWith((message) => updates(message as Export)) as Export;

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

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
