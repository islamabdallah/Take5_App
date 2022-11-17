import 'package:freezed_annotation/freezed_annotation.dart';

import '../../answer/answer.dart';

part 'step_two_complete_request.freezed.dart';
part 'step_two_complete_request.g.dart';


@freezed
class StepTwoCompleteRequest with _$StepTwoCompleteRequest {
  const factory StepTwoCompleteRequest({
   required String userId,
   required int tripId,
    required int jobSiteId,
   required List<Answer> answers,
   required DateTime createdDate,
  }) = _StepTwoCompleteRequest;

  factory StepTwoCompleteRequest.fromJson(Map<String, dynamic> json) => _$StepTwoCompleteRequestFromJson(json);
}
