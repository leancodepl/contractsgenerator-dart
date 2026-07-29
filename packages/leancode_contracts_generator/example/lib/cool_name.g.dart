// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cool_name.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Auth _$AuthFromJson(Map<String, dynamic> json) => Auth();

Map<String, dynamic> _$AuthToJson(Auth instance) => <String, dynamic>{};

KnownClaims _$KnownClaimsFromJson(Map<String, dynamic> json) => KnownClaims();

Map<String, dynamic> _$KnownClaimsToJson(KnownClaims instance) =>
    <String, dynamic>{};

Roles _$RolesFromJson(Map<String, dynamic> json) => Roles();

Map<String, dynamic> _$RolesToJson(Roles instance) => <String, dynamic>{};

PaginatedResult<TResult> _$PaginatedResultFromJson<TResult>(
  Map<String, dynamic> json,
  TResult Function(Object? json) fromJsonTResult,
) => PaginatedResult<TResult>(
  items: (json['Items'] as List<dynamic>).map(fromJsonTResult).toList(),
  totalCount: (json['TotalCount'] as num).toInt(),
);

Map<String, dynamic> _$PaginatedResultToJson<TResult>(
  PaginatedResult<TResult> instance,
  Object? Function(TResult value) toJsonTResult,
) => <String, dynamic>{
  'Items': instance.items.map(toJsonTResult).toList(),
  'TotalCount': instance.totalCount,
};

