import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:take5/data/models/answer/answer.dart';

import '../../responses/trip_pending_response/user_trip_response.dart';

part 'step_one_complete_request.freezed.dart';
part 'step_one_complete_request.g.dart';

@freezed
class SurveyStepOneAnswersAPIModel with _$SurveyStepOneAnswersAPIModel {
  const factory SurveyStepOneAnswersAPIModel({
    required List<QuestionAnswerModel> questionAnswerModels,
    required List<DangerModel> dangerAPIs,
    required DateTime createdDate,
  }) = _SurveyStepOneAnswersAPIModel;

  factory SurveyStepOneAnswersAPIModel.fromJson(Map<String, dynamic> json) =>
      _$SurveyStepOneAnswersAPIModelFromJson(json);
}
