import 'package:freezed_annotation/freezed_annotation.dart';

import '../../user/user.dart';

part 'step_two_start_request.freezed.dart';//same name of file
part 'step_two_start_request.g.dart';

@freezed
class Take5StepTwoRequestAPIModel with _$Take5StepTwoRequestAPIModel{
  const factory Take5StepTwoRequestAPIModel({
    required DateTime requestDate,
  }) = _Take5StepTwoRequestAPIModel;

  factory Take5StepTwoRequestAPIModel.fromJson(Map<String, dynamic> json) => _$Take5StepTwoRequestAPIModelFromJson(json);
}
