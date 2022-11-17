import 'package:freezed_annotation/freezed_annotation.dart';

import '../../user/user.dart';

part 'trip_start_request.freezed.dart';//same name of file
part 'trip_start_request.g.dart';

@freezed
class TripStartRequest with _$TripStartRequest{
  const factory TripStartRequest({
    required String userId,
    required int tripId,
    required int jobsiteId,
    required DateTime startingDate,
  }) = _TripStartRequest;

  factory TripStartRequest.fromJson(Map<String, dynamic> json) => _$TripStartRequestFromJson(json);
}
