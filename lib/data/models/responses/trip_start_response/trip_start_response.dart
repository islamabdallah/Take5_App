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
   required List<Answer> stepOneQuestions,
   required List<Answer> stepTwoQuestions,
   required List<DangerControlsWithCategoryModel> dangerControlsWithCategoryModels,
  }) = _TakeFiveSurvey;

  factory TakeFiveSurvey.fromJson(Map<String, dynamic> json) => _$TakeFiveSurveyFromJson(json);
}

@freezed
class DangerControlsWithCategoryModel with _$DangerControlsWithCategoryModel {
  const factory DangerControlsWithCategoryModel({
   required String dangerCategory,
   required int dangerCategoryId,
   required List<DangerModel> dangerModels,
  }) = _DangerControlsWithCategoryModel;

  factory DangerControlsWithCategoryModel.fromJson(Map<String, dynamic> json) => _$DangerControlsWithCategoryModelFromJson(json);
}

@freezed
class DangerModel with _$DangerModel {
  const factory DangerModel({
   required int dangerId,
   required String dangerName,
   //required String dangerImage,
   required List<MeasureControlApi> controls,
  }) = _DangerModel;

  factory DangerModel.fromJson(Map<String, dynamic> json) => _$DangerModelFromJson(json);
}
@freezed
class MeasureControlApi with _$MeasureControlApi{
  const factory MeasureControlApi({
    required int MeasureControlId,
    required String MeasureControlName,
  }) = _MeasureControlApi;

  factory MeasureControlApi.fromJson(Map<String, dynamic> json) => _$MeasureControlApiFromJson(json);
}