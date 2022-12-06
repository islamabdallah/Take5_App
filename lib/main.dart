import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:take5/logic/home_cubit/home_states.dart';
import 'package:take5/presentation/screens/home/home.dart';
import 'package:take5/presentation/screens/step_one/preparing_step.dart';
import 'package:take5/presentation/screens/step_one/step_one_questions.dart';
import 'package:take5/presentation/screens/step_two/step_two.dart';
import 'package:take5/presentation/screens/step_two_waiting/step_two_waiting_screen.dart';
import 'package:take5/presentation/screens/take5_together/take5_together.dart';
import 'package:take5/presentation/screens/trip/trip.dart';
import 'package:take5/presentation/utils/dialogs/loading_dialog.dart';
import 'package:take5/presentation/utils/dialogs/message_dialog.dart';
import 'core/bloc_observer.dart';
import 'core/config/routes/routes.dart';
import 'core/constants/app_assets.dart';
import 'core/constants/app_colors.dart';
import 'core/constants/app_constants.dart';
import 'core/constants/app_endpoints.dart';
import 'core/utils/services/background_service.dart';
import 'core/utils/services/loaction_service.dart';
import 'data/models/all_trip_steps/all_trip_steps.dart';
import 'data/models/requests/destination_arrived_request/destination_arrived_request.dart';
import 'data/models/trip/trip.dart';
import 'data/models/user/user.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';
import 'logic/home_cubit/home_cubit.dart';
import 'logic/take5_together_cubit/take5_together_cubit.dart';
import 'presentation/screens/end_trip/end_trip.dart';
import 'presentation/screens/login/login_screen.dart';
import 'presentation/screens/step_two_waiting/step_two_start_request_screen.dart';
import 'presentation/utils/helpers/helpers.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';

Future<void> initializeService() async {
  final service = FlutterBackgroundService();

  /// OPTIONAL, using custom notification channel id
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'my_foreground', // id
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
      autoStart: true,
      isForegroundMode: true,

      notificationChannelId: 'my_foreground',
      initialNotificationTitle: 'AWESOME SERVICE',
      initialNotificationContent: 'Initializing',
      foregroundServiceNotificationId: 888,
    ),
    iosConfiguration: IosConfiguration(
      // auto start service
      autoStart: false,

      // this will be executed when app is in foreground in separated isolate
      onForeground: onStart,

      // you have to enable background fetch capability on xcode project
      onBackground: onIosBackground,
    ),
  );

  // service.startService();
}

// to ensure this is executed
// run app from xcode, then from xcode menu, select Simulate Background Fetch

@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();

  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.reload();
  final log = preferences.getStringList('log') ?? <String>[];
  log.add(DateTime.now().toIso8601String());
  await preferences.setStringList('log', log);

  return true;
}


