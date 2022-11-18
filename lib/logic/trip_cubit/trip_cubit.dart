import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:take5/data/models/requests/trip_start_request/trip_start_request.dart';

import '../../core/constants/app_constants.dart';
import '../../core/utils/services/loaction_service.dart';
import '../../data/repositories/take5_repository.dart';
import 'trip_states.dart';

class TripCubit extends Cubit<TripStates> {
  static TripCubit get(context) => BlocProvider.of(context);
  final Take5Repository take5Repository;
  //final InternetBloc internetBloc;
  TripCubit({required this.take5Repository}) : super(InitialTripState());
  Position? p;
  double? d;
  var sub;
  start() async {
    emit(StartTripLoadingTripState());
    var loc = LocationService();
    p = await loc.getCurrentLocation();
    Position pp =
    Position.fromMap({'latitude': 27.1790981, 'longitude': 31.0220375});
    d = loc.getDistance(p!, pp);
    emit(StartTripSuccessTripState());//setstate
    sub=loc.subscribeEvent((p) {
      this.p = p;
      Position pp =
      Position.fromMap({'latitude': 27.1790981, 'longitude': 31.0220375});
      d = loc.getDistance(p, pp);
     d=100;
      if(d!=null && d!<1000 )
        {
          enableButton();

        }
      emit(StartTripSuccessTripState());//setstate
    }, 100);
  }
  bool isButtonEnabled=false;
  void enableButton()
  {
    isButtonEnabled=true;
  }
  @override
  Future<void> close() async{
    await sub?.cancel();
    return super.close();
  }
}
