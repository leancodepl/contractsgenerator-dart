// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
import 'package:leancode_contracts/leancode_contracts.dart';
export 'my_extensions.dart';
part 'cool_name.g.dart';

// :)

@ContractsSerializable()
class Auth with Equatable {
  Auth();

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);

  static const fullName$ =
      'LeanCode.ContractsGeneratorV2.ExampleContracts.Auth';

  List<Object?> get props => [];

  Map<String, dynamic> toJson() => _$AuthToJson(this);
}

@ContractsSerializable()
class KnownClaims with Equatable {
  KnownClaims();

  factory KnownClaims.fromJson(Map<String, dynamic> json) =>
      _$KnownClaimsFromJson(json);

  static const String userId = 'sub';

  static const String role = 'role';

  static const fullName$ =
      'LeanCode.ContractsGeneratorV2.ExampleContracts.Auth.KnownClaims';

  List<Object?> get props => [];

  Map<String, dynamic> toJson() => _$KnownClaimsToJson(this);
}

@ContractsSerializable()
class Roles with Equatable {
  Roles();

  factory Roles.fromJson(Map<String, dynamic> json) => _$RolesFromJson(json);

  static const String user = 'user';

  static const String admin = 'admin';

  static const String system = 'system';

  static const fullName$ =
      'LeanCode.ContractsGeneratorV2.ExampleContracts.Auth.Roles';

  List<Object?> get props => [];

  Map<String, dynamic> toJson() => _$RolesToJson(this);
}

/// This is a class-level comment.
abstract class PaginatedQuery<TResult>
    with Equatable
    implements Query<PaginatedResult<TResult>> {
  PaginatedQuery({required this.pageNumber, required this.pageSize});

  final int pageNumber;

  final int pageSize;

  static const fullName$ =
      'LeanCode.ContractsGeneratorV2.ExampleContracts.PaginatedQuery';
}

/// This one is in XML.
@ContractsSerializable(genericArgumentFactories: true)
class PaginatedResult<TResult> with Equatable {
  PaginatedResult({required this.items, required this.totalCount});

  factory PaginatedResult.fromJson(
    Map<String, dynamic> json,
    TResult Function(Object?) fromJsonTResult,
  ) => _$PaginatedResultFromJson(json, fromJsonTResult);

  /// And this is a property comment.
  final List<TResult> items;

  final int totalCount;

  static const fullName$ =
      'LeanCode.ContractsGeneratorV2.ExampleContracts.PaginatedResult';

  List<Object?> get props => [items, totalCount];

  Map<String, dynamic> toJson(Object? Function(TResult) toJsonTResult) =>
      _$PaginatedResultToJson(this, toJsonTResult);
}

@ContractsSerializable()
class AllUsersResult with Equatable implements PaginatedResult<User> {
  AllUsersResult({required this.items, required this.totalCount});

  factory AllUsersResult.fromJson(Map<String, dynamic> json) =>
      _$AllUsersResultFromJson(json);

  /// And this is a property comment.
  final List<User> items;

  final int totalCount;

  static const fullName$ =
      'LeanCode.ContractsGeneratorV2.ExampleContracts.Pagination.AllUsersResult';

  List<Object?> get props => [items, totalCount];

  Map<String, dynamic> toJson([Object? Function(Never)? _]) =>
      _$AllUsersResultToJson(this);
}

@ContractsSerializable(genericArgumentFactories: true)
class ChildResult<T> with Equatable implements PaginatedResult<T> {
  ChildResult({
    required this.items,
    required this.totalCount,
    required this.extras,
  });

  factory ChildResult.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$ChildResultFromJson(json, fromJsonT);

  /// And this is a property comment.
  final List<T> items;

  final int totalCount;

  final List<T> extras;

  static const fullName$ =
      'LeanCode.ContractsGeneratorV2.ExampleContracts.Pagination.ChildResult';

  List<Object?> get props => [items, totalCount, extras];

  Map<String, dynamic> toJson([Object? Function(T)? toJsonT]) =>
      _$ChildResultToJson(this, toJsonT ?? ((v) => v));
}

