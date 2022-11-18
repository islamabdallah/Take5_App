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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
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
        ),
        Container(
          decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
              color: Colors.white, boxShadow: const [
           BoxShadow(
                offset: Offset(0, 10),
                color: Colors.black26,
                blurRadius: 8,
                spreadRadius: 1)
          ]),
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.symmetric(vertical: 0.h, horizontal: 16.w),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                    width: 6.0.w, color: AppColors.mainColor),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 8.w),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             trip.driverName ?? '',
                //             style: TextStyle(fontSize: 18),
                //             maxLines: 2,
                //             overflow: TextOverflow.ellipsis,
                //           ),
                //           Row(children: <Widget>[
                //             Text(
                //               ' رقم :',
                //               style: TextStyle(),
                //             ),
                //             SizedBox(
                //               width: 10.0,
                //             ),
                //             Text(
                //               '(${trip.tripNumber ?? ''})',
                //             ),
                //           ]),
                //         ],
                //       ),
                //       Text(
                //         '(${trip.tripStatus ?? ''})',
                //         style: const TextStyle(
                //           fontSize: 13.0,
                //           fontWeight: FontWeight.w600,
                //         ),
                //         maxLines: 2,
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 16.h,
                // ),
                // Container(
                //   padding: EdgeInsets.only(right: 10.0),
                //   child: Column(
                //     children: <Widget>[
                //       Row(
                //         children: [
                //           Expanded(
                //               child: Row(
                //             children: [
                //               Icon(
                //                 Icons.gps_fixed,
                //                 color: Theme.of(context).primaryColor,
                //               ),
                //               SizedBox(
                //                 width: 10.0,
                //               ),
                //               Text(
                //                 'مكان التوصيل:',
                //                 style: TextStyle(
                //                   fontSize: 13.0,
                //                   fontWeight: FontWeight.w600,
                //                 ),
                //                 overflow: TextOverflow.ellipsis,
                //               ),
                //               SizedBox(
                //                 width: 8.w,
                //               ),
                //               Text(
                //                 trip.jobsiteName ?? '',
                //                 style: TextStyle(
                //                     fontSize: 13.0,
                //                     fontWeight: FontWeight.w600,
                //                     color: Colors.black54),
                //                 maxLines: 2,
                //                 overflow: TextOverflow.ellipsis,
                //               ),
                //             ],
                //           )),
                //         ],
                //       ),
                //       SizedBox(
                //         height: 8.h,
                //       ),
                //       Row(
                //         children: [
                //           Expanded(
                //               child: Row(
                //             children: [
                //               Icon(
                //                 Icons.wifi,
                //                 color: Colors.green,
                //               ),
                //               SizedBox(
                //                 width: 10.0,
                //               ),
                //               Text(
                //                 'تغطية الانترنت:',
                //                 style: TextStyle(
                //                   fontSize: 13.0,
                //                   fontWeight: FontWeight.w600,
                //                 ),
                //                 overflow: TextOverflow.ellipsis,
                //               ),
                //               SizedBox(
                //                 width: 8.w,
                //               ),
                //               Text(
                //                 trip.jobsiteHasNetworkCoverage ? 'نعم' : 'لا',
                //                 style: TextStyle(
                //                     fontSize: 13.0,
                //                     fontWeight: FontWeight.w600,
                //                     color: Colors.black54),
                //                 maxLines: 2,
                //                 overflow: TextOverflow.ellipsis,
                //               ),
                //             ],
                //           )),
                //         ],
                //       ),
                //       SizedBox(
                //         height: 16.0.h,
                //       ),
                //     ],
                //   ),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('رقم الرحلة',
                      style: TextStyle(
                          color:Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp
                      ),),
                    IconButton(onPressed: (){}, icon: Icon(Icons.event_note_sharp)),
                  ],
                ),
                Text(HomeCubit.get(context).trip!.tripNumber.toString(),
                  //AppConstants.user.driverName,
                  style: TextStyle(
                      color:AppColors.mainColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp
                  ),),
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
                    Text('حالة الرحلة',
                      style: TextStyle(
                          color:Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp
                      ),),
                    IconButton(onPressed: (){}, icon: Image.asset('assets/icons/trip_status.png',color: AppColors.mainColor,)),
                  ],
                ),
                Text('انتظار',
                  //AppConstants.user.driverName,
                  style: TextStyle(
                      color:AppColors.mainColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp
                  ),),
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
                    Text('اسم السائق',
                      style: TextStyle(
                          color:Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp
                      ),),
                    IconButton(onPressed: (){}, icon: Icon(Icons.person)),
                  ],
                ),
                Text('اسماء',
                  //AppConstants.user.driverName,
                  style: TextStyle(
                      color:AppColors.mainColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp
                  ),),
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
                    Text('مكان التوجه',
                      style: TextStyle(
                          color:Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp
                      ),),
                    IconButton(onPressed: (){}, icon: Icon(Icons.location_on_rounded)),
                  ],
                ),
                Text('اسكندريه ميامي',
                  //AppConstants.user.driverName,
                  style: TextStyle(
                      color:AppColors.mainColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp
                  ),),
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
                    Text('حالة الشبكة',
                      style: TextStyle(
                          color:Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp
                      ),),
                    IconButton(onPressed: (){}, icon: Icon(Icons.wifi)),
                  ],
                ),
                Text(' يوجد شبكة',
                  //AppConstants.user.driverName,
                  style: TextStyle(
                      color:AppColors.mainColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp
                  ),),
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
                    Text('رقم الشاحنة',
                      style: TextStyle(
                          color:Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp
                      ),),
                    Container(
                          height: 25.h,
                            width: 65.w,
                            color: AppColors.mainColor,
                          child: Center(
                            child: Text(HomeCubit.get(context).trip!.truckNumber,
                              style: TextStyle(
                                  color:Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp
                              ),),
                          ),
                        ),
                  ],
                ),
                Text(HomeCubit.get(context).trip!.truckNumber,
                  //AppConstants.user.driverName,
                  style: TextStyle(
                      color:AppColors.mainColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp
                  ),),
                SizedBox(
                  height: 8.h,
                ),
              ],
            ),
          ),
        ),
      ],
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