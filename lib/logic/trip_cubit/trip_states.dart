abstract class TripStates {}

class InitialTripState extends TripStates {}
class StartTripLoadingTripState extends TripStates {}
class StartTripSuccessTripState extends TripStates {}
class StartTripFailTripState extends TripStates {}

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