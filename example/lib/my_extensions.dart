import 'package:example/cool_name.dart';

extension FullName on UserInfoDTO {
  String get fullName => '$firstname $surname';
}
