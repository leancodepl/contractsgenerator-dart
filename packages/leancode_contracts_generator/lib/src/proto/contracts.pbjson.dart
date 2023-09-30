//
//  Generated code. Do not modify.
//  source: contracts.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use knownTypeDescriptor instead')
const KnownType$json = {
  '1': 'KnownType',
  '2': [
    {'1': 'Object', '2': 0},
    {'1': 'String', '2': 1},
    {'1': 'Guid', '2': 3},
    {'1': 'Uri', '2': 4},
    {'1': 'Boolean', '2': 5},
    {'1': 'UInt8', '2': 100},
    {'1': 'Int8', '2': 101},
    {'1': 'Int16', '2': 102},
    {'1': 'UInt16', '2': 103},
    {'1': 'Int32', '2': 104},
    {'1': 'UInt32', '2': 105},
    {'1': 'Int64', '2': 106},
    {'1': 'UInt64', '2': 107},
    {'1': 'Float32', '2': 150},
    {'1': 'Float64', '2': 151},
    {'1': 'DateOnly', '2': 200},
    {'1': 'TimeOnly', '2': 201},
    {'1': 'DateTimeOffset', '2': 202},
    {'1': 'TimeSpan', '2': 203},
    {'1': 'Array', '2': 300},
    {'1': 'Map', '2': 301},
    {'1': 'Query', '2': 1000},
    {'1': 'Command', '2': 1001},
    {'1': 'CommandResult', '2': 1002},
    {'1': 'Operation', '2': 1003},
    {'1': 'Binary', '2': 1004},
    {'1': 'Topic', '2': 1005},
    {'1': 'Attribute', '2': 1100},
    {'1': 'AuthorizeWhenAttribute', '2': 1101},
    {'1': 'AuthorizeWhenHasAnyOfAttribute', '2': 1102},
  ],
};

/// Descriptor for `KnownType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List knownTypeDescriptor = $convert.base64Decode(
    'CglLbm93blR5cGUSCgoGT2JqZWN0EAASCgoGU3RyaW5nEAESCAoER3VpZBADEgcKA1VyaRAEEg'
    'sKB0Jvb2xlYW4QBRIJCgVVSW50OBBkEggKBEludDgQZRIJCgVJbnQxNhBmEgoKBlVJbnQxNhBn'
    'EgkKBUludDMyEGgSCgoGVUludDMyEGkSCQoFSW50NjQQahIKCgZVSW50NjQQaxIMCgdGbG9hdD'
    'MyEJYBEgwKB0Zsb2F0NjQQlwESDQoIRGF0ZU9ubHkQyAESDQoIVGltZU9ubHkQyQESEwoORGF0'
    'ZVRpbWVPZmZzZXQQygESDQoIVGltZVNwYW4QywESCgoFQXJyYXkQrAISCAoDTWFwEK0CEgoKBV'
    'F1ZXJ5EOgHEgwKB0NvbW1hbmQQ6QcSEgoNQ29tbWFuZFJlc3VsdBDqBxIOCglPcGVyYXRpb24Q'
    '6wcSCwoGQmluYXJ5EOwHEgoKBVRvcGljEO0HEg4KCUF0dHJpYnV0ZRDMCBIbChZBdXRob3Jpem'
    'VXaGVuQXR0cmlidXRlEM0IEiMKHkF1dGhvcml6ZVdoZW5IYXNBbnlPZkF0dHJpYnV0ZRDOCA==');

@$core.Deprecated('Use valueRefDescriptor instead')
const ValueRef$json = {
  '1': 'ValueRef',
  '2': [
    {
      '1': 'null',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.ValueRef.Null',
      '9': 0,
      '10': 'null'
    },
    {
      '1': 'number',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.ValueRef.Number',
      '9': 0,
      '10': 'number'
    },
    {
      '1': 'floatingPoint',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.ValueRef.FloatingPointNumber',
      '9': 0,
      '10': 'floatingPoint'
    },
    {
      '1': 'string',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.ValueRef.String',
      '9': 0,
      '10': 'string'
    },
    {
      '1': 'bool',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.ValueRef.Boolean',
      '9': 0,
      '10': 'bool'
    },
  ],
  '3': [
    ValueRef_Null$json,
    ValueRef_Number$json,
    ValueRef_FloatingPointNumber$json,
    ValueRef_String$json,
    ValueRef_Boolean$json
  ],
  '8': [
    {'1': 'value'},
  ],
};

