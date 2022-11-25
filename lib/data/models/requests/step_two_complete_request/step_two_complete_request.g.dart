// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_two_complete_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SurveyStepTwoAnswersAPIModel _$$_SurveyStepTwoAnswersAPIModelFromJson(
        Map json) =>
    _$_SurveyStepTwoAnswersAPIModel(
      userId: json['userId'] as String,
      tripId: json['tripId'] as int,
      jobSiteId: json['jobSiteId'] as int,
      answers: (json['answers'] as List<dynamic>)
          .map((e) => Answer.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      createdDate: DateTime.parse(json['createdDate'] as String),
    );

Map<String, dynamic> _$$_SurveyStepTwoAnswersAPIModelToJson(
        _$_SurveyStepTwoAnswersAPIModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'tripId': instance.tripId,
      'jobSiteId': instance.jobSiteId,
      'answers': instance.answers.map((e) => e.toJson()).toList(),
      'createdDate': instance.createdDate.toIso8601String(),
    };
