import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../core/constants/app_colors.dart';
import '../../data/models/answer/answer.dart';

class TrueFalseQuestion extends StatelessWidget {
  final QuestionAnswerModel questionAnswer;
  final int index;
  const TrueFalseQuestion({Key? key,required this.questionAnswer,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderRadioGroup(
      initialValue: questionAnswer.answer,
      wrapSpacing:30.w,
      name: index.toString(),
      activeColor: AppColors.mainColor,
      decoration:
      InputDecoration(
          border:const UnderlineInputBorder(
              borderSide:BorderSide.none
          ),
          label: Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.mainColor,
                radius:15.r ,
                child:  Center(
                  child: Text(
                    index.toString(),style:const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700
                  ),),
                ),),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: Text(
                  questionAnswer.question,style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 22.sp,
                    height: 1.4.h
                ),
                ),
              ),
            ],
          )
         // labelText: questionAnswer.question,
        // labelStyle:TextStyle(
        //   color: Colors.black,
        //     fontSize: 20.sp,
        //   fontWeight: FontWeight.w400
        // )
      ),
      onChanged: (value){
        questionAnswer.answer=value;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator:FormBuilderValidators.required(errorText: "???? ?????? ?????????????? ?????? ?????? ???????????? "),
      // orientation: OptionsOrientation.vertical,
      options: [true,false]
          .map((ans) => FormBuilderFieldOption(
        value: ans,
        child: Padding(
          padding:EdgeInsets.symmetric(vertical: 30.h),
          child: Text(ans?'??????':'????',style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20.sp
          )),
        ),
      ))
          .toList(growable: false),
    );
  }
}
