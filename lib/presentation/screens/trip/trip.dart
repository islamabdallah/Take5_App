import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:take5/presentation/widgets/drawer_widget.dart';
import 'package:take5/presentation/widgets/powered_by_cemex.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_endpoints.dart';
import '../../../core/utils/services/loaction_service.dart';
import '../../../data/models/all_trip_steps/all_trip_steps.dart';
import '../../../data/models/requests/destination_arrived_request/destination_arrived_request.dart';
import '../../../data/models/trip/trip.dart';
import '../../../data/models/user/user.dart';
import '../../../injection_container.dart';
import '../../../logic/trip_cubit/trip_cubit.dart';
import '../../../logic/trip_cubit/trip_states.dart';
import '../../utils/helpers/helpers.dart';
import '../step_one/step_one_questions.dart';

Future<void> initializeService() async {
  final service = FlutterBackgroundService();
  await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      autoStart: true,
      isForegroundMode: true,
    ),
    iosConfiguration: IosConfiguration(
      autoStart: false,
      onForeground: onStart,
    ),
  );
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  // Only available for flutter 3.0.0 and later
  DartPluginRegistrant.ensureInitialized();

  // For flutter prior to version 3.0.0
  // We have to register the plugin manually

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
  var loc = LocationService();
      double d = double.maxFinite;
  StreamSubscription sub = loc.subscribeEvent((currentPosition) async {
  if(service is AndroidServiceInstance){
    if(await service.isForegroundService()) {
      if (trip != null && user != null) {
        Position destination = Position.fromMap({
          'latitude': trip!.latituide,
          'longitude': trip!.longitude
        });
        d = loc.getDistance(currentPosition, destination);
        // d=100;
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
            } on DioError catch (e) {} catch (e) {}
          }
          //todo stop timer or service
          service.stopSelf();
        }
      }
    }
  service.setForegroundNotificationInfo(
    title: "My App Service",
    content: "Updated at ${DateTime.now()}\nمتبقي ${(d/1000).toStringAsFixed(2)} كم ",
  );
  }


  }, 100); //كل 400 متر بيحسب



}

class TripScreen extends StatefulWidget {
  static const routeName = 'TripScreen';

  const TripScreen({Key? key}) : super(key: key);

  @override
  State<TripScreen> createState() => _TripScreenState();
}

class _TripScreenState extends State<TripScreen> {
  @override
  void initState() {
    saveLastRoute(TripScreen.routeName);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await initializeService();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TripCubit>()..start(),
      child: BlocConsumer<TripCubit, TripStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = TripCubit.get(context);
          return Scaffold(
            drawer: const DrawerWidget(),
            appBar: AppBar(
              leading: Builder(builder: (context) {
                return IconButton(
                    icon: const Icon(Icons.menu_open),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    });
              }),
              toolbarHeight: 80,
              elevation: 0,
              iconTheme: const IconThemeData(color: AppColors.redColor),
              title: const Text(
                'المسافة',
                style: TextStyle(color: AppColors.redColor),
              ),
              backgroundColor: Colors.white,
              centerTitle: true,
            ),
            body: Center(
              child: Column(
                children: [
                  const Spacer(),
                  Container(
                    width: 274.w,
                    height: 470.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x3f000000),
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: state is StartTripLoadingTripState
                        ? const Center(child: CircularProgressIndicator())
                        : Column(
                            children: [
                              Container(
                                width: 241.w,
                                child: Lottie.asset(AppAssets.truck,
                                    fit: BoxFit.cover),
                              ),
                              Text(
                                state is ArrivedSuccessTripState
                                    ? 'تم التوصيل'
                                    : " متبقي ${(cubit.d! / 1000).toStringAsFixed(2)} كم ",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Color(0xff5d5d5d),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: ElevatedButton(
                                  onPressed: cubit.isButtonEnabled
                                      ? () {
                                          Navigator.pushNamedAndRemoveUntil(
                                              context,
                                              StepOneQuestionsScreen.routeName,
                                              (route) => false);
                                        }
                                      : null,
                                  child: Text('املأ الاستمارة'),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          8.r), // <-- Radius
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    final service = FlutterBackgroundService();
                                    var isRunning = await service.isRunning();
                                    if (isRunning) {
                                      service.invoke("stopService");
                                    }
                                  },
                                  child: Text('stop service'),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          8.r), // <-- Radius
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.h),
                            ],
                          ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  const PoweredByCemex(),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
