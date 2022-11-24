import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
class ItemOfTripDescription extends StatelessWidget {
  final String title;
  final Widget icon;
  final String value;

  const ItemOfTripDescription({Key? key,required this.title,required this.icon,required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp),
            ),
            icon,
          ],
        ),
        Text(
          value,
          //AppConstants.user.driverName,
          style: TextStyle(
              color: AppColors.mainColor,
              fontWeight: FontWeight.w700,
              fontSize: 16.sp),
        ),
        SizedBox(
          height: 8.h,
        ),
        Divider(
          thickness: 0.3.h,
          color: Colors.grey,
        ),
      ],
    );
  }
}
