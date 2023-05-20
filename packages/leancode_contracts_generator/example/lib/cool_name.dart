// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
import 'package:leancode_contracts/leancode_contracts.dart';
export 'my_extensions.dart';
part 'cool_name.g.dart';

// :)

@ContractsSerializable()
class Auth with EquatableMixin {
  Auth();

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);

  List<Object?> get props => [];

  Map<String, dynamic> toJson() => _$AuthToJson(this);
}

@ContractsSerializable()
class KnownClaims with EquatableMixin {
  KnownClaims();

  factory KnownClaims.fromJson(Map<String, dynamic> json) =>
      _$KnownClaimsFromJson(json);

  static const String userId = 'sub';

  static const String role = 'role';

  List<Object?> get props => [];

  Map<String, dynamic> toJson() => _$KnownClaimsToJson(this);
}

@ContractsSerializable()
class Roles with EquatableMixin {
  Roles();

  factory Roles.fromJson(Map<String, dynamic> json) => _$RolesFromJson(json);

  static const String user = 'user';

  static const String admin = 'admin';

  static const String system = 'system';

  List<Object?> get props => [];

  Map<String, dynamic> toJson() => _$RolesToJson(this);
}

/// This is a class-level comment.
abstract class PaginatedQuery<TResult>
    with EquatableMixin
    implements Query<PaginatedResult<TResult>> {
  PaginatedQuery({
    required this.pageNumber,
    required this.pageSize,
  });

  final int pageNumber;

  final int pageSize;

  List<Object?> get props => [pageNumber, pageSize];
}

/// This one is in XML.
@ContractsSerializable(genericArgumentFactories: true)
class PaginatedResult<TResult> with EquatableMixin {
  PaginatedResult({
    required this.items,
    required this.totalCount,
  });

  factory PaginatedResult.fromJson(
    Map<String, dynamic> json,
    TResult Function(Object?) fromJsonTResult,
  ) =>
      _$PaginatedResultFromJson(json, fromJsonTResult);

  /// And this is a property comment.
  final List<TResult> items;

  final int totalCount;

  List<Object?> get props => [items, totalCount];
}

@ContractsSerializable()
class ISomethingRelated with EquatableMixin {
  ISomethingRelated({required this.somethingId});

  factory ISomethingRelated.fromJson(Map<String, dynamic> json) =>
      _$ISomethingRelatedFromJson(json);

  final String somethingId;

  List<Object?> get props => [somethingId];

  Map<String, dynamic> toJson() => _$ISomethingRelatedToJson(this);
}

/// System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('?', 'SA1302', Justification: 'Convention for authorizers.')
/// System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('?', 'IDE1006', Justification: 'Convention for authorizers.')
@ContractsSerializable()
class WhenHasSomethingAccess with EquatableMixin {
  WhenHasSomethingAccess();

  factory WhenHasSomethingAccess.fromJson(Map<String, dynamic> json) =>
      _$WhenHasSomethingAccessFromJson(json);

  List<Object?> get props => [];

  Map<String, dynamic> toJson() => _$WhenHasSomethingAccessToJson(this);
}

/// LeanCode.Contracts.Security.AuthorizeWhenHasAnyOfAttribute('admin')
@ContractsSerializable()
class AllUsers with EquatableMixin implements PaginatedQuery<UserInfoDTO> {
  AllUsers({
    required this.pageNumber,
    required this.pageSize,
  });

  factory AllUsers.fromJson(Map<String, dynamic> json) =>
      _$AllUsersFromJson(json);

  final int pageNumber;

  final int pageSize;

  List<Object?> get props => [pageNumber, pageSize];

  Map<String, dynamic> toJson() => _$AllUsersToJson(this);
  PaginatedResult<UserInfoDTO> resultFactory(dynamic decodedJson) =>
      _$PaginatedResultFromJson(decodedJson as Map<String, dynamic>,
          (e) => _$UserInfoDTOFromJson(e as Map<String, dynamic>));
  String getFullName() =>
      'LeanCode.ContractsGeneratorV2.ExampleContracts.Users.AllUsers';
}

/// LeanCode.Contracts.Security.AuthorizeWhenHasAnyOfAttribute('admin')
/// LeanCode.ContractsGeneratorV2.ExampleContracts.Security.AuthorizeWhenHasSomethingAccessAttribute()
@ContractsSerializable()
class EditUser with EquatableMixin implements Command, ISomethingRelated {
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

  List<Object?> get props =>
      [somethingId, userId, list, array, dictionary, userInfo];

  Map<String, dynamic> toJson() => _$EditUserToJson(this);
  String getFullName() =>
      'LeanCode.ContractsGeneratorV2.ExampleContracts.Users.EditUser';
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
class UserById with EquatableMixin implements Query<UserInfoDTO?> {
  UserById();

  factory UserById.fromJson(Map<String, dynamic> json) =>
      _$UserByIdFromJson(json);

  List<Object?> get props => [];

  Map<String, dynamic> toJson() => _$UserByIdToJson(this);
  UserInfoDTO? resultFactory(dynamic decodedJson) => decodedJson == null
      ? null
      : _$UserInfoDTOFromJson(decodedJson as Map<String, dynamic>);
  String getFullName() =>
      'LeanCode.ContractsGeneratorV2.ExampleContracts.Users.UserById';
}

@Deprecated('Use something else instead')
@ContractsSerializable()
class UserInfoDTO with EquatableMixin {
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

  List<Object?> get props => [firstname, surname, username, emailAddress];

  Map<String, dynamic> toJson() => _$UserInfoDTOToJson(this);
}

/// LeanCode.Contracts.Security.AuthorizeWhenHasAnyOfAttribute('admin')
@ContractsSerializable()
class UserSomething with EquatableMixin implements Query<int?> {
  UserSomething();

  factory UserSomething.fromJson(Map<String, dynamic> json) =>
      _$UserSomethingFromJson(json);

  List<Object?> get props => [];

  Map<String, dynamic> toJson() => _$UserSomethingToJson(this);
  int? resultFactory(dynamic decodedJson) => decodedJson as int?;
  String getFullName() =>
      'LeanCode.ContractsGeneratorV2.ExampleContracts.Users.UserSomething';
}
