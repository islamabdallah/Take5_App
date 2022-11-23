part of 'step_two_cubit.dart';

@immutable
abstract class StepTwoState {}

class StepTwoInitial extends StepTwoState {}

class StepTwoGetQuestionsLoading extends StepTwoState {}
class StepTwoGetQuestionsSuccess extends StepTwoState {}

class StepTwoGetQuestionsFail extends StepTwoState {
  final String message;
  StepTwoGetQuestionsFail(this.message);
}

class StepTwoStartRequestLoading extends StepTwoState {}
class StepTwoStartRequestSuccess extends StepTwoState {}

class StepTwoStartRequestFail extends StepTwoState {
  final String message;
  StepTwoStartRequestFail(this.message);
}

class StepTwoGetRequestRespondLoading extends StepTwoState {}
class StepTwoGetRequestRespondSuccess extends StepTwoState {
  final bool isDone;
  StepTwoGetRequestRespondSuccess(this.isDone);
}

class StepTwoGetRequestRespondFail extends StepTwoState {
  final String message;
  StepTwoGetRequestRespondFail(this.message);
}