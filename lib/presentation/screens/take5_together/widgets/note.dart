import 'package:flutter/material.dart';
import 'package:take5/core/constants/app_colors.dart';
class Note extends StatelessWidget {
  const Note({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.redColor,
      height: 200,
    );
  }
}
