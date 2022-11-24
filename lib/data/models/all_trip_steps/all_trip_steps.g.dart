// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_trip_steps.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AllTripStepsModel _$$_AllTripStepsModelFromJson(Map json) =>
    _$_AllTripStepsModel(
      userId: json['userId'] as String?,
      tripId: json['tripId'] as int?,
      jobsiteId: json['jobsiteId'] as int?,
      destinationArrivedRequest: json['destinationArrivedRequest'] == null
          ? null
          : DestinationArrivedRequest.fromJson(Map<String, dynamic>.from(
              json['destinationArrivedRequest'] as Map)),
      stepOneCompleteRequest: json['stepOneCompleteRequest'] == null
          ? null
          : StepOneCompleteRequest.fromJson(
              Map<String, dynamic>.from(json['stepOneCompleteRequest'] as Map)),
      stepTwoStartRequest: json['stepTwoStartRequest'] == null
          ? null
          : StepTwoStartRequest.fromJson(
              Map<String, dynamic>.from(json['stepTwoStartRequest'] as Map)),
      stepTwoCompleteRequest: json['stepTwoCompleteRequest'] == null
          ? null
          : StepTwoCompleteRequest.fromJson(
              Map<String, dynamic>.from(json['stepTwoCompleteRequest'] as Map)),
      take5TogetherAPIModels: json['take5TogetherAPIModels'] == null
          ? null
          : Take5TogetherModel.fromJson(
              Map<String, dynamic>.from(json['take5TogetherAPIModels'] as Map)),
      endStatus: json['endStatus'] as String?,
    );

Map<String, dynamic> _$$_AllTripStepsModelToJson(
        _$_AllTripStepsModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'tripId': instance.tripId,
      'jobsiteId': instance.jobsiteId,
      'destinationArrivedRequest': instance.destinationArrivedRequest?.toJson(),
      'stepOneCompleteRequest': instance.stepOneCompleteRequest?.toJson(),
      'stepTwoStartRequest': instance.stepTwoStartRequest?.toJson(),
      'stepTwoCompleteRequest': instance.stepTwoCompleteRequest?.toJson(),
      'take5TogetherAPIModels': instance.take5TogetherAPIModels?.toJson(),
      'endStatus': instance.endStatus,
    };
