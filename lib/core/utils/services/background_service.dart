import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:take5/core/constants/app_constants.dart';
import 'package:take5/data/models/requests/destination_arrived_request/destination_arrived_request.dart';

import 'loaction_service.dart';

class BackgroundService{

// this will be used as notification channel id
 static const notificationChannelId = 'my_foreground';

// this will be used for notification id, So you can update your custom notification with this id.
  static const notificationId = 888;

  static Future<void> initializeService() async {
    final service = FlutterBackgroundService();

    /// OPTIONAL, using custom notification channel id
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      notificationChannelId, // id
      'MY FOREGROUND SERVICE', // title
      description:
      'This channel is used for important notifications.', // description
      importance: Importance.low, // importance must be at low or higher level
    );

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await service.configure(
      androidConfiguration: AndroidConfiguration(
        // this will be executed when app is in foreground or background in separated isolate
        onStart: onStart,

        // auto start service
        autoStart: false,
        isForegroundMode: true,

        notificationChannelId: notificationChannelId,
        initialNotificationTitle: 'AWESOME SERVICE',
        initialNotificationContent: 'Initializing',
        foregroundServiceNotificationId: notificationId,
      ),

      iosConfiguration: IosConfiguration(
        // auto start service
        autoStart: true,

        // this will be executed when app is in foreground in separated isolate
        onForeground: onStart,

        // you have to enable background fetch capability on xcode project
        onBackground: null,
      ),
    );

    // service.startService();
  }

  @pragma('vm:entry-point')
  static Future<void> onStart(ServiceInstance service) async {
    // Only available for flutter 3.0.0 and later
    DartPluginRegistrant.ensureInitialized();
    if (Platform.isAndroid) FlutterBackgroundServiceAndroid.registerWith();



    if (service is AndroidServiceInstance) {
      service.on('setAsForeground').listen((event) {
        service.setAsForegroundService();
      });

      service.on('setAsBackground').listen((event) {
        service.setAsBackgroundService();
      });
    }

    service.on('stopService').listen((event) {
      service.stopSelf();
    });

    // final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    // FlutterLocalNotificationsPlugin();

    // bring to foreground
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (service is AndroidServiceInstance) {
        if (await service.isForegroundService()) {
          // flutterLocalNotificationsPlugin.show(
          //   notificationId,
          //   'COOL SERVICE',
          //   'Awesome ${DateTime.now()}',
          //   const NotificationDetails(
          //     android: AndroidNotificationDetails(
          //       notificationChannelId,
          //       'MY FOREGROUND SERVICE',
          //       icon: 'ic_bg_service_small',
          //       ongoing: true,
          //     ),
          //   ),
          // );
          // if you don't using custom notification, uncomment this
          var loc = LocationService();
          Position p = await loc.getCurrentLocation();
          print(p);
          Position pp = Position.fromMap(
              {'latitude': 27.1790981, 'longitude': 31.0220375});
         double d=loc.getDistance(p, pp);

         if(d<1000){
           //todo save local
           TripDestinationArrivedModel destinationArrivedRequest = TripDestinationArrivedModel(destinationArrivedDate: DateTime.now());

           SharedPreferences preferences = await SharedPreferences.getInstance();
           // await preferences.reload();
           await preferences.setString("destination", jsonEncode(destinationArrivedRequest.toJson()));
           print(preferences.get("destination"));
           //todo stop timer or service
           timer.cancel();
          service.stopSelf();
         }


          service.setForegroundNotificationInfo(
            title: "My App Service",
            content: "distance: ${d.toInt()} m",
          );
        }
      }
    });

  }

}