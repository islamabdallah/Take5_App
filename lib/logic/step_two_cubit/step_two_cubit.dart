import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:take5/core/constants/app_constants.dart';
import 'package:take5/data/models/all_trip_steps/all_trip_steps.dart';
import 'package:take5/data/models/requests/step_two_start_request/step_two_start_request.dart';
import '../../data/models/answer/answer.dart';
import '../../data/models/requests/step_two_complete_request/step_two_complete_request.dart';
import '../../data/repositories/take5_repository.dart';
part 'step_two_state.dart';

class StepTwoCubit extends Cubit<StepTwoState> {
  final Take5Repository take5Repository;

  static StepTwoCubit get(context) => BlocProvider.of(context);

  StepTwoCubit({required this.take5Repository}) : super(StepTwoInitial());

  List<QuestionAnswerModel> step2Answers = [];

  void getStepTwoQuestions() {
    emit(StepTwoGetQuestionsLoading());
    final result = take5Repository.getCachedTakeFiveSurvey();
    result.fold((failure) {
      emit(StepTwoGetQuestionsFail(failure.message));
    }, (takeFiveSurvey) {
      if (takeFiveSurvey != null) {
        step2Answers = takeFiveSurvey.stepTwoQuestions;
        // for (var question in takeFiveSurvey.stepTwoQuestions) {
        //   step2Answers
        //       .add(Answer(id: question.id, question: question.question));
        // }
      }
      print(takeFiveSurvey?.stepTwoQuestions.length);
      print(step2Answers.length);
      emit(StepTwoGetQuestionsSuccess());
    });
  }

  void submitAnswers() async {
    emit(StepTwoSubmitAnswerLoading());

    SurveyStepTwoAnswersAPIModel surveyStepTwoAnswersAPIModel =
        SurveyStepTwoAnswersAPIModel(
      questionAnswerModels: step2Answers,
      createdDate: DateTime.now(),
    );
    print(surveyStepTwoAnswersAPIModel.toJson());

    var result = await take5Repository.completeStepTwo(
        surveyStepTwoAnswersAPIModel: surveyStepTwoAnswersAPIModel);
    result.fold((l) => emit(StepTwoSubmitAnswerFail(l.message)), (r) {
      print(r);
      emit(StepTwoSubmitAnswerSuccess());
    });
  }

  Future<void> stepTwoStartRequest() async {
    emit(StepTwoStartRequestLoading());
    final result = await take5Repository.startStepTwo(
        take5StepTwoRequestAPIModel:
            Take5StepTwoRequestAPIModel(requestDate: DateTime.now()));
    result.fold(
      (failure) => emit(StepTwoStartRequestFail(failure.message)),
      (_) => emit(StepTwoStartRequestSuccess()),
    );
  }

  Future<void> getStepTwoStartRequestRespond() async {
    emit(StepTwoGetRequestRespondLoading());
    final result = await take5Repository.getStepTwoStartRequestRespond(
      allTripStepsModel: AllTripStepsModel(
          userId: AppConstants.user.userId,
          tripId: AppConstants.trip.tripNumber,
          jobsiteId: AppConstants.trip.jobsiteNumber),
    );
    result.fold(
      (failure) => emit(StepTwoGetRequestRespondFail(failure.message)),
      (isDone) => emit(StepTwoGetRequestRespondSuccess(isDone)),
    );
  }
}
