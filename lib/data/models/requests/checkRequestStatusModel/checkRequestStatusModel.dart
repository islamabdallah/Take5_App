import 'package:freezed_annotation/freezed_annotation.dart';


part 'checkRequestStatusModel.freezed.dart';
part 'checkRequestStatusModel.g.dart';

@freezed
class CheckRequestStatusModel with _$CheckRequestStatusModel {
  const factory CheckRequestStatusModel({
    required String userId,
    required int TripId,
    required int JobsiteId,
  }) = _CheckRequestStatusModel;

  factory CheckRequestStatusModel.fromJson(Map<String, dynamic> json) => _$CheckRequestStatusModelFromJson(json);
}