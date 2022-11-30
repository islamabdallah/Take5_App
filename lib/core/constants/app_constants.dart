
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/requests/destination_arrived_request/destination_arrived_request.dart';
import '../../data/models/trip/trip.dart';
import '../../data/models/user/user.dart';
import 'app_colors.dart';


class AppConstants {
  AppConstants._();
  static var scaffoldKey = GlobalKey<ScaffoldState>();
  static var navigatorKey = GlobalKey<NavigatorState>();

  static late User user;
  static late Trip trip;
  static late TripDestinationArrivedModel dar;
  //static late bool mobileData;

// text styles
  static final titleTextStyle = TextStyle(
    color: AppColors.whiteGreyColor,
    fontSize: 16.sp,
    fontFamily: "Cairo",
    fontWeight: FontWeight.w700,
  );

  static final backgroundService = FlutterBackgroundService();
  static startBackgroundService() async {
    if(!await backgroundService.isRunning()){
      await backgroundService.startService();
    }
  }
  static sendDataToBackgroudnService() async {
    backgroundService.invoke('startTrip',{
      'trip':AppConstants.trip.toJson(),
      'user':AppConstants.user.toJson(),
    });
  }

 static stopService()async
  {
    var isRunning = await backgroundService.isRunning();
    if (isRunning == true) {
      backgroundService.invoke("stopService");
    }
  }
}
