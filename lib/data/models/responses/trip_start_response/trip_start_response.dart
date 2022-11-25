import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:take5/data/models/answer/answer.dart';


part 'trip_start_response.freezed.dart';
part 'trip_start_response.g.dart';

@freezed
class TripStartResponse with _$TripStartResponse {
  const factory TripStartResponse({
    required String message,
    required TakeFiveSurvey data,
  }) = _TripStartResponse;

  factory TripStartResponse.fromJson(Map<String, dynamic> json) => _$TripStartResponseFromJson(json);
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