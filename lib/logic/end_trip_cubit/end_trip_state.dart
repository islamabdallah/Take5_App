part of 'end_trip_cubit.dart';

@immutable
abstract class EndTripState {}

class EndTripInitial extends EndTripState {}


class EndTripLoading extends EndTripState {}

class EndTripSuccess extends EndTripState {}

class EndTripFail extends EndTripState {
  final String? message;

  EndTripFail(this.message);
}
