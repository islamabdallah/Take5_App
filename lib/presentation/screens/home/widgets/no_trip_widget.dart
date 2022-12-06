import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../logic/home_cubit/home_cubit.dart';
import '../../../widgets/main_button.dart';
class NoTripWidget extends StatelessWidget {
  const NoTripWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30.h,
        ),
        Image.asset(AppAssets.noTrip),
        SizedBox(
          height: 20.h,
        ),
        Text(
          'لا يوجد رحلة',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 28.sp),
        ),
        SizedBox(
          height: 40.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: MainButton(
            onPressed: () {
              HomeCubit.get(context).getCurrentTrip();
            },
            title: 'اعادة البحث',
          ),
        ),
      ],
    );
  }
}