@$core.Deprecated('Use valueRefDescriptor instead')
const ValueRef_Null$json = {
  '1': 'Null',
};

@$core.Deprecated('Use valueRefDescriptor instead')
const ValueRef_Number$json = {
  '1': 'Number',
  '2': [
    {'1': 'value', '3': 1, '4': 1, '5': 3, '10': 'value'},
  ],
};

@$core.Deprecated('Use valueRefDescriptor instead')
const ValueRef_FloatingPointNumber$json = {
  '1': 'FloatingPointNumber',
  '2': [
    {'1': 'value', '3': 1, '4': 1, '5': 1, '10': 'value'},
  ],
};

@$core.Deprecated('Use valueRefDescriptor instead')
const ValueRef_String$json = {
  '1': 'String',
  '2': [
    {'1': 'value', '3': 1, '4': 1, '5': 9, '10': 'value'},
  ],
};

@$core.Deprecated('Use valueRefDescriptor instead')
const ValueRef_Boolean$json = {
  '1': 'Boolean',
  '2': [
    {'1': 'value', '3': 1, '4': 1, '5': 8, '10': 'value'},
  ],
};

/// Descriptor for `ValueRef`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List valueRefDescriptor = $convert.base64Decode(
    'CghWYWx1ZVJlZhI3CgRudWxsGAEgASgLMiEubGVhbmNvZGUuY29udHJhY3RzLlZhbHVlUmVmLk'
    '51bGxIAFIEbnVsbBI9CgZudW1iZXIYAiABKAsyIy5sZWFuY29kZS5jb250cmFjdHMuVmFsdWVS'
    'ZWYuTnVtYmVySABSBm51bWJlchJYCg1mbG9hdGluZ1BvaW50GAMgASgLMjAubGVhbmNvZGUuY2'
    '9udHJhY3RzLlZhbHVlUmVmLkZsb2F0aW5nUG9pbnROdW1iZXJIAFINZmxvYXRpbmdQb2ludBI9'
    'CgZzdHJpbmcYBCABKAsyIy5sZWFuY29kZS5jb250cmFjdHMuVmFsdWVSZWYuU3RyaW5nSABSBn'
    'N0cmluZxI6CgRib29sGAUgASgLMiQubGVhbmNvZGUuY29udHJhY3RzLlZhbHVlUmVmLkJvb2xl'
    'YW5IAFIEYm9vbBoGCgROdWxsGh4KBk51bWJlchIUCgV2YWx1ZRgBIAEoA1IFdmFsdWUaKwoTRm'
    'xvYXRpbmdQb2ludE51bWJlchIUCgV2YWx1ZRgBIAEoAVIFdmFsdWUaHgoGU3RyaW5nEhQKBXZh'
    'bHVlGAEgASgJUgV2YWx1ZRofCgdCb29sZWFuEhQKBXZhbHVlGAEgASgIUgV2YWx1ZUIHCgV2YW'
    'x1ZQ==');

@$core.Deprecated('Use typeRefDescriptor instead')
const TypeRef$json = {
  '1': 'TypeRef',
  '2': [
    {'1': 'nullable', '3': 1, '4': 1, '5': 8, '10': 'nullable'},
    {
      '1': 'generic',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.TypeRef.Generic',
      '9': 0,
      '10': 'generic'
    },
    {
      '1': 'internal',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.TypeRef.Internal',
      '9': 0,
      '10': 'internal'
    },
    {
      '1': 'known',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.TypeRef.Known',
      '9': 0,
      '10': 'known'
    },
  ],
  '3': [TypeRef_Generic$json, TypeRef_Internal$json, TypeRef_Known$json],
  '8': [
    {'1': 'type'},
  ],
};

@$core.Deprecated('Use typeRefDescriptor instead')
const TypeRef_Generic$json = {
  '1': 'Generic',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

@$core.Deprecated('Use typeRefDescriptor instead')
const TypeRef_Internal$json = {
  '1': 'Internal',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {
      '1': 'arguments',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.leancode.contracts.TypeRef',
      '10': 'arguments'
    },
  ],
};

@$core.Deprecated('Use typeRefDescriptor instead')
const TypeRef_Known$json = {
  '1': 'Known',
  '2': [
    {
      '1': 'type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.leancode.contracts.KnownType',
      '10': 'type'
    },
    {
      '1': 'arguments',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.leancode.contracts.TypeRef',
      '10': 'arguments'
    },
  ],
};

