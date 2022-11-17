import 'package:freezed_annotation/freezed_annotation.dart';

import '../../user/user.dart';

part 'user_login_response.freezed.dart';//same name of file
part 'user_login_response.g.dart';

@freezed
class UserLoginResponse with _$UserLoginResponse{
  const factory UserLoginResponse({
    required String message,
    required User data,
  }) = _UserLoginResponse;

  factory UserLoginResponse.fromJson(Map<String, dynamic> json) => _$UserLoginResponseFromJson(json);
}