@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  // Only available for flutter 3.0.0 and later
  DartPluginRegistrant.ensureInitialized();

  // For flutter prior to version 3.0.0
  // We have to register the plugin manually

  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.setString("hello", "world");

  /// OPTIONAL when use custom notification
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

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

  Trip? trip;
  User? user;

  service.on('startTrip').listen((data) {
    // print('yes');
    if(data!=null){
    trip = Trip.fromJson(data["trip"]);
    user = User.fromJson(data["user"]);
    }
    print(trip);
    print(user);
  });
  // bring to foreground
  Timer.periodic(const Duration(seconds: 1), (timer) async {
    if (service is AndroidServiceInstance) {
      if (await service.isForegroundService()) {
        /// OPTIONAL for use custom notification
        /// the notification id must be equals with AndroidConfiguration when you call configure() method.

        double d = double.maxFinite;
        if (trip != null && user!=null) {
          var loc = LocationService();
          Position p = await loc.getCurrentLocation();
          print(p);
          Position pp = Position.fromMap(
              {'latitude': trip!.latituide, 'longitude': trip!.longitude});
          d = loc.getDistance(p, pp);

          if (d <= 1000) {
            //todo save local
            TripDestinationArrivedModel destinationArrivedRequest =
                TripDestinationArrivedModel(
                    destinationArrivedDate: DateTime.now());

            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            // await preferences.reload();
            await preferences.setString(
                "destination", jsonEncode(destinationArrivedRequest.toJson()));
            print(preferences.get("destination"));

            //todo send to server
            if (trip!.jobsiteHasNetworkCoverage) {
              var dio = Dio();
              try {
                Response response = await dio.post(
                  AppEndpoints.sendTripUpdate,
                  data: AllTripStepsModel(
                      userId: user!.userId,
                      tripId: trip!.tripNumber,
                      jobsiteId: trip!.jobsiteNumber,
                      tripDestinationArrivedModel: destinationArrivedRequest,
                      endStatus: 'DestinationArrived'),
                );
                await preferences.setBool('isArrived', true);
              } on DioError catch (e) {
              } catch (e) {}
            }

            //todo stop timer or service
            timer.cancel();
            service.stopSelf();
          }
        }

        flutterLocalNotificationsPlugin.show(
          888,
          ' المسافة المتبقية',
          " ${(d/1000).toStringAsFixed(2)} كم ",
          // 'Awesome ${DateTime.now()}',
          const NotificationDetails(
            android: AndroidNotificationDetails(
              'my_foreground',
              'MY FOREGROUND SERVICE',
              icon: 'ic_bg_service_small',
              ongoing: true,
            ),
          ),
        );

        // if you don't using custom notification, uncomment this
        // service.setForegroundNotificationInfo(
        //   title: "My App Service",
        //   content: "Updated at ${DateTime.now()}",
        // );
      }
    }
  });
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await di.init();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>('user');
  await Hive.openBox('route');
  await Hive.openBox('takeFiveSurvey');
  // await BackgroundService().initializeService();
  // await initializeService();


  Location location =  Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      return;
    }
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return;
    }
  }

  //todo remove this
  getLastRoute();

  BlocOverrides.runZoned(
    () {
      runApp(
        EasyLocalization(
          path: AppAssets.appTranslations,
          supportedLocales: const [
            Locale('en'),
            Locale('ar'),
          ],
          fallbackLocale: const Locale('en'),
          startLocale: const Locale('ar'),
          child: const MyApp(),
        ),
      );
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      // splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<HomeCubit>(create: (context) => sl<HomeCubit>()),
            // BlocProvider<Take5TogetherCubit>(create: (context) => sl<Take5TogetherCubit>()),
          ],
          child: MaterialApp(
            navigatorKey: AppConstants.navigatorKey,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.backgroundColor,
              primarySwatch: AppColors.materialMainColor,
              iconTheme: IconThemeData(color: AppColors.mainColor),
              fontFamily: 'Vazirmatn',
              // textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
              // useMaterial3: true,
            ),
            builder: (_, child) {
              return BlocListener<HomeCubit, HomeStates>(
                listener: (context, state) {
                  var context = AppConstants.navigatorKey.currentContext!;
                  // final context = navigatorKey.currentState!.overlay!.context;
                  if (state is HomeCheckTripStatusLoading) {
                    loadingAlertDialog(context);
                  }
                  if (state is HomeCheckTripStatusSuccess) {
                    // final context = navigatorKey.currentState!.overlay!.context;
                    Navigator.pop(context);
                    switch (state.status) {
                      case 'Done':
                        showMessageDialog(
                          context: context,
                          isSucceeded: true,
                          message: 'لا يوجد تغيير في الرحلة',
                        );
                        break;
                      case 'Cancelled':
                        showMessageDialog(
                            context: context,
                            isSucceeded: true,
                            message: 'تم الغاء الرحلة',
                            onPressedOk: () {
                              Navigator.pushNamedAndRemoveUntil(context,
                                  HomeScreen.routeName, (route) => false);
                            });

                        break;
                      case 'Converted':
                        showMessageDialog(
                            context: context,
                            isSucceeded: true,
                            message: 'تم تحويل الرحلة',
                            onPressedOk: () {
                              Navigator.pushNamedAndRemoveUntil(context,
                                  HomeScreen.routeName, (route) => false);
                            });
                        break;
                      default:
                    }
                  }
                  if (state is HomeCheckTripStatusFail) {
                    // final context = navigatorKey.currentState!.overlay!.context;
                    Navigator.pop(context);
                    showMessageDialog(
                    context: context,
        isSucceeded: false,
        message: 'لا يمكن معرفة حالة الرحلة',
        );
                    }

                },
                child: child,
              );
            },
            onGenerateRoute: AppRoutes.onGenerateRoutes,
            // initialRoute: getLastRoute(),
            // initialRoute: LoginScreen.routeName,
            // initialRoute: StepTwoWaitingScreen.routeName,
            // initialRoute: StepOneQuestionsScreen.routeName,
            // initialRoute: PreparingStepScreen.routeName,
            // initialRoute: StepOneDangersScreen.routeName,
            // initialRoute: HomeScreen.routeName,
            // initialRoute: StepTwoScreen.routeName,
            // initialRoute: TripScreen.routeName,
            initialRoute: Take5TogetherScreen.routeName,
            //  initialRoute: EndTripScreen.routeName,
           // initialRoute: StepTwoStartRequestScreen.routeName,
            // initialRoute: StepTwoWaitingScreen.routeName,
          ),
        );
      },
    );
  }
}
