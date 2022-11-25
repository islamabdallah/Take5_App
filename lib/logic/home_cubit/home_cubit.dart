import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take5/data/models/requests/trip_start_request/trip_start_request.dart';
import 'package:take5/presentation/screens/step_one/step_one_questions.dart';
import '../../core/constants/app_constants.dart';
import '../../data/models/trip/trip.dart';
import '../../data/repositories/take5_repository.dart';
import '../../presentation/screens/end_trip/end_trip.dart';
import '../../presentation/screens/step_two/step_two.dart';
import '../../presentation/screens/step_two_waiting/step_two_start_request_screen.dart';
import '../../presentation/screens/step_two_waiting/step_two_waiting_screen.dart';
import '../../presentation/screens/trip/trip.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  static HomeCubit get(context) => BlocProvider.of(context);
  final Take5Repository take5Repository;

  HomeCubit({required this.take5Repository}) : super(InitialHomeState());

  Trip? trip;

  Future<void> getCurrentTrip() async {
    emit(HomeGetCurrentTripLoading());
    final result =
    await take5Repository.getCurrentTrip(userId: AppConstants.user.userId);
    result.fold((failure) {
      emit(HomeGetCurrentTripFail(failure.message));
    }, (tripPendingResponse) {
      trip = tripPendingResponse.data;
      AppConstants.trip = tripPendingResponse.data;
      emit(HomeGetCurrentTripSuccess());
    });
  }

  Future<void> startTrip() async {
    emit(HomeStartTripLoading());
    final result = await take5Repository.startTrip(
        tripStartRequest: TripStartRequest(
            userId: AppConstants.user.userId,
            tripId: AppConstants.trip.tripNumber,
            jobsiteId: AppConstants.trip.jobsiteNumber,
            startingDate: DateTime.now()));
    result.fold((failure) {
      emit(HomeStartTripFail(failure.message));
    }, (startTripResponse) {
      emit(HomeStartTripSuccess());
    });
  }

  void continueTrip(BuildContext context) async {
    switch (trip!.tripStatus) {
      case 'Started':
        Navigator.pushReplacementNamed(context, TripScreen.routeName);
        break;
      case 'DestinationArrived':
        Navigator.pushReplacementNamed(context, StepOneQuestionsScreen.routeName);
        break;
      case 'SurveyStepOneCompleted':
        Navigator.pushReplacementNamed(context, StepTwoStartRequestScreen.routeName);
        break;
      case 'StepTwoRequested':
        Navigator.pushReplacementNamed(context, StepTwoWaitingScreen.routeName);
        break;
      case 'StepTwoResponsed':
        Navigator.pushReplacementNamed(context, StepTwoScreen.routeName);
        break;
        //todo change this to take5together and add one for end trip screen
      case 'SurveyStepTwoCompleted':
        Navigator.pushReplacementNamed(context, EndTripScreen.routeName);
        break;

      default:
    }
  }

  Future<void> checkTripStatus() async {
    emit(HomeCheckTripStatusLoading());
    final result = await take5Repository.checkTripStatus();
    result.fold((failure) {
      emit(HomeCheckTripStatusFail(failure.message));
    }, (status) {
      emit(HomeCheckTripStatusSuccess(status));
    });
  }
}
