import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'answer.freezed.dart';
part 'answer.g.dart';

@HiveType(typeId: 1)// unique id
@unfreezed
class QuestionAnswerModel with _$QuestionAnswerModel  {
   factory QuestionAnswerModel({
    @HiveField(0)
    required final int id,
    @HiveField(1)
    required final String question,
    @HiveField(2)
     bool? answer,
  }) = _QuestionAnswerModel;
  factory  QuestionAnswerModel.fromJson(Map<String, dynamic> json) => _$QuestionAnswerModelFromJson(json);
}
