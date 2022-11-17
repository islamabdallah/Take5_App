import 'package:freezed_annotation/freezed_annotation.dart';

import '../../user/user.dart';

part 'step_two_start_request.freezed.dart';//same name of file
part 'step_two_start_request.g.dart';

@freezed
class StepTwoStartRequest with _$StepTwoStartRequest{
  const factory StepTwoStartRequest({
    required String userId,
    required int tripId,
    required int jobsiteId,
    required DateTime startingDate,
  }) = _StepTwoStartRequest;

  factory StepTwoStartRequest.fromJson(Map<String, dynamic> json) => _$StepTwoStartRequestFromJson(json);
}
