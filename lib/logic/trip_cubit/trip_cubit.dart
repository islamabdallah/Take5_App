import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:take5/data/models/requests/destination_arrived_request/destination_arrived_request.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/services/loaction_service.dart';
import '../../data/repositories/take5_repository.dart';
import 'trip_states.dart';

class TripCubit extends Cubit<TripStates> {
  static TripCubit get(context) => BlocProvider.of(context);
  final Take5Repository take5Repository;

  //final InternetBloc internetBloc;
  TripCubit({required this.take5Repository}) : super(InitialTripState());
  double? d;
  var sub;

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
   bool? isArrived = preferences.getBool('isArrived');
   if(isArrived!=null&& isArrived){
     enableButton();
     emit(ArrivedSuccessTripState());
     return;
   }


    bool iSTripArrivedSuccess = false;
    await preferences.reload();
    String? destination = preferences.getString("destination");
    if (destination != null) {
     var result = await take5Repository.arrivedToDestination(
          tripDestinationArrivedModel:
              TripDestinationArrivedModel.fromJson(jsonDecode(destination)));


     result.fold((l) => null, (r) {
       enableButton();
       stopService();
       iSTripArrivedSuccess = true;
       emit(ArrivedSuccessTripState());
     });
    }
    if(iSTripArrivedSuccess){
      print('ssssssssss');
      return;
    }
    print('tttttttttttt');

    if(destination==null){
      AppConstants.startBackgroundService();
      Future.delayed(Duration(seconds: 5), () {
        AppConstants.sendDataToBackgroudnService();
      });
    }

    sub = loc.subscribeEvent((currentPosition) async {
      Position destination = Position.fromMap({
        'latitude': AppConstants.trip.latituide,
        'longitude': AppConstants.trip.longitude
      });
      d = loc.getDistance(currentPosition, destination);
      // d=100;
      if (d != null && d! <= 1000) {
        var result = await take5Repository.arrivedToDestination(
          tripDestinationArrivedModel: TripDestinationArrivedModel(
              destinationArrivedDate: DateTime.now()),
        );
        result.fold((l) => null, (r) async {
          stopService();
          print(r);
          enableButton();
          await sub?.cancel();
      emit(ArrivedSuccessTripState());
      return;
        });
      }

      emit(StartTripSuccessTripState());
    }, 400); //كل 400 متر بيحسب
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

  @override
  Future<void> close() async {
    await sub?.cancel();
    return super.close();
  }
}