/// Descriptor for `TypeRef`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List typeRefDescriptor = $convert.base64Decode(
    'CgdUeXBlUmVmEhoKCG51bGxhYmxlGAEgASgIUghudWxsYWJsZRI/CgdnZW5lcmljGAIgASgLMi'
    'MubGVhbmNvZGUuY29udHJhY3RzLlR5cGVSZWYuR2VuZXJpY0gAUgdnZW5lcmljEkIKCGludGVy'
    'bmFsGAMgASgLMiQubGVhbmNvZGUuY29udHJhY3RzLlR5cGVSZWYuSW50ZXJuYWxIAFIIaW50ZX'
    'JuYWwSOQoFa25vd24YBCABKAsyIS5sZWFuY29kZS5jb250cmFjdHMuVHlwZVJlZi5Lbm93bkgA'
    'UgVrbm93bhodCgdHZW5lcmljEhIKBG5hbWUYASABKAlSBG5hbWUaWQoISW50ZXJuYWwSEgoEbm'
    'FtZRgBIAEoCVIEbmFtZRI5Cglhcmd1bWVudHMYAiADKAsyGy5sZWFuY29kZS5jb250cmFjdHMu'
    'VHlwZVJlZlIJYXJndW1lbnRzGnUKBUtub3duEjEKBHR5cGUYASABKA4yHS5sZWFuY29kZS5jb2'
    '50cmFjdHMuS25vd25UeXBlUgR0eXBlEjkKCWFyZ3VtZW50cxgCIAMoCzIbLmxlYW5jb2RlLmNv'
    'bnRyYWN0cy5UeXBlUmVmUglhcmd1bWVudHNCBgoEdHlwZQ==');

@$core.Deprecated('Use notificationTypeRefDescriptor instead')
const NotificationTypeRef$json = {
  '1': 'NotificationTypeRef',
  '2': [
    {
      '1': 'type',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.TypeRef',
      '10': 'type'
    },
    {'1': 'tag', '3': 2, '4': 1, '5': 9, '10': 'tag'},
  ],
};

/// Descriptor for `NotificationTypeRef`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List notificationTypeRefDescriptor = $convert.base64Decode(
    'ChNOb3RpZmljYXRpb25UeXBlUmVmEi8KBHR5cGUYASABKAsyGy5sZWFuY29kZS5jb250cmFjdH'
    'MuVHlwZVJlZlIEdHlwZRIQCgN0YWcYAiABKAlSA3RhZw==');

@$core.Deprecated('Use genericParameterDescriptor instead')
const GenericParameter$json = {
  '1': 'GenericParameter',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `GenericParameter`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List genericParameterDescriptor = $convert
    .base64Decode('ChBHZW5lcmljUGFyYW1ldGVyEhIKBG5hbWUYASABKAlSBG5hbWU=');

@$core.Deprecated('Use attributeArgumentDescriptor instead')
const AttributeArgument$json = {
  '1': 'AttributeArgument',
  '2': [
    {
      '1': 'positional',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.AttributeArgument.Positional',
      '9': 0,
      '10': 'positional'
    },
    {
      '1': 'named',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.AttributeArgument.Named',
      '9': 0,
      '10': 'named'
    },
  ],
  '3': [AttributeArgument_Positional$json, AttributeArgument_Named$json],
  '8': [
    {'1': 'attribute'},
  ],
};

@$core.Deprecated('Use attributeArgumentDescriptor instead')
const AttributeArgument_Positional$json = {
  '1': 'Positional',
  '2': [
    {'1': 'position', '3': 1, '4': 1, '5': 5, '10': 'position'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.ValueRef',
      '10': 'value'
    },
  ],
};

@$core.Deprecated('Use attributeArgumentDescriptor instead')
const AttributeArgument_Named$json = {
  '1': 'Named',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.ValueRef',
      '10': 'value'
    },
  ],
};

