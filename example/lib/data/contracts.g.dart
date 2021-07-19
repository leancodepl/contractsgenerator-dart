// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contracts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Auth _$AuthFromJson(Map<String, dynamic> json) {
  return Auth();
}

Map<String, dynamic> _$AuthToJson(Auth instance) => <String, dynamic>{};

KnownClaims _$KnownClaimsFromJson(Map<String, dynamic> json) {
  return KnownClaims();
}

Map<String, dynamic> _$KnownClaimsToJson(KnownClaims instance) =>
    <String, dynamic>{};

Roles _$RolesFromJson(Map<String, dynamic> json) {
  return Roles();
}

Map<String, dynamic> _$RolesToJson(Roles instance) => <String, dynamic>{};

PaginatedResult<TResult> _$PaginatedResultFromJson<TResult>(
  Map<String, dynamic> json,
  TResult Function(Object? json) fromJsonTResult,
) {
  return PaginatedResult<TResult>(
    items: (json['Items'] as List<dynamic>).map(fromJsonTResult).toList(),
    totalCount: json['TotalCount'] as int,
  );
}

Map<String, dynamic> _$PaginatedResultToJson<TResult>(
  PaginatedResult<TResult> instance,
  Object? Function(TResult value) toJsonTResult,
) =>
    <String, dynamic>{
      'Items': instance.items.map(toJsonTResult).toList(),
      'TotalCount': instance.totalCount,
    };

ISomethingRelated _$ISomethingRelatedFromJson(Map<String, dynamic> json) {
  return ISomethingRelated(
    somethingId: json['SomethingId'] as String,
  );
}

Map<String, dynamic> _$ISomethingRelatedToJson(ISomethingRelated instance) =>
    <String, dynamic>{
      'SomethingId': instance.somethingId,
    };

WhenHasSomethingAccess _$WhenHasSomethingAccessFromJson(
    Map<String, dynamic> json) {
  return WhenHasSomethingAccess();
}

Map<String, dynamic> _$WhenHasSomethingAccessToJson(
        WhenHasSomethingAccess instance) =>
    <String, dynamic>{};

EditUser _$EditUserFromJson(Map<String, dynamic> json) {
  return EditUser(
    userId: json['UserId'] as String,
    somethingId: json['SomethingId'] as String,
    list: (json['List'] as List<dynamic>).map((e) => e as int).toList(),
    array: (json['Array'] as List<dynamic>).map((e) => e as int).toList(),
    dictionary: (json['Dictionary'] as Map<String, dynamic>).map(
      (k, e) =>
          MapEntry(int.parse(k), EditUser.fromJson(e as Map<String, dynamic>)),
    ),
    userInfo: UserInfoDTO.fromJson(json['UserInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EditUserToJson(EditUser instance) => <String, dynamic>{
      'UserId': instance.userId,
      'SomethingId': instance.somethingId,
      'List': instance.list,
      'Array': instance.array,
      'Dictionary':
          instance.dictionary.map((k, e) => MapEntry(k.toString(), e)),
      'UserInfo': instance.userInfo,
    };

UserById _$UserByIdFromJson(Map<String, dynamic> json) {
  return UserById();
}

Map<String, dynamic> _$UserByIdToJson(UserById instance) => <String, dynamic>{};

UserInfoDTO _$UserInfoDTOFromJson(Map<String, dynamic> json) {
  return UserInfoDTO(
    firstname: json['Firstname'] as String,
    surname: json['Surname'] as String,
    username: json['Username'] as String,
    emailAddress: json['EmailAddress'] as String,
  );
}

Map<String, dynamic> _$UserInfoDTOToJson(UserInfoDTO instance) =>
    <String, dynamic>{
      'Firstname': instance.firstname,
      'Surname': instance.surname,
      'Username': instance.username,
      'EmailAddress': instance.emailAddress,
    };

UserSomething _$UserSomethingFromJson(Map<String, dynamic> json) {
  return UserSomething();
}

Map<String, dynamic> _$UserSomethingToJson(UserSomething instance) =>
    <String, dynamic>{};