@ContractsSerializable()
class ClashingArityFacets
    with Equatable
    implements IFirstFacet<User>, IPairFacet<PaginatedResult<User>, User> {
  ClashingArityFacets({
    required this.first,
    required this.left,
    required this.right,
  });

  factory ClashingArityFacets.fromJson(Map<String, dynamic> json) =>
      _$ClashingArityFacetsFromJson(json);

  final User first;

  final PaginatedResult<User> left;

  final User right;

  static const fullName$ =
      'LeanCode.ContractsGeneratorV2.ExampleContracts.Pagination.ClashingArityFacets';

  List<Object?> get props => [first, left, right];

  Map<String, dynamic> toJson([
    Object? Function(Never)? _,
    Object? Function(Never)? _,
  ]) => _$ClashingArityFacetsToJson(this);
}

@ContractsSerializable()
class DifferentArityFacets
    with Equatable
    implements IFirstFacet<User>, IPairFacet<User, PaginatedResult<User>> {
  DifferentArityFacets({
    required this.first,
    required this.left,
    required this.right,
  });

  factory DifferentArityFacets.fromJson(Map<String, dynamic> json) =>
      _$DifferentArityFacetsFromJson(json);

  final User first;

  final User left;

  final PaginatedResult<User> right;

  static const fullName$ =
      'LeanCode.ContractsGeneratorV2.ExampleContracts.Pagination.DifferentArityFacets';

  List<Object?> get props => [first, left, right];

  Map<String, dynamic> toJson([
    Object? Function(Never)? _,
    Object? Function(Never)? _,
  ]) => _$DifferentArityFacetsToJson(this);
}

@ContractsSerializable()
class FacetQueryCombined
    with Equatable
    implements
        Query<bool>,
        IFacetQuery<User>,
        IPairFacet<User, PaginatedResult<User>> {
  FacetQueryCombined({
    required this.facet,
    required this.left,
    required this.right,
  });

  factory FacetQueryCombined.fromJson(Map<String, dynamic> json) =>
      _$FacetQueryCombinedFromJson(json);

  final User facet;

  final User left;

  final PaginatedResult<User> right;

  static const fullName$ =
      'LeanCode.ContractsGeneratorV2.ExampleContracts.Pagination.FacetQueryCombined';

  List<Object?> get props => [facet, left, right];

  Map<String, dynamic> toJson([
    Object? Function(Never)? _,
    Object? Function(Never)? _,
  ]) => _$FacetQueryCombinedToJson(this);

  bool resultFactory(dynamic decodedJson) => decodedJson as bool;

  String getFullName() => fullName$;
}

@ContractsSerializable()
class FacetQueryUser with Equatable implements Query<int?>, IFacetQuery<User> {
  FacetQueryUser({required this.facet});

  factory FacetQueryUser.fromJson(Map<String, dynamic> json) =>
      _$FacetQueryUserFromJson(json);

  final User facet;

  static const fullName$ =
      'LeanCode.ContractsGeneratorV2.ExampleContracts.Pagination.FacetQueryUser';

  List<Object?> get props => [facet];

  Map<String, dynamic> toJson([Object? Function(Never)? _]) =>
      _$FacetQueryUserToJson(this);

  int? resultFactory(dynamic decodedJson) => decodedJson as int?;

  String getFullName() => fullName$;
}

@ContractsSerializable(genericArgumentFactories: true)
class ForwardedAtSecondPosition<T>
    with Equatable
    implements IFirstFacet<T>, IPairFacet<User, T> {
  ForwardedAtSecondPosition({
    required this.first,
    required this.left,
    required this.right,
  });

  factory ForwardedAtSecondPosition.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$ForwardedAtSecondPositionFromJson(json, fromJsonT);

  final T first;

  final User left;

  final T right;

  static const fullName$ =
      'LeanCode.ContractsGeneratorV2.ExampleContracts.Pagination.ForwardedAtSecondPosition';

  List<Object?> get props => [first, left, right];

  Map<String, dynamic> toJson([
    Object? Function(Never)? _,
    Object? Function(T)? toJsonT,
  ]) => _$ForwardedAtSecondPositionToJson(this, toJsonT ?? ((v) => v));
}

@ContractsSerializable(genericArgumentFactories: true)
class ForwardedVarWithConcreteClash<T>
    with Equatable
    implements IFirstFacet<T>, ISecondFacet<User> {
  ForwardedVarWithConcreteClash({required this.first, required this.second});

  factory ForwardedVarWithConcreteClash.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$ForwardedVarWithConcreteClashFromJson(json, fromJsonT);

  final T first;

  final User second;

  static const fullName$ =
      'LeanCode.ContractsGeneratorV2.ExampleContracts.Pagination.ForwardedVarWithConcreteClash';

  List<Object?> get props => [first, second];

  Map<String, dynamic> toJson([
    Object? Function(Never)? _,
    Object? Function(T)? toJsonT,
  ]) => _$ForwardedVarWithConcreteClashToJson(this, toJsonT ?? ((v) => v));
}

