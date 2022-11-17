import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import 'notifcation_service.dart';

class PushNotificationService {

  static init(context) async {
    // await FirebaseMessaging.instance.getToken();
    await getDeviceToken();
    await subscribeToTopicAll();

    // workaround for onLaunch: When the app is completely closed (not in the background) and opened directly from the push notification
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
       // Navigator.pushNamed(context, NotificationScreen.routeName);
      }
    });

    // onMessage: When the app is open and it receives a push notification
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');
      // FlutterAppBadger.updateBadgeCount(1);

      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        print(
            'Message also contained a notification:\n${message.notification!.title}\n${message.notification!.body}');

        // HomeCubit.get(context).changeNotificationCount(
        //     HomeCubit.get(context).userUnSeenNotificationCount + 1);

        LocalNotificationService notificationService = LocalNotificationService();
        notificationService.initializeNotification();
        notificationService.notifun = () {
        //  Navigator.pushNamedAndRemoveUntil(context, NotificationScreen.routeName, ModalRoute.withName(MainScreen.routeName));
        };
        notificationService.displayNotification(
          id: notification.hashCode,
          title: notification.title,
          body: notification.body,
        );
      }
    });

    // replacement for onResume: When the app is in the background and opened directly from the push notification.
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Got a message whilst in the background!');
     // Navigator.pushNamedAndRemoveUntil(context, NotificationScreen.routeName, ModalRoute.withName(MainScreen.routeName));
    });

    FirebaseMessaging.instance.onTokenRefresh
        .listen((fcmToken) {
     // _sendTokenToServer(fcmToken);
    });
  }

  static getDeviceToken() async {
    String? deviceToken = await FirebaseMessaging.instance.getToken();
    print("deviceFirebase Token: $deviceToken");
    if(deviceToken!=null) {
     // _sendTokenToServer(deviceToken);
    }
    // LocalStorageService().setToken(deviceToken);
    return deviceToken;
  }

  static subscribeToTopicAll() async {
    await FirebaseMessaging.instance.subscribeToTopic('all');
  }

  static unsubscribeFromTopicAll() async {
    await FirebaseMessaging.instance.unsubscribeFromTopic('all');
  }

  static deleteDeviceToken() async {
    await unsubscribeFromTopicAll();
    await FirebaseMessaging.instance.deleteToken();
  }

  // static _sendTokenToServer(String token) {
  //   RemoteDataSource remoteDataSource = sl<RemoteDataSource>();
  //   remoteDataSource
  //       .updateUserToken(id: AppConstants.userResponse.data?.id??'', token: token)
  //       .then((value) => print(value));
  // }
// static serialiseAndNavigate(Map<String, dynamic> message, context) {
//   var notificationData = message['data'];
//   var view = notificationData['view'];
//   if (view != null) {
//     // navigate
//     Navigator.pushNamed(context, view, arguments: message['data']);
//   }
// }
}
