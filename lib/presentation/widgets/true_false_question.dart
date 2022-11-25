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
      name: 'question',
      decoration:
      InputDecoration(
          border:const UnderlineInputBorder(
              borderSide:BorderSide.none
          ),
          label: Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.mainColor,
                radius:14.h ,
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
              Text(
                  questionAnswer.question,style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 22.sp
              )),
            ],
          ),
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
      validator:FormBuilderValidators.required(errorText: "لم يتم الاجابه على هذا السؤال "),
      // orientation: OptionsOrientation.vertical,
      options: [true,false]
          .map((ans) => FormBuilderFieldOption(
        value: ans,
        child: Text(ans?'نعم':'لا',style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20.sp
        )),
      ))
          .toList(growable: false),
    );
  }
}
