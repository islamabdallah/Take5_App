part of 'step_one_cubit.dart';

@immutable
abstract class StepOneState {}

class StepOneInitial extends StepOneState {}

class StepOneAddDanger extends StepOneState {}
class StepOneAddDangerDublicated extends StepOneState {}

class StepOneRemoveDanger extends StepOneState {}

class StepOneGetQuestionsLoading extends StepOneState {}
class StepOneGetQuestionsSuccess extends StepOneState {}

class StepOneGetQuestionsFail extends StepOneState{
  final String message;
  StepOneGetQuestionsFail(this.message);
}
class StepOneGetDangerControlsWithCategoryModelsLoading extends StepOneState {}
class StepOneGetDangerControlsWithCategoryModelsSuccess extends StepOneState {}

class StepOneGetDangerControlsWithCategoryModelsFail extends StepOneState{
  final String message;
  StepOneGetDangerControlsWithCategoryModelsFail(this.message);
}
class StepOneToggleToDangersSuccess extends StepOneState {}

class StepOneSubmitAnswerLoading extends StepOneState{}
class StepOneSubmitAnswerSuccess extends StepOneState{
  String message;

  StepOneSubmitAnswerSuccess(this.message);
}
class StepOneSubmitAnswerFail extends StepOneState{
  final String message;
  StepOneSubmitAnswerFail(this.message);
}