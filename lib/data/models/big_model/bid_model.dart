import 'package:freezed_annotation/freezed_annotation.dart';

import '../requests/destination_arrived_request/destination_arrived_request.dart';
import '../requests/step_one_complete_request/step_one_complete_request.dart';
import '../requests/step_two_complete_request/step_two_complete_request.dart';
import '../requests/step_two_start_request/step_two_start_request.dart';
import '../requests/trip_start_request/trip_start_request.dart';


part 'bid_model.freezed.dart';//same name of file
part 'bid_model.g.dart';

@freezed
class CollectionModel with _$CollectionModel{
  const factory CollectionModel({
    String? userId,
    int? tripId,
    int? jobsiteId,

    //todo end
    DestinationArrivedRequest? destinationArrivedRequest,
    StepOneCompleteRequest? stepOneCompleteRequest,
    StepTwoStartRequest? stepTwoStartRequest,
    StepTwoCompleteRequest? stepTwoCompleteRequest,

  }) = _CollectionModel;

  factory CollectionModel.fromJson(Map<String, dynamic> json) => _$CollectionModelFromJson(json);
}
