import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:take5/core/constants/app_constants.dart';
import 'package:take5/data/models/requests/step_two_start_request/step_two_start_request.dart';

import '../../data/data.dart';
import '../../data/models/answer/answer.dart';
import '../../data/models/responses/trip_start_response/trip_start_response.dart';
import '../../data/repositories/take5_repository.dart';
import '../../presentation/widgets/danger.dart';

part 'step_two_state.dart';

class StepTwoCubit extends Cubit<StepTwoState> {
  final Take5Repository take5Repository;

  static StepTwoCubit get(context) => BlocProvider.of(context);

  StepTwoCubit({required this.take5Repository}) : super(StepTwoInitial());

  List<Answer> step2Answers = [];

  void getStepTwoQuestions() {
    emit(StepTwoGetQuestionsLoading());
    final result = take5Repository.getCachedTakeFiveSurvey();
    result.fold((failure) {
      emit(StepTwoGetQuestionsFail(failure.message));
    }, (takeFiveSurvey) {
      if (takeFiveSurvey != null) {
        for (var question in takeFiveSurvey.stepTwoQuestions) {
          step2Answers
              .add(Answer(id: question.id, question: question.question));
        }
      }
      print(takeFiveSurvey?.stepTwoQuestions.length);
      print(step2Answers.length);
      emit(StepTwoGetQuestionsSuccess());
    });
  }

  void submitQuestions() {
    print(step2Answers);
  }

  Future<void> stepTwoStartRequest() async {
    emit(StepTwoStartRequestLoading());
    final result = await take5Repository.startStepTwo(
        stepTwoStartRequest: StepTwoStartRequest(
            userId: AppConstants.user.userId,
            tripId: AppConstants.trip.tripNumber,
            jobsiteId: AppConstants.trip.jobsiteNumber,
            startingDate: DateTime.now()));

    result.fold(
      (failure) => emit(StepTwoStartRequestFail(failure.message)),
      (_) => emit(StepTwoStartRequestSuccess()),
    );
  }
}