/// Descriptor for `AttributeArgument`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List attributeArgumentDescriptor = $convert.base64Decode(
    'ChFBdHRyaWJ1dGVBcmd1bWVudBJSCgpwb3NpdGlvbmFsGAEgASgLMjAubGVhbmNvZGUuY29udH'
    'JhY3RzLkF0dHJpYnV0ZUFyZ3VtZW50LlBvc2l0aW9uYWxIAFIKcG9zaXRpb25hbBJDCgVuYW1l'
    'ZBgCIAEoCzIrLmxlYW5jb2RlLmNvbnRyYWN0cy5BdHRyaWJ1dGVBcmd1bWVudC5OYW1lZEgAUg'
    'VuYW1lZBpcCgpQb3NpdGlvbmFsEhoKCHBvc2l0aW9uGAEgASgFUghwb3NpdGlvbhIyCgV2YWx1'
    'ZRgCIAEoCzIcLmxlYW5jb2RlLmNvbnRyYWN0cy5WYWx1ZVJlZlIFdmFsdWUaTwoFTmFtZWQSEg'
    'oEbmFtZRgBIAEoCVIEbmFtZRIyCgV2YWx1ZRgCIAEoCzIcLmxlYW5jb2RlLmNvbnRyYWN0cy5W'
    'YWx1ZVJlZlIFdmFsdWVCCwoJYXR0cmlidXRl');

@$core.Deprecated('Use attributeRefDescriptor instead')
const AttributeRef$json = {
  '1': 'AttributeRef',
  '2': [
    {'1': 'attributeName', '3': 1, '4': 1, '5': 9, '10': 'attributeName'},
    {
      '1': 'argument',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.leancode.contracts.AttributeArgument',
      '10': 'argument'
    },
  ],
};

/// Descriptor for `AttributeRef`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List attributeRefDescriptor = $convert.base64Decode(
    'CgxBdHRyaWJ1dGVSZWYSJAoNYXR0cmlidXRlTmFtZRgBIAEoCVINYXR0cmlidXRlTmFtZRJBCg'
    'hhcmd1bWVudBgCIAMoCzIlLmxlYW5jb2RlLmNvbnRyYWN0cy5BdHRyaWJ1dGVBcmd1bWVudFII'
    'YXJndW1lbnQ=');

@$core.Deprecated('Use propertyRefDescriptor instead')
const PropertyRef$json = {
  '1': 'PropertyRef',
  '2': [
    {
      '1': 'type',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.TypeRef',
      '10': 'type'
    },
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {
      '1': 'attributes',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.leancode.contracts.AttributeRef',
      '10': 'attributes'
    },
    {'1': 'comment', '3': 4, '4': 1, '5': 9, '10': 'comment'},
  ],
};

/// Descriptor for `PropertyRef`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List propertyRefDescriptor = $convert.base64Decode(
    'CgtQcm9wZXJ0eVJlZhIvCgR0eXBlGAEgASgLMhsubGVhbmNvZGUuY29udHJhY3RzLlR5cGVSZW'
    'ZSBHR5cGUSEgoEbmFtZRgCIAEoCVIEbmFtZRJACgphdHRyaWJ1dGVzGAMgAygLMiAubGVhbmNv'
    'ZGUuY29udHJhY3RzLkF0dHJpYnV0ZVJlZlIKYXR0cmlidXRlcxIYCgdjb21tZW50GAQgASgJUg'
    'djb21tZW50');

@$core.Deprecated('Use constantRefDescriptor instead')
const ConstantRef$json = {
  '1': 'ConstantRef',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.ValueRef',
      '10': 'value'
    },
    {'1': 'comment', '3': 3, '4': 1, '5': 9, '10': 'comment'},
  ],
};

/// Descriptor for `ConstantRef`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List constantRefDescriptor = $convert.base64Decode(
    'CgtDb25zdGFudFJlZhISCgRuYW1lGAEgASgJUgRuYW1lEjIKBXZhbHVlGAIgASgLMhwubGVhbm'
    'NvZGUuY29udHJhY3RzLlZhbHVlUmVmUgV2YWx1ZRIYCgdjb21tZW50GAMgASgJUgdjb21tZW50');

@$core.Deprecated('Use enumValueDescriptor instead')
const EnumValue$json = {
  '1': 'EnumValue',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'value', '3': 2, '4': 1, '5': 3, '10': 'value'},
    {'1': 'comment', '3': 3, '4': 1, '5': 9, '10': 'comment'},
    {
      '1': 'attributes',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.leancode.contracts.AttributeRef',
      '10': 'attributes'
    },
  ],
};

