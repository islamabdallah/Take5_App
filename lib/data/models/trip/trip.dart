import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip.freezed.dart';

part 'trip.g.dart';

@freezed
class Trip with _$Trip {
  const factory Trip({
    required int tripNumber,
    required String jobsiteName,
    required int jobsiteNumber,
    required bool jobsiteHasNetworkCoverage,
    required double longitude,
    required double latituide,
    required String driverName,
    required int driverNumber,
    required String truckNumber,
    required String tripStatus,
    required String take5Status,
    required bool isTripConverted,
    required DateTime tripDate,
  }) = _Trip;

  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);
}
