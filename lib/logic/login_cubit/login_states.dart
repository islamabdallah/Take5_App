abstract class LoginStates {}

class InitialLoginState extends LoginStates {}

class ChangePasswordVisibilityState extends LoginStates {}


class LoginUserLoading extends LoginStates {}

class LoginUserSuccess extends LoginStates {}

class LoginUserFail extends LoginStates {
  final String? message;

  LoginUserFail(this.message);
}