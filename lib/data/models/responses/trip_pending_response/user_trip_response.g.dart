// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_trip_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserTripResponse _$$_UserTripResponseFromJson(Map json) =>
    _$_UserTripResponse(
      message: json['message'] as String,
      data: Trip.fromJson(Map<String, dynamic>.from(json['data'] as Map)),
    );

Map<String, dynamic> _$$_UserTripResponseToJson(_$_UserTripResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data.toJson(),
    };
