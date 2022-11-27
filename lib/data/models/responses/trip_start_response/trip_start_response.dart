import 'package:freezed_annotation/freezed_annotation.dart';


part 'trip_start_response.freezed.dart';
part 'trip_start_response.g.dart';

@freezed
class TripStartResponse with _$TripStartResponse {
  const factory TripStartResponse({
    required String message,
    required bool data,
  }) = _TripStartResponse;

  factory TripStartResponse.fromJson(Map<String, dynamic> json) => _$TripStartResponseFromJson(json);
}
