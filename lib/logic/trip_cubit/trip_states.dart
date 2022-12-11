abstract class TripStates {}

class InitialTripState extends TripStates {}
class StartTripLoadingTripState extends TripStates {}
class StartTripSuccessTripState extends TripStates {}
class ArrivedLoadingTripState extends TripStates {}
class ArrivedDoneTripState extends TripStates {}
class ArrivedSuccessTripState extends TripStates {
  final String message;
  ArrivedSuccessTripState(this.message);
}
class ArrivedFailTripState extends TripStates {
  final String message;
  ArrivedFailTripState(this.message);
}


//
//
// class HomeGetPendingTripLoading extends TripStates {}
//
// class HomeGetPendingTripSuccess extends TripStates {}
//
// class HomeGetPendingTripFail extends TripStates {
//   final String? message;
//
//   HomeGetPendingTripFail(this.message);
// }