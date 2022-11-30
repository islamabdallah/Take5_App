import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take5/core/constants/app_colors.dart';
import 'package:take5/logic/take5_together_cubit/take5_together_cubit.dart';

import '../../data/models/take5_together/take5_together.dart';

class Take5TogetherCard extends StatelessWidget {
  final int index;
  final Take5TogetherModel take5togetherModel;
  final Function() removeNote;

  const Take5TogetherCard(
      {Key? key, required this.index, required this.take5togetherModel, required this.removeNote})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 0),
      child: Container(
        width: double.infinity,
        // height: 150.h,
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(width: 5.0, color: AppColors.mainColor),
            left: BorderSide(
              width: 2.0,
              color: Color(0xFFE7E7E7),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '$indexالمحادثة ',
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spacer(),
                  IconButton(
                    onPressed:removeNote,
                    icon: Icon(Icons.delete_forever),
                  )
                ],
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: 'مع: ',
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: AppColors.greyColor,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: take5togetherModel.participantDriverName,
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: AppColors.greyColor,
                    ),
                  ),
                ]),
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: 'الذي بدأ المحادثة: ',
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: AppColors.greyColor,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: take5togetherModel.whoStartDriverName,
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: AppColors.greyColor,
                    ),
                  ),
                ]),
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: 'المحادثة: ',
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: AppColors.greyColor,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: take5togetherModel.notes,
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: AppColors.greyColor,
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
