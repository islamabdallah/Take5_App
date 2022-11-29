import 'package:freezed_annotation/freezed_annotation.dart';

import '../../answer/answer.dart';
import '../../driver/driver.dart';
import '../../trip/trip.dart';
import '../trip_start_response/trip_start_response.dart';

part 'user_trip_response.freezed.dart';//same name of file
part 'user_trip_response.g.dart';

@freezed
class UserTripResponse with _$UserTripResponse{
  const factory UserTripResponse({
    required String message,
    TripWithSurveyMode? data,
  }) = _UserTripResponse;
  factory UserTripResponse.fromJson(Map<String, dynamic> json) => _$UserTripResponseFromJson(json);
}

@freezed
class TripWithSurveyMode with _$TripWithSurveyMode{
  const factory TripWithSurveyMode({
    required TakeFiveSurvey allSurveyModel,
    required Trip tripAPIModel,
    required List<Driver> drivers
  }) = _TripWithSurveyMode;
  factory TripWithSurveyMode.fromJson(Map<String, dynamic> json) => _$TripWithSurveyModeFromJson(json);
}

@freezed
class TakeFiveSurvey with _$TakeFiveSurvey {
  const factory TakeFiveSurvey({
    required List<QuestionAnswerModel> stepOneQuestions,
    required List<QuestionAnswerModel> stepTwoQuestions,
    required List<DangerWithCategoryAPIModels> dangerWithCategoryAPIModels,
  }) = _TakeFiveSurvey;

  factory TakeFiveSurvey.fromJson(Map<String, dynamic> json) => _$TakeFiveSurveyFromJson(json);
}

@freezed
class DangerWithCategoryAPIModels with _$DangerWithCategoryAPIModels {
  const factory DangerWithCategoryAPIModels({
    required String dangerCategory,
    required int dangerCategoryId,
    required List<DangerModel> dangerModels,
  }) = _DangerWithCategoryAPIModels;

  factory DangerWithCategoryAPIModels.fromJson(Map<String, dynamic> json) => _$DangerWithCategoryAPIModelsFromJson(json);
}

@freezed
class DangerModel with _$DangerModel {
  const factory DangerModel({
    required int dangerId,
    required String dangerName,
    @JsonKey(ignore: true)String? category,
    //required String dangerImage,
    required List<MeasureControlApi> measureControlAPIs,
  }) = _DangerModel;

  factory DangerModel.fromJson(Map<String, dynamic> json) => _$DangerModelFromJson(json);
}
@freezed
class MeasureControlApi with _$MeasureControlApi{
  const factory MeasureControlApi({
    required int measureControlId,
    required String measureControlName,
  }) = _MeasureControlApi;

  factory MeasureControlApi.fromJson(Map<String, dynamic> json) => _$MeasureControlApiFromJson(json);
}
