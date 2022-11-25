import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_colors.dart';
class MainButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const MainButton({Key? key,required this.onPressed,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        height: 50.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.mainColor,
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(8.r)),
          ),
          onPressed:onPressed,
          child:title=='دخول'?
          Row(
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
          )
              : Text(title, style: TextStyle(
            color: Colors.white,
            fontSize: 22.sp,
            fontFamily: "Cairo",
            fontWeight: FontWeight.w700,
          ),),
        ),
      ),
    );
  }
}
