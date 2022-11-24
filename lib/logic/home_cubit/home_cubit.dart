import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take5/data/models/requests/trip_start_request/trip_start_request.dart';
import '../../core/constants/app_constants.dart';
import '../../data/models/trip/trip.dart';
import '../../data/repositories/take5_repository.dart';
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
      emit(HomeGetCurrentTripSuccess());
    });
  }

  Future<void> startTrip() async {
    emit(HomeStartTripLoading());
    final result = await take5Repository.startTrip(
        //todo change this
        tripStartRequest: TripStartRequest(
            userId: '1',
            tripId: 1,
            jobsiteId: 1,
            startingDate: DateTime.now()));
    result.fold((failure) {
      emit(HomeStartTripFail(failure.message));
    }, (startTripResponse) {
      emit(HomeStartTripSuccess());
    });
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
