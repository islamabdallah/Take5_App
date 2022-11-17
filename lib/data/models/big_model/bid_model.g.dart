// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bid_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CollectionModel _$$_CollectionModelFromJson(Map json) => _$_CollectionModel(
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
    );

Map<String, dynamic> _$$_CollectionModelToJson(_$_CollectionModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'tripId': instance.tripId,
      'jobsiteId': instance.jobsiteId,
      'destinationArrivedRequest': instance.destinationArrivedRequest?.toJson(),
      'stepOneCompleteRequest': instance.stepOneCompleteRequest?.toJson(),
      'stepTwoStartRequest': instance.stepTwoStartRequest?.toJson(),
      'stepTwoCompleteRequest': instance.stepTwoCompleteRequest?.toJson(),
    };
