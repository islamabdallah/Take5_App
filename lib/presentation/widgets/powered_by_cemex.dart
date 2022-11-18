import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take5/core/constants/app_colors.dart';

import '../../core/constants/app_assets.dart';

class PoweredByCemex extends StatelessWidget {
  const PoweredByCemex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Powered by",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.mainColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold
            ),
          ),
          Image.asset(
            AppAssets.cemexLogo,
            height: 35.h,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}