@ContractsSerializable(genericArgumentFactories: true)
class IFacetQuery<TFacet> with Equatable {
  IFacetQuery({required this.facet});

  factory IFacetQuery.fromJson(
    Map<String, dynamic> json,
    TFacet Function(Object?) fromJsonTFacet,
  ) => _$IFacetQueryFromJson(json, fromJsonTFacet);

  final TFacet facet;

  static const fullName$ =
      'LeanCode.ContractsGeneratorV2.ExampleContracts.Pagination.IFacetQuery';

  List<Object?> get props => [facet];

  Map<String, dynamic> toJson(Object? Function(TFacet) toJsonTFacet) =>
      _$IFacetQueryToJson(this, toJsonTFacet);
}

@ContractsSerializable(genericArgumentFactories: true)
class IFirstFacet<TFirst> with Equatable {
  IFirstFacet({required this.first});

  factory IFirstFacet.fromJson(
    Map<String, dynamic> json,
    TFirst Function(Object?) fromJsonTFirst,
  ) => _$IFirstFacetFromJson(json, fromJsonTFirst);

  final TFirst first;

  static const fullName$ =
      'LeanCode.ContractsGeneratorV2.ExampleContracts.Pagination.IFirstFacet';

  List<Object?> get props => [first];

  Map<String, dynamic> toJson(Object? Function(TFirst) toJsonTFirst) =>
      _$IFirstFacetToJson(this, toJsonTFirst);
}

@ContractsSerializable(genericArgumentFactories: true)
class IPairFacet<TLeft, TRight> with Equatable {
  IPairFacet({required this.left, required this.right});

  factory IPairFacet.fromJson(
    Map<String, dynamic> json,
    TLeft Function(Object?) fromJsonTLeft,
    TRight Function(Object?) fromJsonTRight,
  ) => _$IPairFacetFromJson(json, fromJsonTLeft, fromJsonTRight);

  final TLeft left;

  final TRight right;

  static const fullName$ =
      'LeanCode.ContractsGeneratorV2.ExampleContracts.Pagination.IPairFacet';

  List<Object?> get props => [left, right];

  Map<String, dynamic> toJson(
    Object? Function(TLeft) toJsonTLeft,
    Object? Function(TRight) toJsonTRight,
  ) => _$IPairFacetToJson(this, toJsonTLeft, toJsonTRight);
}

@ContractsSerializable(genericArgumentFactories: true)
class ISecondFacet<TSecond> with Equatable {
  ISecondFacet({required this.second});

  factory ISecondFacet.fromJson(
    Map<String, dynamic> json,
    TSecond Function(Object?) fromJsonTSecond,
  ) => _$ISecondFacetFromJson(json, fromJsonTSecond);

  final TSecond second;

  static const fullName$ =
      'LeanCode.ContractsGeneratorV2.ExampleContracts.Pagination.ISecondFacet';

  List<Object?> get props => [second];

  Map<String, dynamic> toJson(Object? Function(TSecond) toJsonTSecond) =>
      _$ISecondFacetToJson(this, toJsonTSecond);
}

@ContractsSerializable()
class MixedFacets
    with Equatable
    implements IFirstFacet<User>, ISecondFacet<PaginatedResult<User>> {
  MixedFacets({required this.first, required this.second});

  factory MixedFacets.fromJson(Map<String, dynamic> json) =>
      _$MixedFacetsFromJson(json);

  final User first;

  final PaginatedResult<User> second;

  static const fullName$ =
      'LeanCode.ContractsGeneratorV2.ExampleContracts.Pagination.MixedFacets';

  List<Object?> get props => [first, second];

  Map<String, dynamic> toJson([Object? Function(Never)? _]) =>
      _$MixedFacetsToJson(this);
}

@ContractsSerializable()
class SameFacets
    with Equatable
    implements IFirstFacet<User>, ISecondFacet<User> {
  SameFacets({required this.first, required this.second});

  factory SameFacets.fromJson(Map<String, dynamic> json) =>
      _$SameFacetsFromJson(json);

  final User first;

  final User second;

  static const fullName$ =
      'LeanCode.ContractsGeneratorV2.ExampleContracts.Pagination.SameFacets';

  List<Object?> get props => [first, second];

  Map<String, dynamic> toJson([Object? Function(Never)? _]) =>
      _$SameFacetsToJson(this);
}