AllUsersResult _$AllUsersResultFromJson(Map<String, dynamic> json) =>
    AllUsersResult(
      items: (json['Items'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: (json['TotalCount'] as num).toInt(),
    );

Map<String, dynamic> _$AllUsersResultToJson(AllUsersResult instance) =>
    <String, dynamic>{
      'Items': instance.items,
      'TotalCount': instance.totalCount,
    };

ChildResult<T> _$ChildResultFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => ChildResult<T>(
  items: (json['Items'] as List<dynamic>).map(fromJsonT).toList(),
  totalCount: (json['TotalCount'] as num).toInt(),
  extras: (json['Extras'] as List<dynamic>).map(fromJsonT).toList(),
);

Map<String, dynamic> _$ChildResultToJson<T>(
  ChildResult<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'Items': instance.items.map(toJsonT).toList(),
  'TotalCount': instance.totalCount,
  'Extras': instance.extras.map(toJsonT).toList(),
};

ClashingArityFacets _$ClashingArityFacetsFromJson(Map<String, dynamic> json) =>
    ClashingArityFacets(
      first: User.fromJson(json['First'] as Map<String, dynamic>),
      left: PaginatedResult<User>.fromJson(
        json['Left'] as Map<String, dynamic>,
        (value) => User.fromJson(value as Map<String, dynamic>),
      ),
      right: User.fromJson(json['Right'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ClashingArityFacetsToJson(
  ClashingArityFacets instance,
) => <String, dynamic>{
  'First': instance.first,
  'Left': instance.left.toJson((value) => value),
  'Right': instance.right,
};

DifferentArityFacets _$DifferentArityFacetsFromJson(
  Map<String, dynamic> json,
) => DifferentArityFacets(
  first: User.fromJson(json['First'] as Map<String, dynamic>),
  left: User.fromJson(json['Left'] as Map<String, dynamic>),
  right: PaginatedResult<User>.fromJson(
    json['Right'] as Map<String, dynamic>,
    (value) => User.fromJson(value as Map<String, dynamic>),
  ),
);

Map<String, dynamic> _$DifferentArityFacetsToJson(
  DifferentArityFacets instance,
) => <String, dynamic>{
  'First': instance.first,
  'Left': instance.left,
  'Right': instance.right.toJson((value) => value),
};

FacetQueryCombined _$FacetQueryCombinedFromJson(Map<String, dynamic> json) =>
    FacetQueryCombined(
      facet: User.fromJson(json['Facet'] as Map<String, dynamic>),
      left: User.fromJson(json['Left'] as Map<String, dynamic>),
      right: PaginatedResult<User>.fromJson(
        json['Right'] as Map<String, dynamic>,
        (value) => User.fromJson(value as Map<String, dynamic>),
      ),
    );

Map<String, dynamic> _$FacetQueryCombinedToJson(FacetQueryCombined instance) =>
    <String, dynamic>{
      'Facet': instance.facet,
      'Left': instance.left,
      'Right': instance.right.toJson((value) => value),
    };

FacetQueryUser _$FacetQueryUserFromJson(Map<String, dynamic> json) =>
    FacetQueryUser(facet: User.fromJson(json['Facet'] as Map<String, dynamic>));

Map<String, dynamic> _$FacetQueryUserToJson(FacetQueryUser instance) =>
    <String, dynamic>{'Facet': instance.facet};

ForwardedAtSecondPosition<T> _$ForwardedAtSecondPositionFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => ForwardedAtSecondPosition<T>(
  first: fromJsonT(json['First']),
  left: User.fromJson(json['Left'] as Map<String, dynamic>),
  right: fromJsonT(json['Right']),
);

Map<String, dynamic> _$ForwardedAtSecondPositionToJson<T>(
  ForwardedAtSecondPosition<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'First': toJsonT(instance.first),
  'Left': instance.left,
  'Right': toJsonT(instance.right),
};

ForwardedVarWithConcreteClash<T> _$ForwardedVarWithConcreteClashFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => ForwardedVarWithConcreteClash<T>(
  first: fromJsonT(json['First']),
  second: User.fromJson(json['Second'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ForwardedVarWithConcreteClashToJson<T>(
  ForwardedVarWithConcreteClash<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'First': toJsonT(instance.first),
  'Second': instance.second,
};

IFacetQuery<TFacet> _$IFacetQueryFromJson<TFacet>(
  Map<String, dynamic> json,
  TFacet Function(Object? json) fromJsonTFacet,
) => IFacetQuery<TFacet>(facet: fromJsonTFacet(json['Facet']));

Map<String, dynamic> _$IFacetQueryToJson<TFacet>(
  IFacetQuery<TFacet> instance,
  Object? Function(TFacet value) toJsonTFacet,
) => <String, dynamic>{'Facet': toJsonTFacet(instance.facet)};

IFirstFacet<TFirst> _$IFirstFacetFromJson<TFirst>(
  Map<String, dynamic> json,
  TFirst Function(Object? json) fromJsonTFirst,
) => IFirstFacet<TFirst>(first: fromJsonTFirst(json['First']));

Map<String, dynamic> _$IFirstFacetToJson<TFirst>(
  IFirstFacet<TFirst> instance,
  Object? Function(TFirst value) toJsonTFirst,
) => <String, dynamic>{'First': toJsonTFirst(instance.first)};

IPairFacet<TLeft, TRight> _$IPairFacetFromJson<TLeft, TRight>(
  Map<String, dynamic> json,
  TLeft Function(Object? json) fromJsonTLeft,
  TRight Function(Object? json) fromJsonTRight,
) => IPairFacet<TLeft, TRight>(
  left: fromJsonTLeft(json['Left']),
  right: fromJsonTRight(json['Right']),
);

Map<String, dynamic> _$IPairFacetToJson<TLeft, TRight>(
  IPairFacet<TLeft, TRight> instance,
  Object? Function(TLeft value) toJsonTLeft,
  Object? Function(TRight value) toJsonTRight,
) => <String, dynamic>{
  'Left': toJsonTLeft(instance.left),
  'Right': toJsonTRight(instance.right),
};

ISecondFacet<TSecond> _$ISecondFacetFromJson<TSecond>(
  Map<String, dynamic> json,
  TSecond Function(Object? json) fromJsonTSecond,
) => ISecondFacet<TSecond>(second: fromJsonTSecond(json['Second']));

Map<String, dynamic> _$ISecondFacetToJson<TSecond>(
  ISecondFacet<TSecond> instance,
  Object? Function(TSecond value) toJsonTSecond,
) => <String, dynamic>{'Second': toJsonTSecond(instance.second)};

MixedFacets _$MixedFacetsFromJson(Map<String, dynamic> json) => MixedFacets(
  first: User.fromJson(json['First'] as Map<String, dynamic>),
  second: PaginatedResult<User>.fromJson(
    json['Second'] as Map<String, dynamic>,
    (value) => User.fromJson(value as Map<String, dynamic>),
  ),
);

Map<String, dynamic> _$MixedFacetsToJson(MixedFacets instance) =>
    <String, dynamic>{
      'First': instance.first,
      'Second': instance.second.toJson((value) => value),
    };

SameFacets _$SameFacetsFromJson(Map<String, dynamic> json) => SameFacets(
  first: User.fromJson(json['First'] as Map<String, dynamic>),
  second: User.fromJson(json['Second'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SameFacetsToJson(SameFacets instance) =>
    <String, dynamic>{'First': instance.first, 'Second': instance.second};

SearchResponse _$SearchResponseFromJson(Map<String, dynamic> json) =>
    SearchResponse(
      page: PaginatedResult<User>.fromJson(
        json['Page'] as Map<String, dynamic>,
        (value) => User.fromJson(value as Map<String, dynamic>),
      ),
      allUsers: AllUsersResult.fromJson(
        json['AllUsers'] as Map<String, dynamic>,
      ),
      children: ChildResult<User>.fromJson(
        json['Children'] as Map<String, dynamic>,
        (value) => User.fromJson(value as Map<String, dynamic>),
      ),
    );

Map<String, dynamic> _$SearchResponseToJson(SearchResponse instance) =>
    <String, dynamic>{
      'Page': instance.page.toJson((value) => value),
      'AllUsers': instance.allUsers,
      'Children': instance.children,
    };

TwoForwardedVars<A, B> _$TwoForwardedVarsFromJson<A, B>(
  Map<String, dynamic> json,
  A Function(Object? json) fromJsonA,
  B Function(Object? json) fromJsonB,
) => TwoForwardedVars<A, B>(
  first: fromJsonA(json['First']),
  second: fromJsonB(json['Second']),
);

Map<String, dynamic> _$TwoForwardedVarsToJson<A, B>(
  TwoForwardedVars<A, B> instance,
  Object? Function(A value) toJsonA,
  Object? Function(B value) toJsonB,
) => <String, dynamic>{
  'First': toJsonA(instance.first),
  'Second': toJsonB(instance.second),
};

User _$UserFromJson(Map<String, dynamic> json) =>
    User(id: json['Id'] as String, name: json['Name'] as String);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'Id': instance.id,
  'Name': instance.name,
};

VarBoundTwice<T> _$VarBoundTwiceFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => VarBoundTwice<T>(
  left: fromJsonT(json['Left']),
  right: fromJsonT(json['Right']),
);

Map<String, dynamic> _$VarBoundTwiceToJson<T>(
  VarBoundTwice<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'Left': toJsonT(instance.left),
  'Right': toJsonT(instance.right),
};

ISomethingRelated _$ISomethingRelatedFromJson(Map<String, dynamic> json) =>
    ISomethingRelated(somethingId: json['SomethingId'] as String);

Map<String, dynamic> _$ISomethingRelatedToJson(ISomethingRelated instance) =>
    <String, dynamic>{'SomethingId': instance.somethingId};

WhenHasSomethingAccess _$WhenHasSomethingAccessFromJson(
  Map<String, dynamic> json,
) => WhenHasSomethingAccess();

Map<String, dynamic> _$WhenHasSomethingAccessToJson(
  WhenHasSomethingAccess instance,
) => <String, dynamic>{};

AllUsers _$AllUsersFromJson(Map<String, dynamic> json) => AllUsers(
  pageNumber: (json['PageNumber'] as num).toInt(),
  pageSize: (json['PageSize'] as num).toInt(),
);

Map<String, dynamic> _$AllUsersToJson(AllUsers instance) => <String, dynamic>{
  'PageNumber': instance.pageNumber,
  'PageSize': instance.pageSize,
};

EditUser _$EditUserFromJson(Map<String, dynamic> json) => EditUser(
  somethingId: json['SomethingId'] as String,
  userId: json['UserId'] as String,
  list: (json['List'] as List<dynamic>).map((e) => (e as num).toInt()).toList(),
  array: (json['Array'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
  dictionary: (json['Dictionary'] as Map<String, dynamic>).map(
    (k, e) =>
        MapEntry(int.parse(k), EditUser.fromJson(e as Map<String, dynamic>)),
  ),
  userInfo: UserInfoDTO.fromJson(json['UserInfo'] as Map<String, dynamic>),
);

Map<String, dynamic> _$EditUserToJson(EditUser instance) => <String, dynamic>{
  'SomethingId': instance.somethingId,
  'UserId': instance.userId,
  'List': instance.list,
  'Array': instance.array,
  'Dictionary': instance.dictionary.map((k, e) => MapEntry(k.toString(), e)),
  'UserInfo': instance.userInfo,
};

UserById _$UserByIdFromJson(Map<String, dynamic> json) => UserById();

Map<String, dynamic> _$UserByIdToJson(UserById instance) => <String, dynamic>{};

UserInfoDTO _$UserInfoDTOFromJson(Map<String, dynamic> json) => UserInfoDTO(
  firstname: json['Firstname'] as String,
  surname: json['Surname'] as String,
  username: json['Username'] as String,
  emailAddress: json['EmailAddress'] as String,
);

Map<String, dynamic> _$UserInfoDTOToJson(UserInfoDTO instance) =>
    <String, dynamic>{
      'Firstname': instance.firstname,
      'Surname': instance.surname,
      'Username': instance.username,
      'EmailAddress': instance.emailAddress,
    };

UserSomething _$UserSomethingFromJson(Map<String, dynamic> json) =>
    UserSomething();

Map<String, dynamic> _$UserSomethingToJson(UserSomething instance) =>
    <String, dynamic>{};
