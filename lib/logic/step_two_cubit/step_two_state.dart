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
