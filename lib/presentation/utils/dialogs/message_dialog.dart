import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take5/core/constants/app_colors.dart';
import 'package:take5/presentation/screens/end_trip/end_trip.dart';

showMessageDialog({
  required BuildContext context,
  String? message,
  required bool isSucceeded,
  VoidCallback? onPressedOk,
}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0.r)),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                SizedBox(
                  height: 250.h,
                  width: 372.w,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10.w, 60.h, 10.w, 20.h),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            isSucceeded ? 'Succeeded'.tr() :message=='لا يوجد اى ملاحظات!'?'انذار': 'Failed'.tr(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                              color:
                                  isSucceeded ? AppColors.mainColor : Colors.red,
                            ),
                          ),
                          Text(
                            message??'',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18.sp,fontFamily: 'Roboto'),
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            maxLines: 3,
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 100.w,
                                height: 50.h,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if(message=='لا يوجد اى ملاحظات!') {
                                      Navigator.of(context).pop();
                                      Navigator.pushNamed(context,EndTripScreen.routeName);
                                    }
                                    else
                                    {
                                      Navigator.of(context).pop();
                                      onPressedOk?.call();
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: isSucceeded
                                        ? AppColors.mainColor
                                        : Colors.red,
                                  ),
                                  child: Text(
                                    message=='لا يوجد اى ملاحظات!'?"التالي":"Ok".tr(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16.sp),
                                  ),
                                ),
                              ),
                              message=='لا يوجد اى ملاحظات!'?const Spacer():Container(),
                              message=='لا يوجد اى ملاحظات!'?SizedBox(
                                width: 100.w,
                                height: 50.h,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if(message=='لا يوجد اى ملاحظات!') {
                                      Navigator.of(context).pop();
                                      Navigator.pushNamed(context,EndTripScreen.routeName);
                                    }
                                    else
                                    {
                                      Navigator.of(context).pop();
                                      onPressedOk?.call();
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: isSucceeded
                                        ? AppColors.mainColor
                                        : Colors.red,
                                  ),
                                  child: Text(
                                    "Ok".tr(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16.sp),
                                  ),
                                ),
                              ):Container(),
                            ],
                          )
                        ]),
                  ),
                ),
                Positioned(
                    top: -50.h,
                    child: isSucceeded
                        ? CircleAvatar(
                            backgroundColor:AppColors.mainColor,
                            radius: 50.r,
                            child: Icon(
                              Icons.verified_user,
                              color: Colors.white,
                              size: 50.h,
                            ),
                          )
                        : CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 50.r,
                            child: Icon(
                              Icons.privacy_tip,
                              color: Colors.white,
                              size: 50.h,
                            ),
                          )),
              ],
            )),
      );
    },
  );
}
