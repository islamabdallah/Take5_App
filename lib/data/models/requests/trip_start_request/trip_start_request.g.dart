// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_start_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TripStartRequest _$$_TripStartRequestFromJson(Map json) =>
    _$_TripStartRequest(
      userId: json['userId'] as String,
      tripId: json['tripId'] as int,
      jobsiteId: json['jobsiteId'] as int,
      startingDate: DateTime.parse(json['startingDate'] as String),
    );

Map<String, dynamic> _$$_TripStartRequestToJson(_$_TripStartRequest instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'tripId': instance.tripId,
      'jobsiteId': instance.jobsiteId,
      'startingDate': instance.startingDate.toIso8601String(),
    };
