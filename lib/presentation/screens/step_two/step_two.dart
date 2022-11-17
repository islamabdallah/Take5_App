import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/datasources/local_data_source.dart';
import '../../../data/models/requests/destination_arrived_request/destination_arrived_request.dart';
import '../../../data/models/responses/trip_start_response/trip_start_response.dart';
import '../../../data/models/trip/trip.dart';
import '../../../injection_container.dart';
import '../../../logic/step_one_cubit/step_one_cubit.dart';
import '../../../logic/step_two_cubit/step_two_cubit.dart';
import '../../utils/helpers/helpers.dart';
import '../../widgets/danger.dart';
import '../../widgets/true_false_question.dart';

class StepTwoScreen extends StatefulWidget {
  static const routeName = 'StepTwoScreen';

  const StepTwoScreen({Key? key}) : super(key: key);

  @override
  State<StepTwoScreen> createState() => _StepTwoScreenState();
}

class _StepTwoScreenState extends State<StepTwoScreen> {
  Map<String, bool> questionAnswer = {};
  Map<String, List<int>> tripDangerMeasureControls = {};

  int c = 1;

  void answerQuestion({required String questionId, required bool value}) {
    questionAnswer[questionId] = value;
    print(questionAnswer);
  }


  @override
  void initState() {
    saveLastRoute(StepTwoScreen.routeName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<StepTwoCubit>()..getStepTwoQuestions(),
      child: BlocConsumer<StepTwoCubit, StepTwoState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = StepTwoCubit.get(context);
          return Scaffold(
              appBar: AppBar(),
              body: state is StepTwoGetQuestionsLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemBuilder: (context, index) => TrueFalseQuestion(
                              questionAnswer: cubit.step2Answers[index],
                            ),
                          itemCount: cubit.step2Answers.length,
                          ),
                      ),
                      ElevatedButton(onPressed: cubit.submitQuestions, child: Text('print')),
                    ],
                  ));
        },
      ),
    );
  }
}