@ContractsSerializable()
class SearchResponse with Equatable {
  SearchResponse({
    required this.page,
    required this.allUsers,
    required this.children,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);

  final PaginatedResult<User> page;

  final AllUsersResult allUsers;

  final ChildResult<User> children;

  static const fullName$ =
      'LeanCode.ContractsGeneratorV2.ExampleContracts.Pagination.SearchResponse';

  List<Object?> get props => [page, allUsers, children];

  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}

@ContractsSerializable(genericArgumentFactories: true)
class TwoForwardedVars<A, B>
    with Equatable
    implements IFirstFacet<A>, ISecondFacet<B> {
  TwoForwardedVars({required this.first, required this.second});

  factory TwoForwardedVars.fromJson(
    Map<String, dynamic> json,
    A Function(Object?) fromJsonA,
    B Function(Object?) fromJsonB,
  ) => _$TwoForwardedVarsFromJson(json, fromJsonA, fromJsonB);

  final A first;

  final B second;

  static const fullName$ =
      'LeanCode.ContractsGeneratorV2.ExampleContracts.Pagination.TwoForwardedVars';

  List<Object?> get props => [first, second];

  Map<String, dynamic> toJson([
    Object? Function(Never)? _,
    Object? Function(A)? toJsonA,
    Object? Function(B)? toJsonB,
  ]) => _$TwoForwardedVarsToJson(
    this,
    toJsonA ?? ((v) => v),
    toJsonB ?? ((v) => v),
  );
}

@ContractsSerializable()
class User with Equatable {
  User({required this.id, required this.name});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  final String id;

  final String name;

  static const fullName$ =
      'LeanCode.ContractsGeneratorV2.ExampleContracts.Pagination.User';

  List<Object?> get props => [id, name];

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@ContractsSerializable(genericArgumentFactories: true)
class VarBoundTwice<T> with Equatable implements IPairFacet<T, T> {
  VarBoundTwice({required this.left, required this.right});

  factory VarBoundTwice.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$VarBoundTwiceFromJson(json, fromJsonT);

  final T left;

  final T right;

  static const fullName$ =
      'LeanCode.ContractsGeneratorV2.ExampleContracts.Pagination.VarBoundTwice';

  List<Object?> get props => [left, right];

  Map<String, dynamic> toJson([
    Object? Function(T)? toJsonT,
    Object? Function(Never)? _,
  ]) => _$VarBoundTwiceToJson(this, toJsonT ?? ((v) => v));
}

@ContractsSerializable()
class ISomethingRelated with Equatable {
  ISomethingRelated({required this.somethingId});

  factory ISomethingRelated.fromJson(Map<String, dynamic> json) =>
      _$ISomethingRelatedFromJson(json);

  final String somethingId;

  static const fullName$ =
      'LeanCode.ContractsGeneratorV2.ExampleContracts.Security.ISomethingRelated';

  List<Object?> get props => [somethingId];

  Map<String, dynamic> toJson() => _$ISomethingRelatedToJson(this);
}

/// System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('?', 'SA1302', Justification: 'Convention for authorizers.')
/// System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('?', 'IDE1006', Justification: 'Convention for authorizers.')
@ContractsSerializable()
class WhenHasSomethingAccess with Equatable {
  WhenHasSomethingAccess();

  factory WhenHasSomethingAccess.fromJson(Map<String, dynamic> json) =>
      _$WhenHasSomethingAccessFromJson(json);

  static const fullName$ =
      'LeanCode.ContractsGeneratorV2.ExampleContracts.Security.WhenHasSomethingAccess';

  List<Object?> get props => [];

  Map<String, dynamic> toJson() => _$WhenHasSomethingAccessToJson(this);
}

/// LeanCode.Contracts.Security.AuthorizeWhenHasAnyOfAttribute('admin')
@ContractsSerializable()
class AllUsers with Equatable implements PaginatedQuery<UserInfoDTO> {
  AllUsers({required this.pageNumber, required this.pageSize});

  factory AllUsers.fromJson(Map<String, dynamic> json) =>
      _$AllUsersFromJson(json);

  final int pageNumber;

  final int pageSize;

  static const fullName$ =
      'LeanCode.ContractsGeneratorV2.ExampleContracts.Users.AllUsers';

