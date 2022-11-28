import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take5/core/constants/app_colors.dart';
import 'package:take5/data/models/take5_together/take5_together.dart';
class Note extends StatelessWidget {
  final int index;
  final String nameOfCoWorker;
  final String whoStartedConversation;
  final String note;
  const Note({Key? key,required this.index,required this.nameOfCoWorker,required this.whoStartedConversation,required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey,
      height: 300.h,
      child: Column(
        children: [
          Container(
            height: 40.h,
            color: AppColors.redColor,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 0,horizontal: 15.w),
              child: Row(
                children: [
                  Text('رقم الملاحظة : ',style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 18.sp,
                  ),),
                  Text('${index+1}',style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 18.sp,
                  ),),
                ],
              ),
            ),
          ),
      Padding(
        padding:EdgeInsets.symmetric(vertical: 10.h,horizontal: 15.w),
        child:Column(
            children: [
              Row(
                children: [
                  Text('اسم الزميل : ',style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 18.sp,
                  ),),
                  Text(nameOfCoWorker,style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 18.sp,
                  ),),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
