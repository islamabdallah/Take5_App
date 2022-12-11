import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:bloc/bloc.dart';

import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:take5/data/models/requests/destination_arrived_request/destination_arrived_request.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_endpoints.dart';
import '../../core/utils/services/loaction_service.dart';
import '../../data/models/all_trip_steps/all_trip_steps.dart';
import '../../data/models/trip/trip.dart';
import '../../data/models/user/user.dart';
import '../../data/repositories/take5_repository.dart';
import 'trip_states.dart';

class TripCubit extends Cubit<TripStates> {
  static TripCubit get(context) => BlocProvider.of(context);
  final Take5Repository take5Repository;

  //final InternetBloc internetBloc;
  TripCubit({required this.take5Repository}) : super(InitialTripState());
  double? d;
  var sub;
  TripDestinationArrivedModel? tripDestinationArrivedModel;
  bool? isArrivedSent;
  bool? isArrived;

  start() async {
    emit(StartTripLoadingTripState());
    await LocationService().checkPermission();

    // AppConstants.backgroundService.invoke("stopService");

    var loc = LocationService();
    //
    // p = await loc.getCurrentLocation();
    // print(p);
    // Position pp =
    //     Position.fromMap({'latitude': 27.1790981, 'longitude': 31.0220375});
    // d = loc.getDistance(p!, pp);
    // emit(StartTripSuccessTripState()); //setstate
    //
    //
    //todo code to check background service
    SharedPreferences preferences = await SharedPreferences.getInstance();
    isArrivedSent = preferences.getBool('isArrived');
    if (isArrivedSent != null && isArrivedSent == true) {
      enableButton();
      isArrived=true;
      emit(ArrivedDoneTripState());
      return;
    }

    await preferences.reload();
    String? destination = preferences.getString("destination");
    if (destination != null) {
      isArrived=true;
      tripDestinationArrivedModel =
          TripDestinationArrivedModel.fromJson(jsonDecode(destination));
      var result = await take5Repository.arrivedToDestination(
          tripDestinationArrivedModel: tripDestinationArrivedModel!);

      result.fold((l) => null, (r) {
        enableButton();
        stopService();
        isArrivedSent = true;
        emit(ArrivedDoneTripState());
      });
    }

    if (destination != null) {
      enableButton();
      emit(ArrivedDoneTripState());
      return;
    }

    if (destination == null) {
      // AppConstants.startBackgroundService();
      initializeService();
      Future.delayed(Duration(seconds: 5), () async {
        Position destination = Position.fromMap({
          'latitude': AppConstants.trip.latituide,
          'longitude': AppConstants.trip.longitude
        });
        d = loc.getDistance(await loc.getCurrentLocation(), destination);
        AppConstants.sendDataToBackgroudnService(d!);
      });

      sub = loc.subscribeEvent((currentPosition) async {
        Position destination = Position.fromMap({
          'latitude': AppConstants.trip.latituide,
          'longitude': AppConstants.trip.longitude
        });
        d = loc.getDistance(currentPosition, destination);
        // d=100;
        if (d != null && d! <= 1000) {
          isArrived=true;
          enableButton();
          emit(ArrivedDoneTripState());
          tripDestinationArrivedModel = TripDestinationArrivedModel(
              destinationArrivedDate: DateTime.now());
          var result = await take5Repository.arrivedToDestination(
            tripDestinationArrivedModel: tripDestinationArrivedModel!,
          );
          result.fold((l) => null, (r) async {
            stopService();
            print(r);
            enableButton();
            emit(ArrivedDoneTripState());
            isArrivedSent = true;
            await sub?.cancel();
            return;
          });
        }

        emit(StartTripSuccessTripState());
      }, 400); //كل 400 متر بيحسب
    }
  }

  stopService() async {
    final service = FlutterBackgroundService();
    var isRunning = await service.isRunning();
    if (isRunning == true) {
      service.invoke("stopService");
    }
  }

  bool isButtonEnabled = false;

  void enableButton() {
    isButtonEnabled = true;
  }

  submitArrival() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool? isArrived = preferences.getBool('isArrived');
    if (isArrived != null && isArrived) {
      return true;
    } else {
      emit(ArrivedLoadingTripState());
      var result = await take5Repository.arrivedToDestination(
          tripDestinationArrivedModel: tripDestinationArrivedModel!);
      result.fold((l) => emit(ArrivedFailTripState(l.message)),
          (r) => emit(ArrivedSuccessTripState(r)));
    }
  }

  @override
  Future<void> close() async {
    await sub?.cancel();

    return super.close();
  }
}


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
  double d = double.maxFinite;
  service.on('startTrip').listen((data) {
    // print('yes');
    if(data!=null){
      trip = Trip.fromJson(data["trip"]);
      user = User.fromJson(data["user"]);
      d = data["distance"];
    }
    print(trip);
    print(user);
  });

  // bring to foreground
  var loc = LocationService();

  StreamSubscription sub = loc.subscribeEvent((currentPosition) async {
    if(service is AndroidServiceInstance){
      if(await service.isForegroundService()) {
        if (trip != null && user != null) {
          Position destination = Position.fromMap({
            'latitude': trip!.latituide,
            'longitude': trip!.longitude
          });
          d = loc.getDistance(currentPosition, destination);
          //d=100;
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