// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_one_complete_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SurveyStepOneAnswersAPIModel _$$_SurveyStepOneAnswersAPIModelFromJson(
        Map json) =>
    _$_SurveyStepOneAnswersAPIModel(
      questionAnswerModels: (json['questionAnswerModels'] as List<dynamic>)
          .map((e) =>
              QuestionAnswerModel.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      dangerAPIs: (json['dangerAPIs'] as List<dynamic>)
          .map((e) => DangerModel.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      createdDate: DateTime.parse(json['createdDate'] as String),
    );

Map<String, dynamic> _$$_SurveyStepOneAnswersAPIModelToJson(
        _$_SurveyStepOneAnswersAPIModel instance) =>
    <String, dynamic>{
      'questionAnswerModels':
          instance.questionAnswerModels.map((e) => e.toJson()).toList(),
      'dangerAPIs': instance.dangerAPIs.map((e) => e.toJson()).toList(),
      'createdDate': instance.createdDate.toIso8601String(),
    };
