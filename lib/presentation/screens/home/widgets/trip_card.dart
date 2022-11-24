import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take5/core/constants/app_colors.dart';
import 'package:take5/core/constants/app_constants.dart';

import '../../../../data/models/trip/trip.dart';
import '../../../../logic/home_cubit/home_cubit.dart';
import '../../trip/trip.dart';
import 'item_of_description.dart';

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
                ItemOfTripDescription(title:'رقم الرحلة' ,icon:const Icon(Icons.event_note_sharp) ,value: HomeCubit.get(context).trip!.tripNumber.toString(),),
                ItemOfTripDescription(title:'حالة الرحلة' ,icon:const Icon(Icons.event_note_sharp)  ,value: HomeCubit.get(context).trip!.tripStatus,),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       'حالة الرحلة',
                //       style: TextStyle(
                //           color: Colors.black,
                //           fontWeight: FontWeight.w700,
                //           fontSize: 18.sp),
                //     ),
                //     Image.asset(
                //       'assets/icons/trip_status.png',
                //       color: AppColors.mainColor,
                //       height: 24.w,
                //     )
                //   ],
                // ),
                // Text(
                //   'في الانتظار',
                //   //AppConstants.user.driverName,
                //   style: TextStyle(
                //       color: AppColors.mainColor,
                //       fontWeight: FontWeight.w700,
                //       fontSize: 16.sp),
                // ),
                // SizedBox(
                //   height: 8.h,
                // ),
                // Divider(
                //   thickness: 0.3.h,
                //   color: Colors.grey,
                // ),
                ItemOfTripDescription(title:'اسم السائق' ,icon:const Icon(Icons.person) ,value: HomeCubit.get(context).trip!.driverName,),
                ItemOfTripDescription(title:'مكان التوجه' ,icon:const Icon(Icons.location_on_rounded) ,value: HomeCubit.get(context).trip!.jobsiteName,),
                ItemOfTripDescription(title:'حالة الشبكة' ,icon:const Icon(Icons.wifi),value: HomeCubit.get(context).trip!.jobsiteHasNetworkCoverage.toString(),),
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

