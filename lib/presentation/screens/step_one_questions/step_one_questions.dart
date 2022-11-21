import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:take5/presentation/screens/step_one_questions/widgets/selected_dangers.dart';
import '../../../injection_container.dart';
import '../../../logic/step_one_cubit/step_one_cubit.dart';
import '../../utils/helpers/helpers.dart';
import '../../widgets/danger.dart';
import '../../widgets/true_false_question.dart';

class StepOneQuestionsScreen extends StatefulWidget {
  static const routeName = 'StepOneScreen';

  const StepOneQuestionsScreen({Key? key}) : super(key: key);

  @override
  State<StepOneQuestionsScreen> createState() => _StepOneQuestionsScreenState();
}

class _StepOneQuestionsScreenState extends State<StepOneQuestionsScreen> {
  Map<String, bool> questionAnswer = {};
  Map<String, List<int>> tripDangerMeasureControls = {};

  int c = 1;

  void answerQuestion({required String questionId, required bool value}) {
    questionAnswer[questionId] = value;
    print(questionAnswer);
  }

  void addTripDanger() {}

  @override
  void initState() {
    saveLastRoute(StepOneQuestionsScreen.routeName);
    stopService();
    super.initState();
  }

  stopService()async
  {
    final service = FlutterBackgroundService();
    var isRunning = await service.isRunning();
    if (isRunning == true) {
      service.invoke("stopService");
    }
    // await Hive.openBox('destinationArrivedRequest');
    // final box = Boxes.getDestinationArrivedRequestBox();
    // Map<String, dynamic> json =
    // Map<String, dynamic>.from(box.get('destinationArrivedRequest'));
    // print(DestinationArrivedRequest.fromJson(json));
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<StepOneCubit>()..getStepOneQuestions(),
      child: BlocConsumer<StepOneCubit, StepOneState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = StepOneCubit.get(context);
          final _formKey = GlobalKey<FormBuilderState>();
          return Scaffold(
              appBar: AppBar(
                title:const Text('اسئله المرحله الاولى'),
                centerTitle: true,
              ),
              body: SingleChildScrollView(
                child: FormBuilder(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.always,
                  child:cubit.isQuestions?
                  Column(
                    children: [
                      state is StepOneGetQuestionsLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (context, index) =>
                                  TrueFalseQuestion(
                                questionAnswer: cubit.step1Answers[index],
                              ),
                              itemCount: cubit.step1Answers.length,
                            ),
                      ElevatedButton(
                          onPressed: () {
                            //_formKey.currentState?.validate()==true
                            cubit.toggleToDangers();
                          },
                          child:Text("next".tr())),                    ],
                  ):
                  Column(
                    children: [
                      ...List.generate(c, (index) => const Danger(),),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          itemCount: cubit.dangers.length,
                          itemBuilder:(context,index)=>SelectedDangerWidget(),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            //_formKey.currentState?.validate()==true
                            cubit.submitAnswers();
                          },
                          child:Text("end step 1".tr())),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