/// Descriptor for `EnumValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List enumValueDescriptor = $convert.base64Decode(
    'CglFbnVtVmFsdWUSEgoEbmFtZRgBIAEoCVIEbmFtZRIUCgV2YWx1ZRgCIAEoA1IFdmFsdWUSGA'
    'oHY29tbWVudBgDIAEoCVIHY29tbWVudBJACgphdHRyaWJ1dGVzGAQgAygLMiAubGVhbmNvZGUu'
    'Y29udHJhY3RzLkF0dHJpYnV0ZVJlZlIKYXR0cmlidXRlcw==');

@$core.Deprecated('Use errorCodeDescriptor instead')
const ErrorCode$json = {
  '1': 'ErrorCode',
  '2': [
    {
      '1': 'single',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.ErrorCode.Single',
      '9': 0,
      '10': 'single'
    },
    {
      '1': 'group',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.ErrorCode.Group',
      '9': 0,
      '10': 'group'
    },
  ],
  '3': [ErrorCode_Single$json, ErrorCode_Group$json],
  '8': [
    {'1': 'code'},
  ],
};

@$core.Deprecated('Use errorCodeDescriptor instead')
const ErrorCode_Single$json = {
  '1': 'Single',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'code', '3': 2, '4': 1, '5': 5, '10': 'code'},
  ],
};

@$core.Deprecated('Use errorCodeDescriptor instead')
const ErrorCode_Group$json = {
  '1': 'Group',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'groupId', '3': 2, '4': 1, '5': 9, '10': 'groupId'},
    {
      '1': 'innerCodes',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.leancode.contracts.ErrorCode',
      '10': 'innerCodes'
    },
  ],
};

/// Descriptor for `ErrorCode`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List errorCodeDescriptor = $convert.base64Decode(
    'CglFcnJvckNvZGUSPgoGc2luZ2xlGAEgASgLMiQubGVhbmNvZGUuY29udHJhY3RzLkVycm9yQ2'
    '9kZS5TaW5nbGVIAFIGc2luZ2xlEjsKBWdyb3VwGAIgASgLMiMubGVhbmNvZGUuY29udHJhY3Rz'
    'LkVycm9yQ29kZS5Hcm91cEgAUgVncm91cBowCgZTaW5nbGUSEgoEbmFtZRgBIAEoCVIEbmFtZR'
    'ISCgRjb2RlGAIgASgFUgRjb2RlGnQKBUdyb3VwEhIKBG5hbWUYASABKAlSBG5hbWUSGAoHZ3Jv'
    'dXBJZBgCIAEoCVIHZ3JvdXBJZBI9Cgppbm5lckNvZGVzGAMgAygLMh0ubGVhbmNvZGUuY29udH'
    'JhY3RzLkVycm9yQ29kZVIKaW5uZXJDb2Rlc0IGCgRjb2Rl');

@$core.Deprecated('Use typeDescriptorDescriptor instead')
const TypeDescriptor$json = {
  '1': 'TypeDescriptor',
  '2': [
    {
      '1': 'extends',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.leancode.contracts.TypeRef',
      '10': 'extends'
    },
    {
      '1': 'genericParameters',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.leancode.contracts.GenericParameter',
      '10': 'genericParameters'
    },
    {
      '1': 'properties',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.leancode.contracts.PropertyRef',
      '10': 'properties'
    },
    {
      '1': 'constants',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.leancode.contracts.ConstantRef',
      '10': 'constants'
    },
  ],
};

/// Descriptor for `TypeDescriptor`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List typeDescriptorDescriptor = $convert.base64Decode(
    'Cg5UeXBlRGVzY3JpcHRvchI1CgdleHRlbmRzGAEgAygLMhsubGVhbmNvZGUuY29udHJhY3RzLl'
    'R5cGVSZWZSB2V4dGVuZHMSUgoRZ2VuZXJpY1BhcmFtZXRlcnMYAiADKAsyJC5sZWFuY29kZS5j'
    'b250cmFjdHMuR2VuZXJpY1BhcmFtZXRlclIRZ2VuZXJpY1BhcmFtZXRlcnMSPwoKcHJvcGVydG'
    'llcxgDIAMoCzIfLmxlYW5jb2RlLmNvbnRyYWN0cy5Qcm9wZXJ0eVJlZlIKcHJvcGVydGllcxI9'
    'Cgljb25zdGFudHMYBCADKAsyHy5sZWFuY29kZS5jb250cmFjdHMuQ29uc3RhbnRSZWZSCWNvbn'
    'N0YW50cw==');

