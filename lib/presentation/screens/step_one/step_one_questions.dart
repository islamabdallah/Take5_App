import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take5/presentation/screens/step_one/widgets/selected_dangers.dart';
import 'package:take5/presentation/screens/step_two_waiting/step_two_start_request_screen.dart';
import 'package:take5/presentation/utils/dialogs/loading_dialog.dart';
import 'package:take5/presentation/utils/dialogs/message_dialog.dart';
import '../../../core/constants/app_colors.dart';
import '../../../injection_container.dart';
import '../../../logic/step_one_cubit/step_one_cubit.dart';
import '../../utils/helpers/helpers.dart';
import '../../widgets/danger.dart';
import '../../widgets/drawer_widget.dart';
import '../../widgets/main_button.dart';
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

  stopService() async {
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
        listener: (context, state) {
          if (state is StepOneSubmitAnswerLoading) {
            loadingAlertDialog(context);
          }
          if (state is StepOneSubmitAnswerSuccess) {
            Navigator.pop(context);
            Navigator.pushReplacementNamed(
                context, StepTwoStartRequestScreen.routeName);
          }
          if (state is StepOneSubmitAnswerFail) {
            Navigator.pop(context);
            showMessageDialog(
                context: context, isSucceeded: false, message: state.message);
          }
        },
        builder: (context, state) {
          var cubit = StepOneCubit.get(context);
          print(cubit.step1Answers);
          final _formKey = GlobalKey<FormBuilderState>();
          return Scaffold(
            drawer: const DrawerWidget(),
            appBar: AppBar(
              leading: Builder(builder: (context) {
                return IconButton(
                    icon: const Icon(Icons.menu_open),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    });
              }),
              toolbarHeight: 80,
              elevation: 0,
              iconTheme: const IconThemeData(color: AppColors.redColor),
              title: const Text(
                'المرحله الاولى',
                style: TextStyle(color: AppColors.redColor),
              ),
              backgroundColor: Colors.white,
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: cubit.isQuestions
                  ? FormBuilder(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 15.w),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: AppColors.mainColor,
                                  radius: 14.h,
                                  child: const Center(
                                    child: Text(
                                      '3',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text('جاوب علي الاسئلة الاتية',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18.sp)),
                              ],
                            ),
                            state is StepOneGetQuestionsLoading
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 35.w),
                                    child: ListView.builder(
                                      key: GlobalKey(),
                                      shrinkWrap: true,
                                      itemBuilder:
                                          (BuildContext context, int index) =>
                                              TrueFalseQuestion(
                                        questionAnswer:
                                            cubit.step1Answers[index],
                                        index: index+1,
                                      ),
                                      itemCount: cubit.step1Answers.length,
                                    ),
                                  ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Center(
                              child: SizedBox(
                                width: double.infinity,
                                height: 45.h,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState?.validate() ==
                                        true) {
                                      cubit.toggleToDangers();
                                    }
                                  },
                                  child: Text("next".tr()),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                          ],
                        ),
                      ))
                  : Column(
                      children: [
                        ...List.generate(
                          c,
                          (index) => const Danger(),
                        ),
                        SizedBox(
                          height: 200,
                          child: ListView.builder(
                            itemCount: cubit.dangers.length,
                            itemBuilder: (context, index) =>
                                const SelectedDangerWidget(),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: MainButton(
                            onPressed: () {
                              cubit.submitAnswers();
                            },
                            title: "end step 1".tr(),
                          ),
                        ),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }
}
