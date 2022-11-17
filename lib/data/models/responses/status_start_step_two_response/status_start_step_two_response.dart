import 'package:freezed_annotation/freezed_annotation.dart';
part 'status_start_step_two_response.freezed.dart';
part 'status_start_step_two_response.g.dart';

@freezed
class StatusStartStepTwoResponse with _$StatusStartStepTwoResponse{
  const factory StatusStartStepTwoResponse({
    required String message,
    required String data,
  }) = _StatusStartStepTwoResponse;
  factory StatusStartStepTwoResponse.fromJson(Map<String, dynamic> json) => _$StatusStartStepTwoResponseFromJson(json);
}