@$core.Deprecated('Use statementDescriptor instead')
const Statement$json = {
  '1': 'Statement',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'comment', '3': 2, '4': 1, '5': 9, '10': 'comment'},
    {
      '1': 'attributes',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.leancode.contracts.AttributeRef',
      '10': 'attributes'
    },
    {
      '1': 'dto',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.Statement.DTO',
      '9': 0,
      '10': 'dto'
    },
    {
      '1': 'enum',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.Statement.Enum',
      '9': 0,
      '10': 'enum'
    },
    {
      '1': 'query',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.Statement.Query',
      '9': 0,
      '10': 'query'
    },
    {
      '1': 'command',
      '3': 13,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.Statement.Command',
      '9': 0,
      '10': 'command'
    },
    {
      '1': 'operation',
      '3': 14,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.Statement.Operation',
      '9': 0,
      '10': 'operation'
    },
    {
      '1': 'topic',
      '3': 15,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.Statement.Topic',
      '9': 0,
      '10': 'topic'
    },
  ],
  '3': [
    Statement_DTO$json,
    Statement_Enum$json,
    Statement_Query$json,
    Statement_Command$json,
    Statement_Operation$json,
    Statement_Topic$json
  ],
  '8': [
    {'1': 'content'},
  ],
};

@$core.Deprecated('Use statementDescriptor instead')
const Statement_DTO$json = {
  '1': 'DTO',
  '2': [
    {
      '1': 'typeDescriptor',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.TypeDescriptor',
      '10': 'typeDescriptor'
    },
  ],
};

@$core.Deprecated('Use statementDescriptor instead')
const Statement_Enum$json = {
  '1': 'Enum',
  '2': [
    {
      '1': 'members',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.leancode.contracts.EnumValue',
      '10': 'members'
    },
  ],
};

@$core.Deprecated('Use statementDescriptor instead')
const Statement_Query$json = {
  '1': 'Query',
  '2': [
    {
      '1': 'typeDescriptor',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.TypeDescriptor',
      '10': 'typeDescriptor'
    },
    {
      '1': 'returnType',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.TypeRef',
      '10': 'returnType'
    },
  ],
};

@$core.Deprecated('Use statementDescriptor instead')
const Statement_Command$json = {
  '1': 'Command',
  '2': [
    {
      '1': 'typeDescriptor',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.TypeDescriptor',
      '10': 'typeDescriptor'
    },
    {
      '1': 'errorCodes',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.leancode.contracts.ErrorCode',
      '10': 'errorCodes'
    },
  ],
};

@$core.Deprecated('Use statementDescriptor instead')
const Statement_Operation$json = {
  '1': 'Operation',
  '2': [
    {
      '1': 'typeDescriptor',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.TypeDescriptor',
      '10': 'typeDescriptor'
    },
    {
      '1': 'returnType',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.TypeRef',
      '10': 'returnType'
    },
  ],
};

@$core.Deprecated('Use statementDescriptor instead')
const Statement_Topic$json = {
  '1': 'Topic',
  '2': [
    {
      '1': 'typeDescriptor',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.TypeDescriptor',
      '10': 'typeDescriptor'
    },
    {
      '1': 'notifications',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.leancode.contracts.NotificationTypeRef',
      '10': 'notifications'
    },
  ],
};

