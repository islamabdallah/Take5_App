import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take5/core/constants/app_constants.dart';
import 'package:take5/presentation/screens/end_trip/end_trip.dart';

import '../../../core/constants/app_colors.dart';
import '../../../data/datasources/local_data_source.dart';
import '../../../data/models/driver/driver.dart';
import '../../../data/models/requests/destination_arrived_request/destination_arrived_request.dart';
import '../../../data/models/responses/trip_start_response/trip_start_response.dart';
import '../../../data/models/trip/trip.dart';
import '../../../injection_container.dart';
import '../../../logic/step_one_cubit/step_one_cubit.dart';
import '../../../logic/step_two_cubit/step_two_cubit.dart';
import '../../utils/dialogs/loading_dialog.dart';
import '../../utils/dialogs/message_dialog.dart';
import '../../utils/helpers/helpers.dart';
import '../../widgets/danger.dart';
import '../../widgets/drawer_widget.dart';
import '../../widgets/headline_step.dart';
import '../../widgets/main_button.dart';
import '../../widgets/my_app_bar.dart';
import '../../widgets/true_false_question.dart';
import '../home/home.dart';
import '../take5_together/take5_together.dart';

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
        listener: (context, state) {
          if (state is StepTwoSubmitAnswerLoading) {
            loadingAlertDialog(context);
          }
          if (state is StepTwoSubmitAnswerSuccess) {
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
                    context, Take5TogetherScreen.routeName);
            }
          }
          if (state is StepTwoSubmitAnswerFail) {
            Navigator.pop(context);
            showMessageDialog(
                context: context, isSucceeded: false, message: state.message);
          }
        },
        builder: (context, state) {
          var cubit = StepTwoCubit.get(context);
          final _formKey = GlobalKey<FormBuilderState>();
          return Scaffold(
            drawer: const DrawerWidget(),
              appBar: MyAppBar(title:"step 2".tr(),),
              body: state is StepTwoGetQuestionsLoading
                  ?const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                    child: FormBuilder(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child:Padding(
                      padding:EdgeInsets.symmetric(vertical: 10.h,horizontal:15.w ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Headline(number: '5', title: 'جاوب علي الاسئلة الاتية',),
                          state is StepTwoGetQuestionsLoading
                              ? const Center(child: CircularProgressIndicator(),)
                              :Padding(
                              padding:EdgeInsets.symmetric(vertical: 0,horizontal:35.w ),
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                key: GlobalKey(),
                                shrinkWrap: true,
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                    TrueFalseQuestion(
                                      questionAnswer:
                                      cubit.step2Answers[index],
                                      index: index+1,
                                    ),
                                itemCount: cubit.step2Answers.length,
                              )
                          ),
                        // Spacer(),
                          MainButton(
                            onPressed: () {
                              if(_formKey.currentState?.validate()==true)
                              {
                                cubit.submitAnswers();
                              }
                            }, title: "next".tr(),),
                          SizedBox(
                            height: 30.h,
                          ),
                        ],
                      ),
                    )
              ),
                  ));
        },
      ),
    );
  }
}
