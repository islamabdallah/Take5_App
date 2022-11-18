import 'package:freezed_annotation/freezed_annotation.dart';

import '../../trip/trip.dart';

part 'user_trip_response.freezed.dart';//same name of file
part 'user_trip_response.g.dart';

@freezed
class UserTripResponse with _$UserTripResponse{
  const factory UserTripResponse({
    required String message,
    required Trip data,
  }) = _UserTripResponse;

  factory UserTripResponse.fromJson(Map<String, dynamic> json) => _$UserTripResponseFromJson(json);
}
