///
//  Generated code. Do not modify.
//  source: contracts.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use knownTypeDescriptor instead')
const KnownType$json = const {
  '1': 'KnownType',
  '2': const [
    const {'1': 'Object', '2': 0},
    const {'1': 'String', '2': 1},
    const {'1': 'Guid', '2': 3},
    const {'1': 'Uri', '2': 4},
    const {'1': 'Boolean', '2': 5},
    const {'1': 'UInt8', '2': 100},
    const {'1': 'Int8', '2': 101},
    const {'1': 'Int16', '2': 102},
    const {'1': 'UInt16', '2': 103},
    const {'1': 'Int32', '2': 104},
    const {'1': 'UInt32', '2': 105},
    const {'1': 'Int64', '2': 106},
    const {'1': 'UInt64', '2': 107},
    const {'1': 'Float', '2': 150},
    const {'1': 'Double', '2': 151},
    const {'1': 'Decimal', '2': 152},
    const {'1': 'Date', '2': 200},
    const {'1': 'Time', '2': 201},
    const {'1': 'DateTime', '2': 202},
    const {'1': 'DateTimeOffset', '2': 203},
    const {'1': 'TimeSpan', '2': 204},
    const {'1': 'Array', '2': 300},
    const {'1': 'Map', '2': 301},
    const {'1': 'Query', '2': 1000},
    const {'1': 'Command', '2': 1001},
    const {'1': 'AuthorizeWhenAttribute', '2': 1002},
    const {'1': 'AuthorizeWhenHasAnyOfAttribute', '2': 1003},
    const {'1': 'QueryCacheAttribute', '2': 1004},
    const {'1': 'Attribute', '2': 1005},
  ],
};

/// Descriptor for `KnownType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List knownTypeDescriptor = $convert.base64Decode(
    'CglLbm93blR5cGUSCgoGT2JqZWN0EAASCgoGU3RyaW5nEAESCAoER3VpZBADEgcKA1VyaRAEEgsKB0Jvb2xlYW4QBRIJCgVVSW50OBBkEggKBEludDgQZRIJCgVJbnQxNhBmEgoKBlVJbnQxNhBnEgkKBUludDMyEGgSCgoGVUludDMyEGkSCQoFSW50NjQQahIKCgZVSW50NjQQaxIKCgVGbG9hdBCWARILCgZEb3VibGUQlwESDAoHRGVjaW1hbBCYARIJCgREYXRlEMgBEgkKBFRpbWUQyQESDQoIRGF0ZVRpbWUQygESEwoORGF0ZVRpbWVPZmZzZXQQywESDQoIVGltZVNwYW4QzAESCgoFQXJyYXkQrAISCAoDTWFwEK0CEgoKBVF1ZXJ5EOgHEgwKB0NvbW1hbmQQ6QcSGwoWQXV0aG9yaXplV2hlbkF0dHJpYnV0ZRDqBxIjCh5BdXRob3JpemVXaGVuSGFzQW55T2ZBdHRyaWJ1dGUQ6wcSGAoTUXVlcnlDYWNoZUF0dHJpYnV0ZRDsBxIOCglBdHRyaWJ1dGUQ7Qc=');
@$core.Deprecated('Use valueRefDescriptor instead')
const ValueRef$json = const {
  '1': 'ValueRef',
  '2': const [
    const {
      '1': 'null',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.ValueRef.Null',
      '9': 0,
      '10': 'null'
    },
    const {
      '1': 'number',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.ValueRef.Number',
      '9': 0,
      '10': 'number'
    },
    const {
      '1': 'floatingPoint',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.ValueRef.FloatingPointNumber',
      '9': 0,
      '10': 'floatingPoint'
    },
    const {
      '1': 'string',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.ValueRef.String',
      '9': 0,
      '10': 'string'
    },
    const {
      '1': 'bool',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.ValueRef.Boolean',
      '9': 0,
      '10': 'bool'
    },
  ],
  '3': const [
    ValueRef_Null$json,
    ValueRef_Number$json,
    ValueRef_FloatingPointNumber$json,
    ValueRef_String$json,
    ValueRef_Boolean$json
  ],
  '8': const [
    const {'1': 'value'},
  ],
};

