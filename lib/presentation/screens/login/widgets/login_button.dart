import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take5/logic/login_cubit/login_cubit.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  const LoginButton({Key? key,required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.mainColor,
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(8.r)),
      ),
      onPressed:onPressed,
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.center,
        children: [
          Text(
            'دخول',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.sp,
              fontFamily: "Cairo",
              fontWeight: FontWeight.w700,
            ),
          ),
          Container(
              alignment: Alignment.center,
              height: 30.h,
              width: 40.w,
              child: Image.asset(
                AppAssets.login,
                fit: BoxFit.contain,
              )),
        ],
      ),
    );
  }
}
