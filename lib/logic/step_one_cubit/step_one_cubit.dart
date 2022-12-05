import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../data/models/answer/answer.dart';
import '../../data/models/requests/step_one_complete_request/step_one_complete_request.dart';
import '../../data/models/responses/trip_pending_response/user_trip_response.dart';
import '../../data/models/responses/trip_start_response/trip_start_response.dart';
import '../../data/repositories/take5_repository.dart';

part 'step_one_state.dart';

class StepOneCubit extends Cubit<StepOneState> {
  final Take5Repository take5Repository;

  static StepOneCubit get(context) => BlocProvider.of(context);

  StepOneCubit({required this.take5Repository}) : super(StepOneInitial());

  List<DangerWithCategoryAPIModels> dangerControlsWithCategory = [];
  DangerWithCategoryAPIModels? selectedCategory;
  DangerModel? selectedDanger;
  List<MeasureControlApi>? selectedControls;

  //view table
  List<DangerModel> dangers = [];
  List<QuestionAnswerModel> step1Answers = [];

  void onChangeSelectedCategory(DangerWithCategoryAPIModels? newCategory) {
    selectedDanger = null;
    selectedControls = null;
    selectedCategory = newCategory;
    emit(StepOneAddDanger());
  }

  void onChangeSelectedDanger(DangerModel? newDanger) {
    selectedControls = null;
    selectedDanger = newDanger;
    emit(StepOneAddDanger());
  }

  void onSelectControls(List<MeasureControlApi> controls) {
    selectedControls = controls;
    print(controls);
    emit(StepOneAddDanger());
  }

  void addDanger() {
    if (selectedControls == null) {
      return;
    }

    DangerModel dangerModel = DangerModel(
        dangerId: selectedDanger!.dangerId,
        dangerName: selectedDanger!.dangerName,
        category: selectedCategory!.dangerCategory,
        measureControlAPIs: selectedControls!);

    bool isDoublicated =
        dangers.any((element) => element.dangerId == dangerModel.dangerId);

    if (isDoublicated) {
      emit(StepOneAddDangerDublicated());
    } else {
      dangers.add(dangerModel);
      selectedCategory = null;
      selectedDanger = null;
      selectedControls = null;
      emit(StepOneAddDanger());
    }
  }

  void removeDanger(DangerModel danger) {
    dangers.remove(danger);
    emit(StepOneRemoveDanger());
  }

  void printSelectedDangers() {}

  getStepOneQuestions() {
    print('test');
    emit(StepOneGetQuestionsLoading());
    final result = take5Repository.getCachedTakeFiveSurvey();
    result.fold((failure) {
      emit(StepOneGetQuestionsFail(failure.message));
    }, (takeFiveSurvey) {
      if (takeFiveSurvey != null) {
        dangerControlsWithCategory = takeFiveSurvey.dangerWithCategoryAPIModels;
        step1Answers = takeFiveSurvey.stepOneQuestions;
        // for (var question in takeFiveSurvey.stepOneQuestions) {
        //   step1Answers.add(Answer(id: question.id, question: question.question));
        // }
      }
      emit(StepOneGetQuestionsSuccess());
    });
  }

  submitAnswers() async {
    emit(StepOneSubmitAnswerLoading());

    SurveyStepOneAnswersAPIModel surveyStepOneAnswersAPIModel =
        SurveyStepOneAnswersAPIModel(
      questionAnswerModels: step1Answers,
      dangerAPIs: dangers,
      createdDate: DateTime.now(),
    );
    print(surveyStepOneAnswersAPIModel.toJson());

    var result = await take5Repository.completeStepOne(
        surveyStepOneAnswersAPIModel: surveyStepOneAnswersAPIModel);
    print(result);
    print("result for step1");

    result.fold((l) => emit(StepOneSubmitAnswerFail(l.message)), (r) {
      print(r);
      emit(StepOneSubmitAnswerSuccess(r));
    });
  }

  bool isQuestions = true;

  void toggleToDangers() {
    isQuestions = false;
    emit(StepOneToggleToDangersSuccess());
  }
}
