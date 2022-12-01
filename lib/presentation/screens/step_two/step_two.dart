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
import '../../widgets/main_button.dart';
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
            if (state is StepTwoSubmitAnswerFail) {
              Navigator.pop(context);
              showMessageDialog(
                  context: context, isSucceeded: false, message: state.message);
            }
          }
        },
        builder: (context, state) {
          var cubit = StepTwoCubit.get(context);
          final _formKey = GlobalKey<FormBuilderState>();
          return Scaffold(
            drawer: const DrawerWidget(),
              appBar: AppBar(
                leading: Builder(
                    builder: (context) {
                      return IconButton(icon:const Icon(Icons.menu_open),onPressed: (){
                        Scaffold.of(context).openDrawer();
                      });
                    }
                ),
                toolbarHeight: 80,
                elevation: 0,
                iconTheme:const IconThemeData(color: AppColors.redColor),
                title:const Text(
                  'المرحلة التانية',
                  style: TextStyle(color: AppColors.redColor),
                ),
                backgroundColor: Colors.white,
                centerTitle: true,
              ),
              body: state is StepTwoGetQuestionsLoading
                  ?const Center(
                      child: CircularProgressIndicator(),
                    )
                  : FormBuilder(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child:Padding(
                    padding:EdgeInsets.symmetric(vertical: 10.h,horizontal:15.w ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: AppColors.mainColor,
                              radius:14.h,
                              child:const Center(
                                child: Text(
                                  '3',style:TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700
                                ),),
                              ),),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text('جاوب علي الاسئلة الاتية',style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18.sp
                            )),
                          ],
                        ),
                        state is StepTwoGetQuestionsLoading
                            ? const Center(
                          child: CircularProgressIndicator(),
                        )
                            :Padding(
                            padding:EdgeInsets.symmetric(vertical: 0,horizontal:35.w ),
                            child: Column(
                              children: List.generate(cubit.step2Answers.length, (index) => TrueFalseQuestion(
                                questionAnswer: cubit.step2Answers[index],
                                index: index+1,
                              ),),
                            )
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        MainButton(
                          onPressed: () {
                           //  LocalDataSource  localDataSource = sl<LocalDataSource>();
                           //  //act
                           //  localDataSource.cacheDrivers([Driver(id:1,fullName: "asmaa"),Driver(id:2,fullName: "ahmed")]);
                           // print(localDataSource.getCachedDrivers());
                            if(_formKey.currentState?.validate()==true)
                            {
                              cubit.submitAnswers();
                            }
                          }, title: "end step 2".tr(),),
                        SizedBox(
                          height: 30.h,
                        ),
                      ],
                    ),
                  )
              ));
        },
      ),
    );
  }
}