/// Descriptor for `Statement`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List statementDescriptor = $convert.base64Decode(
    'CglTdGF0ZW1lbnQSEgoEbmFtZRgBIAEoCVIEbmFtZRIYCgdjb21tZW50GAIgASgJUgdjb21tZW'
    '50EkAKCmF0dHJpYnV0ZXMYAyADKAsyIC5sZWFuY29kZS5jb250cmFjdHMuQXR0cmlidXRlUmVm'
    'UgphdHRyaWJ1dGVzEjUKA2R0bxgKIAEoCzIhLmxlYW5jb2RlLmNvbnRyYWN0cy5TdGF0ZW1lbn'
    'QuRFRPSABSA2R0bxI4CgRlbnVtGAsgASgLMiIubGVhbmNvZGUuY29udHJhY3RzLlN0YXRlbWVu'
    'dC5FbnVtSABSBGVudW0SOwoFcXVlcnkYDCABKAsyIy5sZWFuY29kZS5jb250cmFjdHMuU3RhdG'
    'VtZW50LlF1ZXJ5SABSBXF1ZXJ5EkEKB2NvbW1hbmQYDSABKAsyJS5sZWFuY29kZS5jb250cmFj'
    'dHMuU3RhdGVtZW50LkNvbW1hbmRIAFIHY29tbWFuZBJHCglvcGVyYXRpb24YDiABKAsyJy5sZW'
    'FuY29kZS5jb250cmFjdHMuU3RhdGVtZW50Lk9wZXJhdGlvbkgAUglvcGVyYXRpb24SOwoFdG9w'
    'aWMYDyABKAsyIy5sZWFuY29kZS5jb250cmFjdHMuU3RhdGVtZW50LlRvcGljSABSBXRvcGljGl'
    'EKA0RUTxJKCg50eXBlRGVzY3JpcHRvchgBIAEoCzIiLmxlYW5jb2RlLmNvbnRyYWN0cy5UeXBl'
    'RGVzY3JpcHRvclIOdHlwZURlc2NyaXB0b3IaPwoERW51bRI3CgdtZW1iZXJzGAEgAygLMh0ubG'
    'VhbmNvZGUuY29udHJhY3RzLkVudW1WYWx1ZVIHbWVtYmVycxqQAQoFUXVlcnkSSgoOdHlwZURl'
    'c2NyaXB0b3IYASABKAsyIi5sZWFuY29kZS5jb250cmFjdHMuVHlwZURlc2NyaXB0b3JSDnR5cG'
    'VEZXNjcmlwdG9yEjsKCnJldHVyblR5cGUYAiABKAsyGy5sZWFuY29kZS5jb250cmFjdHMuVHlw'
    'ZVJlZlIKcmV0dXJuVHlwZRqUAQoHQ29tbWFuZBJKCg50eXBlRGVzY3JpcHRvchgBIAEoCzIiLm'
    'xlYW5jb2RlLmNvbnRyYWN0cy5UeXBlRGVzY3JpcHRvclIOdHlwZURlc2NyaXB0b3ISPQoKZXJy'
    'b3JDb2RlcxgCIAMoCzIdLmxlYW5jb2RlLmNvbnRyYWN0cy5FcnJvckNvZGVSCmVycm9yQ29kZX'
    'MalAEKCU9wZXJhdGlvbhJKCg50eXBlRGVzY3JpcHRvchgBIAEoCzIiLmxlYW5jb2RlLmNvbnRy'
    'YWN0cy5UeXBlRGVzY3JpcHRvclIOdHlwZURlc2NyaXB0b3ISOwoKcmV0dXJuVHlwZRgCIAEoCz'
    'IbLmxlYW5jb2RlLmNvbnRyYWN0cy5UeXBlUmVmUgpyZXR1cm5UeXBlGqIBCgVUb3BpYxJKCg50'
    'eXBlRGVzY3JpcHRvchgBIAEoCzIiLmxlYW5jb2RlLmNvbnRyYWN0cy5UeXBlRGVzY3JpcHRvcl'
    'IOdHlwZURlc2NyaXB0b3ISTQoNbm90aWZpY2F0aW9ucxgCIAMoCzInLmxlYW5jb2RlLmNvbnRy'
    'YWN0cy5Ob3RpZmljYXRpb25UeXBlUmVmUg1ub3RpZmljYXRpb25zQgkKB2NvbnRlbnQ=');

@$core.Deprecated('Use exportDescriptor instead')
const Export$json = {
  '1': 'Export',
  '2': [
    {'1': 'projectName', '3': 1, '4': 1, '5': 9, '10': 'projectName'},
    {
      '1': 'statements',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.leancode.contracts.Statement',
      '10': 'statements'
    },
    {
      '1': 'knownErrorGroups',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.leancode.contracts.ErrorCode.Group',
      '10': 'knownErrorGroups'
    },
  ],
};

/// Descriptor for `Export`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exportDescriptor = $convert.base64Decode(
    'CgZFeHBvcnQSIAoLcHJvamVjdE5hbWUYASABKAlSC3Byb2plY3ROYW1lEj0KCnN0YXRlbWVudH'
    'MYAiADKAsyHS5sZWFuY29kZS5jb250cmFjdHMuU3RhdGVtZW50UgpzdGF0ZW1lbnRzEk8KEGtu'
    'b3duRXJyb3JHcm91cHMYAyADKAsyIy5sZWFuY29kZS5jb250cmFjdHMuRXJyb3JDb2RlLkdyb3'
    'VwUhBrbm93bkVycm9yR3JvdXBz');
