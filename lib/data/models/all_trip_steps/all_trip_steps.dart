import 'package:freezed_annotation/freezed_annotation.dart';

import '../requests/destination_arrived_request/destination_arrived_request.dart';
import '../requests/step_one_complete_request/step_one_complete_request.dart';
import '../requests/step_two_complete_request/step_two_complete_request.dart';
import '../requests/step_two_start_request/step_two_start_request.dart';
import '../requests/trip_start_request/trip_start_request.dart';
import '../take5_together/take5_together.dart';


part 'all_trip_steps.freezed.dart';//same name of file
part 'all_trip_steps.g.dart';

@freezed
class AllTripStepsModel with _$AllTripStepsModel{
  const factory AllTripStepsModel({
    String? userId,
    int? tripId,
    int? jobsiteId,

    TripDestinationArrivedModel? tripDestinationArrivedModel,
    SurveyStepOneAnswersAPIModel? surveyStepOneAnswersAPIModel,
    Take5StepTwoRequestAPIModel? take5StepTwoRequestAPIModel,
    SurveyStepTwoAnswersAPIModel? surveyStepTwoAnswersAPIModel,
    Take5TogetherModel? take5TogetherAPIModels,

    String? endStatus
  }) = _AllTripStepsModel;

  factory AllTripStepsModel.fromJson(Map<String, dynamic> json) => _$AllTripStepsModelFromJson(json);
}
