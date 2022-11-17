// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'destination_arrived_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DestinationArrivedRequest _$$_DestinationArrivedRequestFromJson(Map json) =>
    _$_DestinationArrivedRequest(
      userId: json['userId'] as String,
      tripId: json['tripId'] as int,
      jobsiteId: json['jobsiteId'] as int,
      destinationArrivedDate:
          DateTime.parse(json['destinationArrivedDate'] as String),
    );

Map<String, dynamic> _$$_DestinationArrivedRequestToJson(
        _$_DestinationArrivedRequest instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'tripId': instance.tripId,
      'jobsiteId': instance.jobsiteId,
      'destinationArrivedDate':
          instance.destinationArrivedDate.toIso8601String(),
    };
