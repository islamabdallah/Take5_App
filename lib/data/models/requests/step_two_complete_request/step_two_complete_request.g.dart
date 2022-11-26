// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_two_complete_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SurveyStepTwoAnswersAPIModel _$$_SurveyStepTwoAnswersAPIModelFromJson(
        Map json) =>
    _$_SurveyStepTwoAnswersAPIModel(
      questionAnswerModels: (json['questionAnswerModels'] as List<dynamic>)
          .map((e) =>
              QuestionAnswerModel.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      dangerAPIs: (json['dangerAPIs'] as List<dynamic>?)
              ?.map((e) =>
                  DangerModel.fromJson(Map<String, dynamic>.from(e as Map)))
              .toList() ??
          const [],
      createdDate: DateTime.parse(json['createdDate'] as String),
    );

Map<String, dynamic> _$$_SurveyStepTwoAnswersAPIModelToJson(
        _$_SurveyStepTwoAnswersAPIModel instance) =>
    <String, dynamic>{
      'questionAnswerModels':
          instance.questionAnswerModels.map((e) => e.toJson()).toList(),
      'dangerAPIs': instance.dangerAPIs.map((e) => e.toJson()).toList(),
      'createdDate': instance.createdDate.toIso8601String(),
    };
