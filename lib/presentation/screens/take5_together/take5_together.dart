import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:take5/logic/home_cubit/home_cubit.dart';
import '../../../core/constants/app_colors.dart';
import '../../../logic/home_cubit/home_states.dart';
import '../../widgets/main_button.dart';
import '../../widgets/my_text_form_field.dart';
class Take5TogetherScreen extends StatelessWidget {
  static const routeName = 'Take5TogetherScreen';
  const Take5TogetherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      'Item1',
      'Item2',
      'Item3',
      'Item4',
    ];
    String? selectedValue;
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
            builder: (context) {
              return IconButton(icon:const Icon(Icons.menu_open),onPressed: (){
                Scaffold.of(context).openDrawer();
              });
            }
        ),
        actions: [
          TextButton(onPressed: (){}, child: Text('حفظ'))
        ],
        toolbarHeight: 80,
        elevation: 0,
        iconTheme:const IconThemeData(color: AppColors.redColor),
        title:const Text(
          'أسأل زميل',
          style: TextStyle(color: AppColors.redColor),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body:
      BlocConsumer<HomeCubit,HomeStates>(
        listener: (context,state){},
        builder: (context,state)
        {
          var cubit=HomeCubit.get(context);
          return SingleChildScrollView(
            child: Padding(
                padding:EdgeInsets.symmetric(vertical: 10.h,horizontal:15.w ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('اسم الزميل',style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w800
                    ),),
                    SizedBox(
                      height: 10.w,
                    ),
                    SizedBox(
                      height: 60.h,
                      child: InputDecorator(
                        decoration: InputDecoration(
                            border:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(
                                    width: 10.w
                                )
                            )
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            hint: Text(
                              'حدد اسم الزميل',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme
                                    .of(context)
                                    .hintColor,
                              ),
                            ),
                            items: cubit.drivers
                                .map((item) =>
                                DropdownMenuItem<String>(
                                  value: item.fullName,
                                  child: Text(
                                    item.fullName!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                                .toList(),
                            value: selectedValue,
                            onChanged: (value) {
                              cubit.coWorkerController.text=value!;
                            },
                            buttonHeight: 40,
                            buttonWidth: 140,
                            itemHeight: 40,
                          ),

                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.w,
                    ),
                    Text('من الذى بدأ المحادثة؟',style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w800
                    ),),
                    SizedBox(
                      height: 10.w,
                    ),
                    SizedBox(
                      height: 60.h,
                      child: InputDecorator(
                        decoration: InputDecoration(
                            border:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(
                                    width: 10.w
                                )
                            )
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            hint: Text(
                              'حدد البادئ',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme
                                    .of(context)
                                    .hintColor,
                              ),
                            ),
                            items: items
                                .map((item) =>
                                DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                                .toList(),
                            value: selectedValue,
                            onChanged: (value) {
                              // setState(() {
                              //   selectedValue = value as String;
                              // });
                            },
                            buttonHeight: 40,
                            buttonWidth: 140,
                            itemHeight: 40,
                          ),

                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.w,
                    ),
                    Text('الملاحظات',style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w800
                    ),),
                    SizedBox(
                      height: 10.w,
                    ),
                    SizedBox(
                      height: 150.h,
                      child:const MyTextFormField(
                        // controller: _cubit.serialNumberController,
                        label: "الملاحظات",
                        maxLines: 5,
                        // errorText: _cubit.errorMessage ==
                        //     'رقم السركى غير مسجل'
                        //     ? _cubit.errorMessage
                        //     : null,
                        // prefixIcon: Icons.person_outline_sharp,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    SizedBox(
                      height: 20.w,
                    ),
                    MainButton(
                      onPressed: () {

                      }, title: 'اضافه',),
                  ],)),
          );
        },
      )
    );
  }
}
