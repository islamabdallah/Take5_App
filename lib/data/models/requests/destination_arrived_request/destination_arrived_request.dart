import 'package:freezed_annotation/freezed_annotation.dart';

import '../../user/user.dart';

part 'destination_arrived_request.freezed.dart';//same name of file
part 'destination_arrived_request.g.dart';

@freezed
class DestinationArrivedRequest with _$DestinationArrivedRequest{
  const factory DestinationArrivedRequest({
    required String userId,
    required int tripId,
    required int jobsiteId,
    required DateTime destinationArrivedDate,
  }) = _DestinationArrivedRequest;

  factory DestinationArrivedRequest.fromJson(Map<String, dynamic> json) => _$DestinationArrivedRequestFromJson(json);
}
