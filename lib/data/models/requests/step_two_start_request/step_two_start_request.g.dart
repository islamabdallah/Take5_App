// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_two_start_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Take5StepTwoRequestAPIModel _$$_Take5StepTwoRequestAPIModelFromJson(
        Map json) =>
    _$_Take5StepTwoRequestAPIModel(
      userId: json['userId'] as String,
      tripId: json['tripId'] as int,
      jobsiteId: json['jobsiteId'] as int,
      startingDate: DateTime.parse(json['startingDate'] as String),
    );

Map<String, dynamic> _$$_Take5StepTwoRequestAPIModelToJson(
        _$_Take5StepTwoRequestAPIModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'tripId': instance.tripId,
      'jobsiteId': instance.jobsiteId,
      'startingDate': instance.startingDate.toIso8601String(),
    };
