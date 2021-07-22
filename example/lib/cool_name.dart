import 'package:cqrs/contracts.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
export 'my_extensions.dart';
part 'cool_name.g.dart';

// :)

final _ = EquatableConfig.stringify = true;

/// [TimeOfDay] but with seconds precision
class Time with EquatableMixin {
  const Time(this.hour, this.minute, this.second)
      : assert(hour >= 0 && hour <= 23),
        assert(minute >= 0 && minute <= 59),
        assert(second >= 0 && second <= 59);

  factory Time.fromJson(String json) {
    final chunks = json.split(':');
    return Time(
      int.parse(chunks[0]),
      int.parse(chunks[1]),
      int.parse(chunks[2]),
    );
  }

  final int hour;

  final int minute;

  final int second;

  get props => [hour, minute, second];

  String toJson() => '$hour:$minute:$second';
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class Auth with EquatableMixin {
  Auth();

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);

  get props => [];

  Map<String, dynamic> toJson() => _$AuthToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class KnownClaims with EquatableMixin {
  KnownClaims();

  factory KnownClaims.fromJson(Map<String, dynamic> json) =>
      _$KnownClaimsFromJson(json);

  static const String userId = 'sub';

  static const String role = 'role';

  get props => [];

  Map<String, dynamic> toJson() => _$KnownClaimsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class Roles with EquatableMixin {
  Roles();

  factory Roles.fromJson(Map<String, dynamic> json) => _$RolesFromJson(json);

  static const String user = 'user';

  static const String admin = 'admin';

  static const String system = 'system';

  get props => [];

  Map<String, dynamic> toJson() => _$RolesToJson(this);
}

/// This is a class-level comment.
abstract class PaginatedQuery<TResult>
    with EquatableMixin
    implements IRemoteQuery<PaginatedResult<TResult>> {
  PaginatedQuery({
    required this.pageNumber,
    required this.pageSize,
  });

  final int pageNumber;

  final int pageSize;

  get props => [pageNumber, pageSize];
}

/// This one is in XML.
@JsonSerializable(
    fieldRename: FieldRename.pascal, genericArgumentFactories: true)
class PaginatedResult<TResult> with EquatableMixin {
  PaginatedResult({
    required this.items,
    required this.totalCount,
  });

  factory PaginatedResult.fromJson(Map<String, dynamic> json,
          TResult Function(Object?) fromJsonTResult) =>
      _$PaginatedResultFromJson(json, fromJsonTResult);

  /// And this is a property comment.
  final List<TResult> items;

  final int totalCount;

  get props => [items, totalCount];

  Map<String, dynamic> toJson(Object? Function(TResult) toJsonTResult) =>
      _$PaginatedResultToJson(this, toJsonTResult);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class ISomethingRelated with EquatableMixin {
  ISomethingRelated({
    required this.somethingId,
  });

  factory ISomethingRelated.fromJson(Map<String, dynamic> json) =>
      _$ISomethingRelatedFromJson(json);

  final String somethingId;

  get props => [somethingId];

  Map<String, dynamic> toJson() => _$ISomethingRelatedToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class WhenHasSomethingAccess with EquatableMixin {
  WhenHasSomethingAccess();

  factory WhenHasSomethingAccess.fromJson(Map<String, dynamic> json) =>
      _$WhenHasSomethingAccessFromJson(json);

  get props => [];

  Map<String, dynamic> toJson() => _$WhenHasSomethingAccessToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class AllUsers with EquatableMixin implements PaginatedQuery<UserInfoDTO> {
  AllUsers({
    required this.pageNumber,
    required this.pageSize,
  });

  factory AllUsers.fromJson(Map<String, dynamic> json) =>
      _$AllUsersFromJson(json);

  final int pageNumber;

  final int pageSize;

  get props => [pageNumber, pageSize];

  Map<String, dynamic> toJson() => _$AllUsersToJson(this);
  PaginatedResult<UserInfoDTO> resultFactory(dynamic decodedJson) =>
      _$PaginatedResultFromJson(decodedJson as Map<String, dynamic>,
          (e) => _$UserInfoDTOFromJson(e as Map<String, dynamic>));
  String getFullName() =>
      'LeanCode.ContractsGeneratorV2.ExampleContracts.Users.AllUsers';
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class EditUser
    with EquatableMixin
    implements IRemoteCommand, ISomethingRelated {
  EditUser({
    required this.userId,
    required this.somethingId,
    required this.list,
    required this.array,
    required this.dictionary,
    required this.userInfo,
  });

  factory EditUser.fromJson(Map<String, dynamic> json) =>
      _$EditUserFromJson(json);

  final String userId;

  final String somethingId;

  final List<int> list;

  final List<int> array;

  final Map<int, EditUser> dictionary;

  final UserInfoDTO userInfo;

  get props => [userId, somethingId, list, array, dictionary, userInfo];

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

@JsonSerializable(fieldRename: FieldRename.pascal)
class UserById with EquatableMixin implements IRemoteQuery<UserInfoDTO?> {
  UserById();

  factory UserById.fromJson(Map<String, dynamic> json) =>
      _$UserByIdFromJson(json);

  get props => [];

  Map<String, dynamic> toJson() => _$UserByIdToJson(this);
  UserInfoDTO? resultFactory(dynamic decodedJson) => decodedJson == null
      ? null
      : _$UserInfoDTOFromJson(decodedJson as Map<String, dynamic>);
  String getFullName() =>
      'LeanCode.ContractsGeneratorV2.ExampleContracts.Users.UserById';
}

@JsonSerializable(fieldRename: FieldRename.pascal)
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

  final String surname;

  final String username;

  final String emailAddress;

  get props => [firstname, surname, username, emailAddress];

  Map<String, dynamic> toJson() => _$UserInfoDTOToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.pascal)
class UserSomething with EquatableMixin implements IRemoteQuery<int?> {
  UserSomething();

  factory UserSomething.fromJson(Map<String, dynamic> json) =>
      _$UserSomethingFromJson(json);

  get props => [];

  Map<String, dynamic> toJson() => _$UserSomethingToJson(this);
  int? resultFactory(dynamic decodedJson) => decodedJson as int?;
  String getFullName() =>
      'LeanCode.ContractsGeneratorV2.ExampleContracts.Users.UserSomething';
}
