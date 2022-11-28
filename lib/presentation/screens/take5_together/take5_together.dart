import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:take5/data/models/driver/driver.dart';
import 'package:take5/logic/home_cubit/home_cubit.dart';
import 'package:take5/presentation/screens/end_trip/end_trip.dart';
import '../../../core/constants/app_colors.dart';
import '../../../logic/home_cubit/home_states.dart';
import '../../../logic/take5_together_cubit/take5_together_cubit.dart';
import '../../utils/dialogs/message_dialog.dart';
import '../../widgets/drawer_widget.dart';
import '../../widgets/main_button.dart';
import '../../widgets/my_text_form_field.dart';
class Take5TogetherScreen extends StatefulWidget {
  static const routeName = 'Take5TogetherScreen';
  const Take5TogetherScreen({Key? key}) : super(key: key);

  @override
  State<Take5TogetherScreen> createState() => _Take5TogetherScreenState();
}

class _Take5TogetherScreenState extends State<Take5TogetherScreen> {
  final List<String> items = [
   'أنا',
    'الزميل',
  ];
  @override
  void initState()
  {
    super.initState();
    Take5TogetherCubit.get(context).getDrivers();
    Take5TogetherCubit.get(context).coWorkerController=Take5TogetherCubit.get(context).drivers[0].fullName;
    Take5TogetherCubit.get(context).whoStartConversationController= items[0];
  }
  @override
  Widget build(BuildContext context) {
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
        actionsIconTheme: IconThemeData(
          size: 2
        ),
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
      body: BlocBuilder<HomeCubit,HomeStates>(
        builder: (context,state)
        {
          var cubit=Take5TogetherCubit.get(context);
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
                          child:DropdownButton2(
                            hint: Text(
                              'اسم الزميل',
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme
                                    .of(context)
                                    .hintColor,
                              ),
                            ),
                            items: cubit.drivers
                                .map((item) =>
                                DropdownMenuItem<Driver>(
                                  value: item,
                                  child: Text(
                                    item.fullName!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                                .toList(),
                            value:cubit.selectedDriver,
                            onChanged:(value)
                            {
                              cubit.onChangeDriver(value);
                              setState(() {
                                print(cubit.selectedDriver);
                              });
                            },
                            buttonHeight: 60.h,
                            buttonWidth: 200.w,
                            itemHeight: 40.h,
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
                              'من الذى بدأ المحادثة',
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
                            value:cubit.selectWhoStartedConversation,
                            onChanged: (value) {
                              cubit.onChangeWhoStartedConversation(value);
                              setState(() {
                                print(cubit.selectWhoStartedConversation);
                              });
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
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 150.h,
                      child: MyTextFormField(
                        controller:cubit.notesController,
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
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: MainButton(
                            onPressed: (){
                              // cubit.addToNotes(Take5TogetherModel(notes: cubit.notesController.text,participantDriverId: 1,whoStartDriverId: 1));
                              // print(cubit.notes.length);
                              if(cubit.notes.isEmpty)
                                {
                                    showMessageDialog(
                                        context: context, message: 'لا يوجد اى ملاحظات!', isSucceeded: false);
                                }
                                else
        {
          //print(cubit.notes.length);
          cubit.saveTake5Together();
          Navigator.pushNamed(context, EndTripScreen.routeName);
        }
                            }
                            , title: "next".tr(),),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Expanded(
                          child: MainButton(
                            onPressed: () {
                              cubit.addToNotes();
                              print(cubit.notes);
                            } , title: 'اضافه',),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    // Column(
                    //   children:List.generate(cubit.notes.length, (index)=>
                    //       Column(
                    //         children: [
                    //           Note(index:index,whoStartedConversation: cubit.coWorkerController.text,nameOfCoWorker: cubit.coWorkerController.text,note: cubit.notesController.text,),
                    //           SizedBox(
                    //             height: 10.h,
                    //           )
                    //         ],
                    //       )
                    // ))
                  ],)),
          );
        },
      ));
  }
}