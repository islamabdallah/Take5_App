// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_one_complete_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StepOneCompleteRequest _$$_StepOneCompleteRequestFromJson(Map json) =>
    _$_StepOneCompleteRequest(
      userId: json['userId'] as String,
      jobSiteId: json['jobSiteId'] as int,
      tripId: json['tripId'] as int,
      answers: (json['answers'] as List<dynamic>)
          .map((e) => Answer.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      dangers: (json['dangers'] as List<dynamic>)
          .map((e) => DangerModel.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      createdDate: DateTime.parse(json['createdDate'] as String),
    );

Map<String, dynamic> _$$_StepOneCompleteRequestToJson(
        _$_StepOneCompleteRequest instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'jobSiteId': instance.jobSiteId,
      'tripId': instance.tripId,
      'answers': instance.answers.map((e) => e.toJson()).toList(),
      'dangers': instance.dangers.map((e) => e.toJson()).toList(),
      'createdDate': instance.createdDate.toIso8601String(),
    };
