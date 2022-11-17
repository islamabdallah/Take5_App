// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_two_start_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StepTwoStartRequest _$$_StepTwoStartRequestFromJson(Map json) =>
    _$_StepTwoStartRequest(
      userId: json['userId'] as String,
      tripId: json['tripId'] as int,
      jobsiteId: json['jobsiteId'] as int,
      startingDate: DateTime.parse(json['startingDate'] as String),
    );

Map<String, dynamic> _$$_StepTwoStartRequestToJson(
        _$_StepTwoStartRequest instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'tripId': instance.tripId,
      'jobsiteId': instance.jobsiteId,
      'startingDate': instance.startingDate.toIso8601String(),
    };