@$core.Deprecated('Use valueRefDescriptor instead')
const ValueRef_Null$json = const {
  '1': 'Null',
};

@$core.Deprecated('Use valueRefDescriptor instead')
const ValueRef_Number$json = const {
  '1': 'Number',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 3, '10': 'value'},
  ],
};

@$core.Deprecated('Use valueRefDescriptor instead')
const ValueRef_FloatingPointNumber$json = const {
  '1': 'FloatingPointNumber',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 1, '10': 'value'},
  ],
};

@$core.Deprecated('Use valueRefDescriptor instead')
const ValueRef_String$json = const {
  '1': 'String',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 9, '10': 'value'},
  ],
};

@$core.Deprecated('Use valueRefDescriptor instead')
const ValueRef_Boolean$json = const {
  '1': 'Boolean',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 8, '10': 'value'},
  ],
};

/// Descriptor for `ValueRef`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List valueRefDescriptor = $convert.base64Decode(
    'CghWYWx1ZVJlZhI3CgRudWxsGAEgASgLMiEubGVhbmNvZGUuY29udHJhY3RzLlZhbHVlUmVmLk51bGxIAFIEbnVsbBI9CgZudW1iZXIYAiABKAsyIy5sZWFuY29kZS5jb250cmFjdHMuVmFsdWVSZWYuTnVtYmVySABSBm51bWJlchJYCg1mbG9hdGluZ1BvaW50GAMgASgLMjAubGVhbmNvZGUuY29udHJhY3RzLlZhbHVlUmVmLkZsb2F0aW5nUG9pbnROdW1iZXJIAFINZmxvYXRpbmdQb2ludBI9CgZzdHJpbmcYBCABKAsyIy5sZWFuY29kZS5jb250cmFjdHMuVmFsdWVSZWYuU3RyaW5nSABSBnN0cmluZxI6CgRib29sGAUgASgLMiQubGVhbmNvZGUuY29udHJhY3RzLlZhbHVlUmVmLkJvb2xlYW5IAFIEYm9vbBoGCgROdWxsGh4KBk51bWJlchIUCgV2YWx1ZRgBIAEoA1IFdmFsdWUaKwoTRmxvYXRpbmdQb2ludE51bWJlchIUCgV2YWx1ZRgBIAEoAVIFdmFsdWUaHgoGU3RyaW5nEhQKBXZhbHVlGAEgASgJUgV2YWx1ZRofCgdCb29sZWFuEhQKBXZhbHVlGAEgASgIUgV2YWx1ZUIHCgV2YWx1ZQ==');
@$core.Deprecated('Use typeRefDescriptor instead')
const TypeRef$json = const {
  '1': 'TypeRef',
  '2': const [
    const {'1': 'nullable', '3': 1, '4': 1, '5': 8, '10': 'nullable'},
    const {
      '1': 'generic',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.TypeRef.Generic',
      '9': 0,
      '10': 'generic'
    },
    const {
      '1': 'internal',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.TypeRef.Internal',
      '9': 0,
      '10': 'internal'
    },
    const {
      '1': 'known',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.TypeRef.Known',
      '9': 0,
      '10': 'known'
    },
  ],
  '3': const [TypeRef_Generic$json, TypeRef_Internal$json, TypeRef_Known$json],
  '8': const [
    const {'1': 'type'},
  ],
};

