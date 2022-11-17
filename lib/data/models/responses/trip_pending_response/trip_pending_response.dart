import 'package:freezed_annotation/freezed_annotation.dart';

import '../../trip/trip.dart';

part 'trip_pending_response.freezed.dart';//same name of file
part 'trip_pending_response.g.dart';

@freezed
class TripPendingResponse with _$TripPendingResponse{
  const factory TripPendingResponse({
    required String message,
    required Trip data,
  }) = _TripPendingResponse;

  factory TripPendingResponse.fromJson(Map<String, dynamic> json) => _$TripPendingResponseFromJson(json);
}
