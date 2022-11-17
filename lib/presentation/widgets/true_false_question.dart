import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../data/models/answer/answer.dart';

class TrueFalseQuestion extends StatelessWidget {
  final Answer questionAnswer;
  const TrueFalseQuestion({Key? key,required this.questionAnswer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderRadioGroup (
      name: 'question',
      decoration:
      InputDecoration(labelText: questionAnswer.question,
        labelStyle:const TextStyle(
          color: Colors.black
        )
      ),
      onChanged: (value){
        questionAnswer.answer=value;
      },
      validator:FormBuilderValidators.required(errorText: "لم يتم الاجابه على هذا السؤال "),
      // orientation: OptionsOrientation.vertical,
      options: [true,false]
          .map((ans) => FormBuilderFieldOption(
        value: ans,
        child: Text(ans?'نعم':'لا'),
      ))
          .toList(growable: false),
    );
  }
}