@$core.Deprecated('Use typeRefDescriptor instead')
const TypeRef_Generic$json = const {
  '1': 'Generic',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

@$core.Deprecated('Use typeRefDescriptor instead')
const TypeRef_Internal$json = const {
  '1': 'Internal',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {
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
const TypeRef_Known$json = const {
  '1': 'Known',
  '2': const [
    const {
      '1': 'type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.leancode.contracts.KnownType',
      '10': 'type'
    },
    const {
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
    'CgdUeXBlUmVmEhoKCG51bGxhYmxlGAEgASgIUghudWxsYWJsZRI/CgdnZW5lcmljGAIgASgLMiMubGVhbmNvZGUuY29udHJhY3RzLlR5cGVSZWYuR2VuZXJpY0gAUgdnZW5lcmljEkIKCGludGVybmFsGAMgASgLMiQubGVhbmNvZGUuY29udHJhY3RzLlR5cGVSZWYuSW50ZXJuYWxIAFIIaW50ZXJuYWwSOQoFa25vd24YBCABKAsyIS5sZWFuY29kZS5jb250cmFjdHMuVHlwZVJlZi5Lbm93bkgAUgVrbm93bhodCgdHZW5lcmljEhIKBG5hbWUYASABKAlSBG5hbWUaWQoISW50ZXJuYWwSEgoEbmFtZRgBIAEoCVIEbmFtZRI5Cglhcmd1bWVudHMYAiADKAsyGy5sZWFuY29kZS5jb250cmFjdHMuVHlwZVJlZlIJYXJndW1lbnRzGnUKBUtub3duEjEKBHR5cGUYASABKA4yHS5sZWFuY29kZS5jb250cmFjdHMuS25vd25UeXBlUgR0eXBlEjkKCWFyZ3VtZW50cxgCIAMoCzIbLmxlYW5jb2RlLmNvbnRyYWN0cy5UeXBlUmVmUglhcmd1bWVudHNCBgoEdHlwZQ==');
@$core.Deprecated('Use genericParameterDescriptor instead')
const GenericParameter$json = const {
  '1': 'GenericParameter',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `GenericParameter`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List genericParameterDescriptor = $convert
    .base64Decode('ChBHZW5lcmljUGFyYW1ldGVyEhIKBG5hbWUYASABKAlSBG5hbWU=');
@$core.Deprecated('Use attributeArgumentDescriptor instead')
const AttributeArgument$json = const {
  '1': 'AttributeArgument',
  '2': const [
    const {
      '1': 'positional',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.AttributeArgument.Positional',
      '9': 0,
      '10': 'positional'
    },
    const {
      '1': 'named',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.AttributeArgument.Named',
      '9': 0,
      '10': 'named'
    },
  ],
  '3': const [AttributeArgument_Positional$json, AttributeArgument_Named$json],
  '8': const [
    const {'1': 'attribute'},
  ],
};

@$core.Deprecated('Use attributeArgumentDescriptor instead')
const AttributeArgument_Positional$json = const {
  '1': 'Positional',
  '2': const [
    const {'1': 'position', '3': 1, '4': 1, '5': 5, '10': 'position'},
    const {
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
const AttributeArgument_Named$json = const {
  '1': 'Named',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {
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
    'ChFBdHRyaWJ1dGVBcmd1bWVudBJSCgpwb3NpdGlvbmFsGAEgASgLMjAubGVhbmNvZGUuY29udHJhY3RzLkF0dHJpYnV0ZUFyZ3VtZW50LlBvc2l0aW9uYWxIAFIKcG9zaXRpb25hbBJDCgVuYW1lZBgCIAEoCzIrLmxlYW5jb2RlLmNvbnRyYWN0cy5BdHRyaWJ1dGVBcmd1bWVudC5OYW1lZEgAUgVuYW1lZBpcCgpQb3NpdGlvbmFsEhoKCHBvc2l0aW9uGAEgASgFUghwb3NpdGlvbhIyCgV2YWx1ZRgCIAEoCzIcLmxlYW5jb2RlLmNvbnRyYWN0cy5WYWx1ZVJlZlIFdmFsdWUaTwoFTmFtZWQSEgoEbmFtZRgBIAEoCVIEbmFtZRIyCgV2YWx1ZRgCIAEoCzIcLmxlYW5jb2RlLmNvbnRyYWN0cy5WYWx1ZVJlZlIFdmFsdWVCCwoJYXR0cmlidXRl');
@$core.Deprecated('Use attributeRefDescriptor instead')
const AttributeRef$json = const {
  '1': 'AttributeRef',
  '2': const [
    const {'1': 'attributeName', '3': 1, '4': 1, '5': 9, '10': 'attributeName'},
    const {
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
    'CgxBdHRyaWJ1dGVSZWYSJAoNYXR0cmlidXRlTmFtZRgBIAEoCVINYXR0cmlidXRlTmFtZRJBCghhcmd1bWVudBgCIAMoCzIlLmxlYW5jb2RlLmNvbnRyYWN0cy5BdHRyaWJ1dGVBcmd1bWVudFIIYXJndW1lbnQ=');
@$core.Deprecated('Use propertyRefDescriptor instead')
const PropertyRef$json = const {
  '1': 'PropertyRef',
  '2': const [
    const {
      '1': 'type',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.TypeRef',
      '10': 'type'
    },
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {
      '1': 'attributes',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.leancode.contracts.AttributeRef',
      '10': 'attributes'
    },
    const {'1': 'comment', '3': 4, '4': 1, '5': 9, '10': 'comment'},
  ],
};

/// Descriptor for `PropertyRef`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List propertyRefDescriptor = $convert.base64Decode(
    'CgtQcm9wZXJ0eVJlZhIvCgR0eXBlGAEgASgLMhsubGVhbmNvZGUuY29udHJhY3RzLlR5cGVSZWZSBHR5cGUSEgoEbmFtZRgCIAEoCVIEbmFtZRJACgphdHRyaWJ1dGVzGAMgAygLMiAubGVhbmNvZGUuY29udHJhY3RzLkF0dHJpYnV0ZVJlZlIKYXR0cmlidXRlcxIYCgdjb21tZW50GAQgASgJUgdjb21tZW50');
@$core.Deprecated('Use constantRefDescriptor instead')
const ConstantRef$json = const {
  '1': 'ConstantRef',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.ValueRef',
      '10': 'value'
    },
    const {'1': 'comment', '3': 3, '4': 1, '5': 9, '10': 'comment'},
  ],
};

/// Descriptor for `ConstantRef`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List constantRefDescriptor = $convert.base64Decode(
    'CgtDb25zdGFudFJlZhISCgRuYW1lGAEgASgJUgRuYW1lEjIKBXZhbHVlGAIgASgLMhwubGVhbmNvZGUuY29udHJhY3RzLlZhbHVlUmVmUgV2YWx1ZRIYCgdjb21tZW50GAMgASgJUgdjb21tZW50');
@$core.Deprecated('Use enumValueDescriptor instead')
const EnumValue$json = const {
  '1': 'EnumValue',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'value', '3': 2, '4': 1, '5': 3, '10': 'value'},
    const {'1': 'comment', '3': 3, '4': 1, '5': 9, '10': 'comment'},
  ],
};

/// Descriptor for `EnumValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List enumValueDescriptor = $convert.base64Decode(
    'CglFbnVtVmFsdWUSEgoEbmFtZRgBIAEoCVIEbmFtZRIUCgV2YWx1ZRgCIAEoA1IFdmFsdWUSGAoHY29tbWVudBgDIAEoCVIHY29tbWVudA==');
@$core.Deprecated('Use errorCodeDescriptor instead')
const ErrorCode$json = const {
  '1': 'ErrorCode',
  '2': const [
    const {
      '1': 'single',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.ErrorCode.Single',
      '9': 0,
      '10': 'single'
    },
    const {
      '1': 'group',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.ErrorCode.Group',
      '9': 0,
      '10': 'group'
    },
  ],
  '3': const [ErrorCode_Single$json, ErrorCode_Group$json],
  '8': const [
    const {'1': 'code'},
  ],
};

@$core.Deprecated('Use errorCodeDescriptor instead')
const ErrorCode_Single$json = const {
  '1': 'Single',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'code', '3': 2, '4': 1, '5': 5, '10': 'code'},
  ],
};

@$core.Deprecated('Use errorCodeDescriptor instead')
const ErrorCode_Group$json = const {
  '1': 'Group',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'groupId', '3': 2, '4': 1, '5': 9, '10': 'groupId'},
    const {
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
    'CglFcnJvckNvZGUSPgoGc2luZ2xlGAEgASgLMiQubGVhbmNvZGUuY29udHJhY3RzLkVycm9yQ29kZS5TaW5nbGVIAFIGc2luZ2xlEjsKBWdyb3VwGAIgASgLMiMubGVhbmNvZGUuY29udHJhY3RzLkVycm9yQ29kZS5Hcm91cEgAUgVncm91cBowCgZTaW5nbGUSEgoEbmFtZRgBIAEoCVIEbmFtZRISCgRjb2RlGAIgASgFUgRjb2RlGnQKBUdyb3VwEhIKBG5hbWUYASABKAlSBG5hbWUSGAoHZ3JvdXBJZBgCIAEoCVIHZ3JvdXBJZBI9Cgppbm5lckNvZGVzGAMgAygLMh0ubGVhbmNvZGUuY29udHJhY3RzLkVycm9yQ29kZVIKaW5uZXJDb2Rlc0IGCgRjb2Rl');
@$core.Deprecated('Use typeDescriptorDescriptor instead')
const TypeDescriptor$json = const {
  '1': 'TypeDescriptor',
  '2': const [
    const {
      '1': 'extends',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.leancode.contracts.TypeRef',
      '10': 'extends'
    },
    const {
      '1': 'genericParameters',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.leancode.contracts.GenericParameter',
      '10': 'genericParameters'
    },
    const {
      '1': 'properties',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.leancode.contracts.PropertyRef',
      '10': 'properties'
    },
    const {
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
    'Cg5UeXBlRGVzY3JpcHRvchI1CgdleHRlbmRzGAEgAygLMhsubGVhbmNvZGUuY29udHJhY3RzLlR5cGVSZWZSB2V4dGVuZHMSUgoRZ2VuZXJpY1BhcmFtZXRlcnMYAiADKAsyJC5sZWFuY29kZS5jb250cmFjdHMuR2VuZXJpY1BhcmFtZXRlclIRZ2VuZXJpY1BhcmFtZXRlcnMSPwoKcHJvcGVydGllcxgDIAMoCzIfLmxlYW5jb2RlLmNvbnRyYWN0cy5Qcm9wZXJ0eVJlZlIKcHJvcGVydGllcxI9Cgljb25zdGFudHMYBCADKAsyHy5sZWFuY29kZS5jb250cmFjdHMuQ29uc3RhbnRSZWZSCWNvbnN0YW50cw==');
@$core.Deprecated('Use statementDescriptor instead')
const Statement$json = const {
  '1': 'Statement',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'comment', '3': 2, '4': 1, '5': 9, '10': 'comment'},
    const {
      '1': 'attributes',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.leancode.contracts.AttributeRef',
      '10': 'attributes'
    },
    const {
      '1': 'dto',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.Statement.DTO',
      '9': 0,
      '10': 'dto'
    },
    const {
      '1': 'enum',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.Statement.Enum',
      '9': 0,
      '10': 'enum'
    },
    const {
      '1': 'query',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.Statement.Query',
      '9': 0,
      '10': 'query'
    },
    const {
      '1': 'command',
      '3': 13,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.Statement.Command',
      '9': 0,
      '10': 'command'
    },
  ],
  '3': const [
    Statement_DTO$json,
    Statement_Enum$json,
    Statement_Query$json,
    Statement_Command$json
  ],
  '8': const [
    const {'1': 'content'},
  ],
};

@$core.Deprecated('Use statementDescriptor instead')
const Statement_DTO$json = const {
  '1': 'DTO',
  '2': const [
    const {
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
const Statement_Enum$json = const {
  '1': 'Enum',
  '2': const [
    const {
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
const Statement_Query$json = const {
  '1': 'Query',
  '2': const [
    const {
      '1': 'typeDescriptor',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.TypeDescriptor',
      '10': 'typeDescriptor'
    },
    const {
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
const Statement_Command$json = const {
  '1': 'Command',
  '2': const [
    const {
      '1': 'typeDescriptor',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.leancode.contracts.TypeDescriptor',
      '10': 'typeDescriptor'
    },
    const {
      '1': 'errorCodes',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.leancode.contracts.ErrorCode',
      '10': 'errorCodes'
    },
  ],
};

/// Descriptor for `Statement`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List statementDescriptor = $convert.base64Decode(
    'CglTdGF0ZW1lbnQSEgoEbmFtZRgBIAEoCVIEbmFtZRIYCgdjb21tZW50GAIgASgJUgdjb21tZW50EkAKCmF0dHJpYnV0ZXMYAyADKAsyIC5sZWFuY29kZS5jb250cmFjdHMuQXR0cmlidXRlUmVmUgphdHRyaWJ1dGVzEjUKA2R0bxgKIAEoCzIhLmxlYW5jb2RlLmNvbnRyYWN0cy5TdGF0ZW1lbnQuRFRPSABSA2R0bxI4CgRlbnVtGAsgASgLMiIubGVhbmNvZGUuY29udHJhY3RzLlN0YXRlbWVudC5FbnVtSABSBGVudW0SOwoFcXVlcnkYDCABKAsyIy5sZWFuY29kZS5jb250cmFjdHMuU3RhdGVtZW50LlF1ZXJ5SABSBXF1ZXJ5EkEKB2NvbW1hbmQYDSABKAsyJS5sZWFuY29kZS5jb250cmFjdHMuU3RhdGVtZW50LkNvbW1hbmRIAFIHY29tbWFuZBpRCgNEVE8SSgoOdHlwZURlc2NyaXB0b3IYASABKAsyIi5sZWFuY29kZS5jb250cmFjdHMuVHlwZURlc2NyaXB0b3JSDnR5cGVEZXNjcmlwdG9yGj8KBEVudW0SNwoHbWVtYmVycxgBIAMoCzIdLmxlYW5jb2RlLmNvbnRyYWN0cy5FbnVtVmFsdWVSB21lbWJlcnMakAEKBVF1ZXJ5EkoKDnR5cGVEZXNjcmlwdG9yGAEgASgLMiIubGVhbmNvZGUuY29udHJhY3RzLlR5cGVEZXNjcmlwdG9yUg50eXBlRGVzY3JpcHRvchI7CgpyZXR1cm5UeXBlGAIgASgLMhsubGVhbmNvZGUuY29udHJhY3RzLlR5cGVSZWZSCnJldHVyblR5cGUalAEKB0NvbW1hbmQSSgoOdHlwZURlc2NyaXB0b3IYASABKAsyIi5sZWFuY29kZS5jb250cmFjdHMuVHlwZURlc2NyaXB0b3JSDnR5cGVEZXNjcmlwdG9yEj0KCmVycm9yQ29kZXMYAiADKAsyHS5sZWFuY29kZS5jb250cmFjdHMuRXJyb3JDb2RlUgplcnJvckNvZGVzQgkKB2NvbnRlbnQ=');
@$core.Deprecated('Use exportDescriptor instead')
const Export$json = const {
  '1': 'Export',
  '2': const [
    const {'1': 'projectName', '3': 1, '4': 1, '5': 9, '10': 'projectName'},
    const {
      '1': 'statements',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.leancode.contracts.Statement',
      '10': 'statements'
    },
    const {
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
    'CgZFeHBvcnQSIAoLcHJvamVjdE5hbWUYASABKAlSC3Byb2plY3ROYW1lEj0KCnN0YXRlbWVudHMYAiADKAsyHS5sZWFuY29kZS5jb250cmFjdHMuU3RhdGVtZW50UgpzdGF0ZW1lbnRzEk8KEGtub3duRXJyb3JHcm91cHMYAyADKAsyIy5sZWFuY29kZS5jb250cmFjdHMuRXJyb3JDb2RlLkdyb3VwUhBrbm93bkVycm9yR3JvdXBz');
