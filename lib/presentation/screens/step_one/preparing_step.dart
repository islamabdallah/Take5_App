import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take5/presentation/screens/step_one/step_one_questions.dart';
import 'package:take5/presentation/screens/step_one/widgets/preparing_widget.dart';

import '../../../core/constants/app_colors.dart';
class PreparingStepScreen extends StatelessWidget {
  const PreparingStepScreen({Key? key}) : super(key: key);
  static const routeName = 'PreparingStep';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
            builder: (context) {
              return IconButton(icon: Icon(Icons.menu_open),onPressed: (){
                Scaffold.of(context).openDrawer();
              });
            }
        ),
        toolbarHeight: 80,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.redColor),
        title: Text(
          'المرحله الاولى',
          style: TextStyle(color: AppColors.redColor),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body:Padding(
        padding:EdgeInsets.symmetric(vertical: 10.h,horizontal:15.w ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PreparingWidget(number: 1,imagePath: 'assets/images/preparing_step_1.png',title: 'قف وانظر وإستكشف مكان العمل حولك',),
            SizedBox(
              height: 30.h,
            ),
            const PreparingWidget(number: 2,imagePath: 'assets/images/preparing_step_2.png',title: 'فكر في العمل  المكلف به',),
            const Spacer(),
            Center(
              child: SizedBox(
                width: double.infinity,
                height: 45.h,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, StepOneQuestionsScreen.routeName);
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
      )
    );
  }
}
