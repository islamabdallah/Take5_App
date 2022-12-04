import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/app_colors.dart';
class MyAppBar extends StatelessWidget with PreferredSizeWidget{
  @override
  final Size preferredSize;
  final String title;
  MyAppBar({Key? key,required this.title}) : preferredSize = Size.fromHeight(70.h),super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(builder: (context) {
        return IconButton(
            icon:const Icon(Icons.menu_open),
            iconSize: 26.sp,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            });
      }),
      toolbarHeight: 80,
      elevation: 0,
      iconTheme:const IconThemeData(color: AppColors.redColor),
      title:Text(
        title,
        style: TextStyle(
            color: AppColors.redColor,
          fontSize: 25.sp
        ),
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
      leadingWidth: 72,
    );
  }
}
