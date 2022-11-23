import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
class PreparingWidget extends StatelessWidget {
  final int number;
  final String imagePath;
  final String title;
  const PreparingWidget({Key? key,required this.number,required this.imagePath,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.mainColor,
              radius:14.h ,
              child:  Center(
                child: Text(
                  number.toString(),style:const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700
                ),),
              ),),
            SizedBox(
              width: 10.w,
            ),
            Text(title,style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16.sp
            )),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Center(
          child: Image.asset(imagePath,height: 200.h,width: 250.w,),
        )
      ],
    );
  }
}
