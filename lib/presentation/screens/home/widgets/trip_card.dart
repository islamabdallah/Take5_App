import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take5/core/constants/app_colors.dart';
import 'package:take5/core/constants/app_constants.dart';

import '../../../../data/models/trip/trip.dart';
import '../../../../logic/home_cubit/home_cubit.dart';
import '../../trip/trip.dart';

class TripCard extends StatelessWidget {
  final Trip trip;

  const TripCard({Key? key, required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                    offset: Offset(0, 4),
                    color: Colors.black26,
                    blurRadius: 8,
                    spreadRadius: 1)
              ]),
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.symmetric(vertical: 0.h, horizontal: 16.w),
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(width: 6.0.w, color: AppColors.mainColor),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'رقم الرحلة',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp),
                    ),
                    Icon(Icons.event_note_sharp),
                  ],
                ),
                Text(
                  HomeCubit.get(context).trip!.tripNumber.toString(),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'حالة الرحلة',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp),
                    ),
                    Image.asset(
                      'assets/icons/trip_status.png',
                      color: AppColors.mainColor,
                      height: 24.w,
                    )
                  ],
                ),
                Text(
                  'في الانتظار',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'اسم السائق',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp),
                    ),
                    Icon(Icons.person),
                  ],
                ),
                Text(
                  'اسماء',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'مكان التوجه',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp),
                    ),
                    Icon(Icons.location_on_rounded),
                  ],
                ),
                Text(
                  'اسكندريه ميامي',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'حالة الشبكة',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp),
                    ),
                    Icon(Icons.wifi),
                  ],
                ),
                Text(
                  ' يوجد شبكة',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'رقم الشاحنة',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp),
                    ),
                    Container(
                      height: 25.h,
                      width: 65.w,
                      color: AppColors.mainColor,
                      child: Center(
                        child: Text(
                          HomeCubit.get(context).trip!.truckNumber,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  HomeCubit.get(context).trip!.truckNumber,
                  //AppConstants.user.driverName,
                  style: TextStyle(
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: SizedBox(
                    width: 300.w,
                    child: ElevatedButton(
                      onPressed: () {
                        HomeCubit.get(context).startTrip();
                        final service = FlutterBackgroundService();
                        service.startService();
                        Navigator.pushReplacementNamed(
                            context, TripScreen.routeName);
                      },
                      child: const Text('ابدأ الرحلة'),
                    ),
                  ),
                )
              ],
            ),
          ),

    );
  }
}
/*
ElevatedButton(
              onPressed: () {
                HomeCubit.get(context).startTrip();
                final service = FlutterBackgroundService();
                service.startService();
                Navigator.pushReplacementNamed(
                    context, TripScreen.routeName);
              },
              child: const Text('ابدأ الرحلة'),
            ),
 */
