import 'package:freezed_annotation/freezed_annotation.dart';

import '../../answer/answer.dart';
import '../../responses/trip_start_response/trip_start_response.dart';

part 'step_two_complete_request.freezed.dart';
part 'step_two_complete_request.g.dart';


@freezed
class SurveyStepTwoAnswersAPIModel with _$SurveyStepTwoAnswersAPIModel {
  const factory SurveyStepTwoAnswersAPIModel({
   required List<QuestionAnswerModel> questionAnswerModels,
    @Default([]) List<DangerModel> dangerAPIs,
   required DateTime createdDate,
  }) = _SurveyStepTwoAnswersAPIModel;

  factory SurveyStepTwoAnswersAPIModel.fromJson(Map<String, dynamic> json) => _$SurveyStepTwoAnswersAPIModelFromJson(json);
}
