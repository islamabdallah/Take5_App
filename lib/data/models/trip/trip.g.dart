// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Trip _$$_TripFromJson(Map json) => _$_Trip(
      tripNumber: json['tripNumber'] as int,
      jobsiteName: json['jobsiteName'] as String,
      jobsiteNumber: json['jobsiteNumber'] as int,
      jobsiteHasNetworkCoverage: json['jobsiteHasNetworkCoverage'] as bool,
      driverName: json['driverName'] as String,
      driverNumber: json['driverNumber'] as int,
      truckNumber: json['truckNumber'] as String,
      tripStatus: json['tripStatus'] as String,
      take5Status: json['take5Status'] as String,
      isTripConverted: json['isTripConverted'] as bool,
      Longitude: (json['Longitude'] as num).toDouble(),
      Latituide: (json['Latituide'] as num).toDouble(),
      tripDate: DateTime.parse(json['tripDate'] as String),
    );

Map<String, dynamic> _$$_TripToJson(_$_Trip instance) => <String, dynamic>{
      'tripNumber': instance.tripNumber,
      'jobsiteName': instance.jobsiteName,
      'jobsiteNumber': instance.jobsiteNumber,
      'jobsiteHasNetworkCoverage': instance.jobsiteHasNetworkCoverage,
      'driverName': instance.driverName,
      'driverNumber': instance.driverNumber,
      'truckNumber': instance.truckNumber,
      'tripStatus': instance.tripStatus,
      'take5Status': instance.take5Status,
      'isTripConverted': instance.isTripConverted,
      'Longitude': instance.Longitude,
      'Latituide': instance.Latituide,
      'tripDate': instance.tripDate.toIso8601String(),
    };
