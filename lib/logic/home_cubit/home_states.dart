abstract class HomeStates {}

class InitialHomeState extends HomeStates {}



class HomeGetCurrentTripLoading extends HomeStates {}

class HomeGetCurrentTripSuccess extends HomeStates {}

class HomeGetCurrentTripFail extends HomeStates {
  final String? message;

  HomeGetCurrentTripFail(this.message);
}


class HomeStartTripLoading extends HomeStates {}

class HomeStartTripSuccess extends HomeStates {}

class HomeStartTripFail extends HomeStates {
  final String? message;

  HomeStartTripFail(this.message);
}


class HomeCheckTripStatusLoading extends HomeStates {}

class HomeCheckTripStatusSuccess extends HomeStates {
  final String status;

  HomeCheckTripStatusSuccess(this.status);
}

class HomeCheckTripStatusFail extends HomeStates {
  final String? message;

  HomeCheckTripStatusFail(this.message);
}
class HomeSendTokenSuccess extends HomeStates {}

class HomeSendTokenFail extends HomeStates {
  final String? message;

  HomeSendTokenFail(this.message);
}