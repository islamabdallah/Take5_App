// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_trip_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserTripResponse _$$_UserTripResponseFromJson(Map json) =>
    _$_UserTripResponse(
      message: json['message'] as String,
      data: TripWithSurveyMode.fromJson(
          Map<String, dynamic>.from(json['data'] as Map)),
    );

Map<String, dynamic> _$$_UserTripResponseToJson(_$_UserTripResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data.toJson(),
    };

_$_TripWithSurveyMode _$$_TripWithSurveyModeFromJson(Map json) =>
    _$_TripWithSurveyMode(
      allSurveyModel: TakeFiveSurvey.fromJson(
          Map<String, dynamic>.from(json['allSurveyModel'] as Map)),
      tripAPIModel:
          Trip.fromJson(Map<String, dynamic>.from(json['tripAPIModel'] as Map)),
      drivers: (json['drivers'] as List<dynamic>)
          .map((e) => Driver.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$_TripWithSurveyModeToJson(
        _$_TripWithSurveyMode instance) =>
    <String, dynamic>{
      'allSurveyModel': instance.allSurveyModel.toJson(),
      'tripAPIModel': instance.tripAPIModel.toJson(),
      'drivers': instance.drivers.map((e) => e.toJson()).toList(),
    };

_$_TakeFiveSurvey _$$_TakeFiveSurveyFromJson(Map json) => _$_TakeFiveSurvey(
      stepOneQuestions: (json['stepOneQuestions'] as List<dynamic>)
          .map((e) =>
              QuestionAnswerModel.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      stepTwoQuestions: (json['stepTwoQuestions'] as List<dynamic>)
          .map((e) =>
              QuestionAnswerModel.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      dangerWithCategoryAPIModels:
          (json['dangerWithCategoryAPIModels'] as List<dynamic>)
              .map((e) => DangerWithCategoryAPIModels.fromJson(
                  Map<String, dynamic>.from(e as Map)))
              .toList(),
    );

Map<String, dynamic> _$$_TakeFiveSurveyToJson(_$_TakeFiveSurvey instance) =>
    <String, dynamic>{
      'stepOneQuestions':
          instance.stepOneQuestions.map((e) => e.toJson()).toList(),
      'stepTwoQuestions':
          instance.stepTwoQuestions.map((e) => e.toJson()).toList(),
      'dangerWithCategoryAPIModels':
          instance.dangerWithCategoryAPIModels.map((e) => e.toJson()).toList(),
    };

_$_DangerWithCategoryAPIModels _$$_DangerWithCategoryAPIModelsFromJson(
        Map json) =>
    _$_DangerWithCategoryAPIModels(
      dangerCategory: json['dangerCategory'] as String,
      dangerCategoryId: json['dangerCategoryId'] as int,
      dangerModels: (json['dangerModels'] as List<dynamic>)
          .map((e) => DangerModel.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$_DangerWithCategoryAPIModelsToJson(
        _$_DangerWithCategoryAPIModels instance) =>
    <String, dynamic>{
      'dangerCategory': instance.dangerCategory,
      'dangerCategoryId': instance.dangerCategoryId,
      'dangerModels': instance.dangerModels.map((e) => e.toJson()).toList(),
    };

_$_DangerModel _$$_DangerModelFromJson(Map json) => _$_DangerModel(
      dangerId: json['dangerId'] as int,
      dangerName: json['dangerName'] as String,
      measureControlAPIs: (json['measureControlAPIs'] as List<dynamic>)
          .map((e) =>
              MeasureControlApi.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$_DangerModelToJson(_$_DangerModel instance) =>
    <String, dynamic>{
      'dangerId': instance.dangerId,
      'dangerName': instance.dangerName,
      'measureControlAPIs':
          instance.measureControlAPIs.map((e) => e.toJson()).toList(),
    };

_$_MeasureControlApi _$$_MeasureControlApiFromJson(Map json) =>
    _$_MeasureControlApi(
      measureControlId: json['measureControlId'] as int,
      measureControlName: json['measureControlName'] as String,
    );

Map<String, dynamic> _$$_MeasureControlApiToJson(
        _$_MeasureControlApi instance) =>
    <String, dynamic>{
      'measureControlId': instance.measureControlId,
      'measureControlName': instance.measureControlName,
    };
