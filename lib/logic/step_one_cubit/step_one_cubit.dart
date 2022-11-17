import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../data/models/answer/answer.dart';
import '../../data/models/responses/trip_start_response/trip_start_response.dart';
import '../../data/repositories/take5_repository.dart';


part 'step_one_state.dart';

class StepOneCubit extends Cubit<StepOneState> {
  final Take5Repository take5Repository;
  static StepOneCubit get(context) => BlocProvider.of(context);

  StepOneCubit({required this.take5Repository}) : super(StepOneInitial());


  List<DangerControlsWithCategoryModel> dangerControlsWithCategory = [];
  DangerControlsWithCategoryModel? selectedCategory;
  DangerModel? selectedDanger;
  List<MeasureControlApi>? selectedControls;

  //view table
  List<DangerModel> dangers=[];
  List<Answer> step1Answers = [];

  void onChangeSelectedCategory(DangerControlsWithCategoryModel? newCategory) {
    selectedDanger=null;
    selectedControls = null;
    selectedCategory = newCategory;
    emit(StepOneAddDanger());
  }
  void onChangeSelectedDanger(DangerModel? newDanger) {
    selectedControls=null;
    selectedDanger=newDanger;
    emit(StepOneAddDanger());
  }
  void onSelectControls(List<MeasureControlApi> controls) {
    selectedControls=controls;
    print(controls);
    emit(StepOneAddDanger());
  }

  void addDanger() {
    if(selectedControls==null){
      return;
    }
    DangerModel dangerModel = DangerModel(dangerId: selectedDanger!.dangerId, dangerName: selectedDanger!.dangerName, controls: selectedControls!);
    dangers.add(dangerModel);

    selectedCategory=null;
    selectedDanger=null;
    selectedControls = null;
    emit(StepOneAddDanger());
  }

  void removeDanger(DangerModel danger) {
    dangers.remove(danger);
    emit(StepOneRemoveDanger());
  }

  void printSelectedDangers(){
  }
  getStepOneQuestions() {
    print('test');
    emit(StepOneGetQuestionsLoading());
    final result = take5Repository.getCachedTakeFiveSurvey();
    result.fold((failure) {
      emit(StepOneGetQuestionsFail(failure.message));
    }, (takeFiveSurvey) {
      if (takeFiveSurvey != null) {
        dangerControlsWithCategory=takeFiveSurvey.dangerControlsWithCategoryModels;
        for (var question in takeFiveSurvey.stepOneQuestions) {
          step1Answers.add(Answer(id: question.id, question: question.question));
        }
      }
      emit(StepOneGetQuestionsSuccess());
    });
  }
  submitAnswers()
  {
    print(step1Answers);
    print(dangers);
  }
}