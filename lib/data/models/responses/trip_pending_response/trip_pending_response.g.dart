// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_pending_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TripPendingResponse _$$_TripPendingResponseFromJson(Map json) =>
    _$_TripPendingResponse(
      message: json['message'] as String,
      data: Trip.fromJson(Map<String, dynamic>.from(json['data'] as Map)),
    );

Map<String, dynamic> _$$_TripPendingResponseToJson(
        _$_TripPendingResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data.toJson(),
    };
