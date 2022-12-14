import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take5/presentation/screens/home/home.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../injection_container.dart';
import '../../../logic/login_cubit/login_cubit.dart';
import '../../../logic/login_cubit/login_states.dart';
import '../../utils/dialogs/loading_dialog.dart';
import '../../utils/dialogs/message_dialog.dart';
import '../../widgets/main_button.dart';
import '../../widgets/my_text_form_field.dart';
import '../../widgets/powered_by_cemex.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'LoginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginUserLoading) {
            loadingAlertDialog(context);
          }
          if (state is LoginUserFail) {
            Navigator.pop(context);
            //message from backend
            showMessageDialog(
                context: context, message: state.message, isSucceeded: false);
          }
          if (state is LoginUserSuccess) {
            Navigator.pop(context);
            showMessageDialog(
                context: context,
                isSucceeded: true,
                message:AppStrings.successLogin.tr(),
                onPressedOk: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, HomeScreen.routeName, (route) => false);
                });
          }
        },
        builder: (context, state) {
          var _cubit = LoginCubit.get(context);
          return  Scaffold(
               backgroundColor: AppColors.backgroundColor,
                body: SafeArea(
                  child: CustomScrollView(
                      slivers: [
                      SliverFillRemaining(
                      hasScrollBody: false,
                      child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 50.h,
                          ),
                          Center(
                            child: Container(
                                alignment: Alignment.center,
                                height: 180.w,
                                width: 180.w,
                                child: Image.asset(
                                  AppAssets.appLogo,
                                  fit: BoxFit.contain,
                                )),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Text(
                            AppStrings.login.tr(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.redColor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                MyTextFormField(
                                  controller: _cubit.serialNumberController,
                                  label: "Id".tr(),
                                  errorText: _cubit.errorMessage ==
                                      "serial number isn't exit".tr()
                                      ? _cubit.errorMessage
                                      : null,
                                  prefixIcon: Icons.person_outline_sharp,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp("[0-9]")),
                                  ],
                                  validator: (String? value) {
                                    if (value!.isEmpty) return AppStrings.required.tr();
                                  },
                                  keyboardType: TextInputType.number,
                                ),
                                MyTextFormField(
                                  controller: _cubit.passwordController,
                                  label: "password".tr(),
                                  errorText: _cubit.errorMessage ==
                                      "password is wrong".tr()
                                      ? _cubit.errorMessage
                                      : null,
                                  obscureText: !_cubit.isTextVisible,
                                  suffixOnPressed: () =>
                                      _cubit.changeTextVisibility(
                                          !_cubit.isTextVisible),
                                  suffixIcon: !_cubit.isTextVisible
                                      ? Icons.visibility_off_outlined
                                      : Icons.remove_red_eye_outlined,
                                  prefixIcon: Icons.lock_outline,
                                  validator: (String? value) {
                                    if (value!.isEmpty) return AppStrings.required.tr();
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 60.h,
                                ),
                                MainButton(
                                  onPressed: () {
                                  if(_formKey.currentState!.validate())
                                    {
                                      _cubit.loginUser();
                                    }
                                  }, title:"login button title".tr(),),
                              ],
                            ),
                          ),
                          const Spacer(),
                          const Center(child: PoweredByCemex()),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    ),
                  )]),
                ),
              );
        },
      ),
    );
  }
}
