import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_colors.dart';
class Headline extends StatelessWidget {
  final String number;
  final String title;
  const Headline({Key? key,required this.number,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.mainColor,
          radius:14.h ,
          child:  Center(
            child: Text(
              number,style:const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700
            ),),
          ),),
        SizedBox(
          width: 10.w,
        ),
        Text(title,style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize:  20.sp
        )),
      ],
    );
  }
}
