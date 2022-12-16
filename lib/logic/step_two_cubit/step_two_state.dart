part of 'step_two_cubit.dart';

abstract class StepTwoState {}

class StepTwoInitial extends StepTwoState {}

class StepTwoGetQuestionsLoading extends StepTwoState {}
class StepTwoGetQuestionsSuccess extends StepTwoState {}

class StepTwoGetQuestionsFail extends StepTwoState {
  final String message;
  StepTwoGetQuestionsFail(this.message);
}

class StepTwoStartRequestLoading extends StepTwoState {}
class StepTwoStartRequestSuccess extends StepTwoState {
  String message;
  StepTwoStartRequestSuccess(this.message);
}

class StepTwoStartRequestFail extends StepTwoState {
  final String message;
  StepTwoStartRequestFail(this.message);
}

class StepTwoGetRequestRespondLoading extends StepTwoState {}
class StepTwoGetRequestRespondSuccess extends StepTwoState {
  final String message;
  StepTwoGetRequestRespondSuccess(this.message);
}

class StepTwoGetRequestRespondFail extends StepTwoState {
  final String message;
  StepTwoGetRequestRespondFail(this.message);
}

class StepTwoSubmitAnswerLoading extends StepTwoState{}
class StepTwoSubmitAnswerSuccess extends StepTwoState{
  final String message;
  StepTwoSubmitAnswerSuccess(this.message);
}
class StepTwoSubmitAnswerFail extends StepTwoState{
  final String message;
  StepTwoSubmitAnswerFail(this.message);
}