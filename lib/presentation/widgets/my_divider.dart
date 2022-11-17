import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 25.h,
        ),
        Divider(color: Color(0xFFDADADA), thickness: 1.h, height: 0),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}
