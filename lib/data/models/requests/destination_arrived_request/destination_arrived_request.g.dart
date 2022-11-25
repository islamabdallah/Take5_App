// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'destination_arrived_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TripDestinationArrivedModel _$$_TripDestinationArrivedModelFromJson(
        Map json) =>
    _$_TripDestinationArrivedModel(
      destinationArrivedDate:
          DateTime.parse(json['destinationArrivedDate'] as String),
    );

Map<String, dynamic> _$$_TripDestinationArrivedModelToJson(
        _$_TripDestinationArrivedModel instance) =>
    <String, dynamic>{
      'destinationArrivedDate':
          instance.destinationArrivedDate.toIso8601String(),
    };
