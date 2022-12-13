import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:take5/core/constants/app_constants.dart';
import 'package:take5/data/repositories/take5_repository.dart';
import 'package:take5/presentation/utils/dialogs/message_dialog.dart';

import '../../../core/firebase/push_notification_service.dart';
import '../../../data/datasources/boxes.dart';
import '../../../data/datasources/local_data_source.dart';
import '../../../data/models/trip/trip.dart';
import '../../../injection_container.dart';
import '../../screens/home/home.dart';
import '../../screens/login/login_screen.dart';

void logOut(BuildContext context) {
  //clear global cubits state
  // HomeCubit.get(context).clearData();


  sl<Take5Repository>()
      .sendCollection()
      .then((value) =>
      value.fold((l) {
        print(l.message);
        showMessageDialog(context: context,
            isSucceeded: false,
            message: "لا يمكنك تسجيل الخروج");
      }, (r) {
        sl<Take5Repository>().clearUser().fold((l) => print(l.message),
                (r) {
              final service = FlutterBackgroundService();
              service.invoke('stopService');
              print("success logout");
              showMessageDialog(context: context,
                  isSucceeded: true,
                  message: "تم تسجيل الخروج بنجاح!",
                  onPressedOk: () {
                    //Navigate to login screen
                    Navigator.of(AppConstants.navigatorKey.currentContext!)
                        .pushNamedAndRemoveUntil(
                        LoginScreen.routeName, (Route<dynamic> route) => false);
                  });
            });
      }));


  //clear FCM token
  // PushNotificationService.deleteDeviceToken();

  //clear cached data

  SharedPreferences.getInstance().then((value) async {
    await value.reload();
    return value.clear();
  });


}

Future<void> saveLastRoute(String route) async {
  var box = Boxes.getRouteBox();
  box.put('LAST_ROUTE', route);
}

String getLastRoute() {
  var userBox = Boxes.getUser();
  var user = userBox.get('user');
  if (user == null) {
    return LoginScreen.routeName;
  }
  AppConstants.user = user;
  var routeBox = Boxes.getRouteBox();
  String? lastRoute = routeBox.get('LAST_ROUTE');
  if (lastRoute == null) {
    return LoginScreen.routeName;
  } else if (lastRoute != HomeScreen.routeName) {
    var takeFiveBox = Boxes.getTakeFiveBox();
    AppConstants.trip =
        Trip.fromJson(Map<String, dynamic>.from(takeFiveBox.get('trip')));
    print(AppConstants.trip);
  }
  print(lastRoute);
  return lastRoute;
}

String tripStatusArabic(String triStatus) {
  switch (triStatus) {
    case 'Pending':
      return 'لم يتم بدأ الرحلة بعد';
    case 'Started':
      return 'تم بدأ الرحلة';
    case 'DestinationArrived':
      return 'تم الوصول للموقع';
    case 'SurveyStepOneCompleted':
      return 'تم انهاء المرحلة الاولي';
    case 'StepTwoRequested':
      return 'تم ارسال طلب البدأ في المرحلة الثانية';
    case 'StepTwoResponse':
      return 'تم الاستجابة علي طلب البدأ في المرحلة الثانية';
    case 'SurveyStepTwoCompleted':
      return 'تم انهاء المرحلة الثانية';
    default:
      return '';
  }
}

// Future<bool> checkDeviceConnectivity() async {
//   var connectivityResult = await Connectivity().checkConnectivity();
//   if (connectivityResult == ConnectivityResult.mobile ||
//       connectivityResult == ConnectivityResult.wifi) {
//     return true;
//   } else {
//     return false;
//   }
// }
// checkNetworkAvailability(){
//
// }
