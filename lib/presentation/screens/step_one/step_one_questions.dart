import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:take5/core/constants/app_constants.dart';
import 'package:take5/presentation/screens/step_one/widgets/selected_dangers.dart';
import 'package:take5/presentation/screens/step_two/step_two.dart';
import 'package:take5/presentation/screens/step_two_waiting/step_two_start_request_screen.dart';
import 'package:take5/presentation/utils/dialogs/loading_dialog.dart';
import 'package:take5/presentation/utils/dialogs/message_dialog.dart';
import '../../../core/constants/app_colors.dart';
import '../../../injection_container.dart';
import '../../../logic/step_one_cubit/step_one_cubit.dart';
import '../../utils/helpers/helpers.dart';
import '../../widgets/danger.dart';
import '../../widgets/drawer_widget.dart';
import '../../widgets/headline_step.dart';
import '../../widgets/main_button.dart';
import '../../widgets/my_app_bar.dart';
import '../../widgets/true_false_question.dart';
import '../home/home.dart';

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
    AppConstants.stopService();
    clearSharedPreferences();
    super.initState();
  }

  clearSharedPreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.reload();
    preferences.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<StepOneCubit>()..getStepOneQuestions(),
      child: BlocConsumer<StepOneCubit, StepOneState>(
        listener: (context, state) {
          if (state is StepOneAddDangerDublicated) {
            showMessageDialog(
                context: context,
                message: 'قمت باضافه هذا الخطر من قبل',
                isSucceeded: false);
          }

          if (state is StepOneSubmitAnswerLoading) {
            loadingAlertDialog(context);
          }
          if (state is StepOneSubmitAnswerSuccess) {
            switch (state.message) {
              case 'Cancelled':
                showMessageDialog(
                    context: context,
                    isSucceeded: true,
                    message: 'تم الغاء الرحلة',
                    onPressedOk: () {
                      Navigator.pushNamedAndRemoveUntil(context,
                          HomeScreen.routeName, (route) => false);
                    });
                break;
              case 'Converted':
                showMessageDialog(
                    context: context,
                    isSucceeded: true,
                    message: 'تم تحويل الرحلة',
                    onPressedOk: () {
                      Navigator.pushNamedAndRemoveUntil(context,
                          HomeScreen.routeName, (route) => false);
                    });
                break;
              default:
                Navigator.pushReplacementNamed(
                    context, StepTwoStartRequestScreen.routeName);
            }

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
          backgroundColor: AppColors.backgroundColor,
            drawer: const DrawerWidget(),
            appBar: MyAppBar(title:'المرحلة الاولى',),
            body: SingleChildScrollView(
               physics: ScrollPhysics(),
              child:Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 10.h, horizontal: 15.w),
                child: Column(
                  children: [
                    cubit.isQuestions?
                    const Headline(number: '1', title: 'قف وانظر وإستكشف مكان العمل حولك',):Container(),
                    cubit.isQuestions?SizedBox(
                      height: 30.h,
                    ):Container(),
                    cubit.isQuestions?const Headline(number: '2', title: 'فكر في العمل  المكلف به',) :Container(),
                    cubit.isQuestions?SizedBox(
                      height: 30.h,
                    ):Container(),
                    cubit.isQuestions
                        ? FormBuilder(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                            children: [
                              const Headline(number: '3', title: 'جاوب علي الاسئلة الاتية',),
                              state is StepOneGetQuestionsLoading
                                  ? const Center(
                                child: CircularProgressIndicator(),
                              )
                                  : Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 30.w),
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
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
                              MainButton(
                                  onPressed:  () {
                                    if (_formKey.currentState?.validate() ==
                                        true) {
                                      cubit.toggleToDangers();
                                    }
                                  }, title:"next".tr()),
                              SizedBox(
                                height: 30.h,
                              ),
                            ],
                          ),
                        )
                        :Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         const Headline(number: '4', title: 'المخاطر',),
                          SizedBox(
                            height: 25.h,
                          ),
                          ...List.generate(
                            c,
                                (index) => const Danger(),
                          ),

                        ],
                    ),
                  ],
                ),
              )
            ),
          );
        },
      ),
    );
  }
}
