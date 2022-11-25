import 'package:freezed_annotation/freezed_annotation.dart';

import '../../user/user.dart';

part 'destination_arrived_request.freezed.dart';//same name of file
part 'destination_arrived_request.g.dart';

@freezed
class TripDestinationArrivedModel with _$TripDestinationArrivedModel{
  const factory TripDestinationArrivedModel({
    required DateTime destinationArrivedDate,
  }) = _TripDestinationArrivedModel;

  factory TripDestinationArrivedModel.fromJson(Map<String, dynamic> json) => _$TripDestinationArrivedModelFromJson(json);
}
