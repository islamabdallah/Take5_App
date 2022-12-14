import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/app_constants.dart';
import '../../data/repositories/take5_repository.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  static LoginCubit get(context) => BlocProvider.of(context);
  final Take5Repository take5Repository;

  LoginCubit({required this.take5Repository}) : super(InitialLoginState());

  TextEditingController serialNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isTextVisible = false;

// hide or visible password text
  void changeTextVisibility(bool value) {
    isTextVisible = value;
    emit(ChangePasswordVisibilityState());
  }
  String errorMessage = '';

  Future<void> loginUser() async {
    emit(LoginUserLoading());
    final result = await take5Repository.loginUser(
        driverNumber: int.parse(serialNumberController.text.split(" ").join("")),//delete spaces in serial number
        password: passwordController.text.split(" ").join(""));//delete spaces in password
    result.fold((failure) {
      errorMessage = failure.message;
      emit(LoginUserFail(failure.message));
    },(userResponse) {
      AppConstants.user = userResponse.data.userAPIModel;
      emit(LoginUserSuccess());
    });
  }
}