  List<Object?> get props => [pageNumber, pageSize];

  Map<String, dynamic> toJson([Object? Function(Never)? _]) =>
      _$AllUsersToJson(this);

  PaginatedResult<UserInfoDTO> resultFactory(dynamic decodedJson) =>
      _$PaginatedResultFromJson(
        decodedJson as Map<String, dynamic>,
        (e) => _$UserInfoDTOFromJson(e as Map<String, dynamic>),
      );

  String getFullName() => fullName$;
}

/// LeanCode.Contracts.Security.AuthorizeWhenHasAnyOfAttribute('admin')
/// LeanCode.ContractsGeneratorV2.ExampleContracts.Security.AuthorizeWhenHasSomethingAccessAttribute()
@ContractsSerializable()
class EditUser with Equatable implements Command, ISomethingRelated {
  EditUser({
    required this.somethingId,
    required this.userId,
    required this.list,
    required this.array,
    required this.dictionary,
    required this.userInfo,
  });

  factory EditUser.fromJson(Map<String, dynamic> json) =>
      _$EditUserFromJson(json);

  final String somethingId;

  final String userId;

  final List<int> list;

  final List<int> array;

  final Map<int, EditUser> dictionary;

  final UserInfoDTO userInfo;

  static const fullName$ =
      'LeanCode.ContractsGeneratorV2.ExampleContracts.Users.EditUser';

  List<Object?> get props => [
    somethingId,
    userId,
    list,
    array,
    dictionary,
    userInfo,
  ];

  Map<String, dynamic> toJson() => _$EditUserToJson(this);

  String getFullName() => fullName$;
}

class EditUserErrorCodes {
  static const userDoesNotExist = 1;

  static const userInfoIsNull = 2;

  static const userInfoFirstnameIsNull = 1001;

  static const userInfoSurnameIsNull = 1002;

  static const userInfoUsernameIsNull = 1003;

  static const userInfoFirstnameTooLong = 1004;

  static const userInfoSurnameTooLong = 1005;

  static const userInfoUsernameTooLong = 1006;

  static const userInfoEmailAddressTooLong = 1007;

  static const userInfoInvalidEmailAddress = 1009;

  static const userInfoEmailIsTaken = 1010;
}

/// LeanCode.Contracts.Security.AuthorizeWhenHasAnyOfAttribute('admin')
@ContractsSerializable()
class UserById with Equatable implements Query<UserInfoDTO?> {
  UserById();

  factory UserById.fromJson(Map<String, dynamic> json) =>
      _$UserByIdFromJson(json);

  static const fullName$ =
      'LeanCode.ContractsGeneratorV2.ExampleContracts.Users.UserById';

  List<Object?> get props => [];

  Map<String, dynamic> toJson() => _$UserByIdToJson(this);

  UserInfoDTO? resultFactory(dynamic decodedJson) => decodedJson == null
      ? null
      : _$UserInfoDTOFromJson(decodedJson as Map<String, dynamic>);

  String getFullName() => fullName$;
}

@Deprecated('Use something else instead')
@ContractsSerializable()
class UserInfoDTO with Equatable {
  UserInfoDTO({
    required this.firstname,
    required this.surname,
    required this.username,
    required this.emailAddress,
  });

  factory UserInfoDTO.fromJson(Map<String, dynamic> json) =>
      _$UserInfoDTOFromJson(json);

  final String firstname;

  @deprecated
  final String surname;

  final String username;

  final String emailAddress;

  static const fullName$ =
      'LeanCode.ContractsGeneratorV2.ExampleContracts.Users.UserInfoDTO';

  List<Object?> get props => [firstname, surname, username, emailAddress];

  Map<String, dynamic> toJson() => _$UserInfoDTOToJson(this);
}

/// LeanCode.Contracts.Security.AuthorizeWhenHasAnyOfAttribute('admin')
@ContractsSerializable()
class UserSomething with Equatable implements Query<int?> {
  UserSomething();

  factory UserSomething.fromJson(Map<String, dynamic> json) =>
      _$UserSomethingFromJson(json);

  static const fullName$ =
      'LeanCode.ContractsGeneratorV2.ExampleContracts.Users.UserSomething';

  List<Object?> get props => [];

  Map<String, dynamic> toJson() => _$UserSomethingToJson(this);

  int? resultFactory(dynamic decodedJson) => decodedJson as int?;

  String getFullName() => fullName$;
}
