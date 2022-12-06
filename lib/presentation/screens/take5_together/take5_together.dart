import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take5/data/models/driver/driver.dart';
import 'package:take5/presentation/screens/end_trip/end_trip.dart';
import '../../../core/constants/app_colors.dart';
import '../../../injection_container.dart';
import '../../../logic/take5_together_cubit/take5_together_cubit.dart';
import '../../../logic/take5_together_cubit/take5_together_states.dart';
import '../../utils/dialogs/message_dialog.dart';
import '../../utils/helpers/helpers.dart';
import '../../widgets/drawer_widget.dart';
import '../../widgets/main_button.dart';
import '../../widgets/my_text_form_field.dart';
import '../../widgets/take5toghther_card.dart';

class Take5TogetherScreen extends StatefulWidget {
  static const routeName = 'Take5TogetherScreen';

  const Take5TogetherScreen({Key? key}) : super(key: key);

  @override
  State<Take5TogetherScreen> createState() => _Take5TogetherScreenState();
}

class _Take5TogetherScreenState extends State<Take5TogetherScreen> {
  @override
  void initState() {
    saveLastRoute(Take5TogetherScreen.routeName);

    super.initState();
    // Take5TogetherCubit.get(context).getDrivers();
    // Take5TogetherCubit.get(context).coWorkerController =
    //     Take5TogetherCubit.get(context).drivers[0].fullName;
    // Take5TogetherCubit.get(context).whoStartConversationController = items[0];
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
              icon: const Icon(Icons.menu_open),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              });
        }),
        actionsIconTheme: IconThemeData(size: 2),
        toolbarHeight: 80,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.redColor),
        title: const Text(
          'أسأل زميل',
          style: TextStyle(color: AppColors.redColor),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: BlocProvider<Take5TogetherCubit>(
        create: (context) => sl<Take5TogetherCubit>()..getDrivers(),
        child: BlocBuilder<Take5TogetherCubit, Take5TogetherStates>(
          builder: (context, state) {
            var cubit = Take5TogetherCubit.get(context);
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'اسم الزميل',
                        style: TextStyle(
                            color: AppColors.mainColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      DropdownSearch<Driver>(
                        items: cubit.drivers,
                        validator: (value) => value == null ? 'مطلوب' : null,
                        // asyncItems: (String? filter) => getData(filter),
                        // clearButtonProps: ClearButtonProps(isVisible: false),
                        selectedItem: cubit.selectedDriver,
                        onChanged: (value) {
                          cubit.onChangeDriver(value);
                        },
                        popupProps: PopupPropsMultiSelection.dialog(
                          // fit: FlexFit.loose,

                          emptyBuilder: (_, __) => Center(
                              child: Column(
                            children: [
                              SizedBox(
                                height: 16.h,
                              ),
                              Text('لا يوجد')
                            ],
                          )),

                          ///decoration of the dialog
                          dialogProps: DialogProps(),
                          showSelectedItems: true,
                          showSearchBox: true,

                          ///decoration of the dropdown items
                          itemBuilder: _customPopupItemBuilder,

                          ///decoration of search text field
                          searchFieldProps: TextFieldProps(
                            style: TextStyle(
                                color: const Color(0xff767676),
                                fontWeight: FontWeight.w400,
                                fontFamily: "Roboto",
                                fontStyle: FontStyle.normal,
                                fontSize: 22.0.sp),
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15.h, horizontal: 20.w),
                              prefixIcon: Icon(
                                Icons.search,
                                size: 30.r,
                              ),
                              prefixIconConstraints: BoxConstraints(
                                  maxHeight: 50.h, minWidth: 50.w),

                              hintText: 'Search',
                              hintStyle: TextStyle(
                                  color: const Color(0xff767676),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Roboto",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 22.0.sp),
                              border: const UnderlineInputBorder(),
                              // border: InputBorder.none,
                            ),
                          ),
                        ),
                        compareFn: (item, selectedItem) =>
                            item.id == selectedItem.id,

                        ///decoration of the text field
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                            // hintText: "اسم الزميل",
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 16.w),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(width: 10.w),
                            ),
                          ),
                        ),

                        ///custom decoration of the text field
                        dropdownBuilder: (context, driver) {
                          return driver != null
                              ? Text(driver.fullName ?? '')
                              : Text(
                                  'اسم الزميل',
                                  style: TextStyle(
                                      color: Theme.of(context).hintColor,
                                      fontSize: 14),
                                );
                        },
                      ),
                      SizedBox(
                        height: 20.w,
                      ),
                      Text(
                        'من الذى بدأ المحادثة؟',
                        style: TextStyle(
                            color: AppColors.mainColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 0, horizontal: 16.w),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(width: 10.w),
                          ),
                        ),
                        key: GlobalKey(),
                        validator: (value) => value == null ? 'مطلوب' : null,
                        hint: Text(
                          'من الذى بدأ المحادثة',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        items: cubit.items
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                            .toList(),
                        value: cubit.selectWhoStartedConversation,
                        onChanged: (value) {
                          cubit.onChangeWhoStartedConversation(value);
                          setState(() {
                            print(cubit.selectWhoStartedConversation);
                          });
                        },
                      ),
                      SizedBox(
                        height: 20.w,
                      ),
                      Text(
                        'الملاحظات',
                        style: TextStyle(
                            color: AppColors.mainColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 150.h,
                        child: MyTextFormField(
                          validator: (value) => value!.isEmpty ? 'مطلوب' : null,
                          controller: cubit.notesController,
                          label: "الملاحظات",
                          maxLines: 5,
                          // errorText: _cubit.errorMessage ==
                          //     'رقم السركى غير مسجل'
                          //     ? _cubit.errorMessage
                          //     : null,
                          // prefixIcon: Icons.person_outline_sharp,
                          keyboardType: TextInputType.multiline,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: MainButton(
                              onPressed: () {
                                // cubit.addToNotes(Take5TogetherModel(notes: cubit.notesController.text,participantDriverId: 1,whoStartDriverId: 1));
                                // print(cubit.notes.length);
                                if (cubit.notes.isEmpty) {
                                  showMessageDialog(
                                      context: context,
                                      message: 'لا يوجد اى ملاحظات!',
                                      isSucceeded: false);
                                } else {
                                  //print(cubit.notes.length);
                                  cubit.saveTake5Together();
                                  Navigator.pushNamed(
                                      context, EndTripScreen.routeName);
                                }
                              },
                              title: "next".tr(),
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Expanded(
                            child: MainButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  cubit.addToNotes();
                                  print(cubit.notes);
                                }
                              },
                              title: 'اضافة',
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 25.h,
                      ),
                      cubit.notes.isNotEmpty
                          ? Divider(
                              indent: 0,
                              endIndent: 0,
                              color: Colors.grey,
                              thickness: 0.5.h,
                            )
                          : Container(),
                      cubit.notes.isNotEmpty
                          ? Text(
                              ' عدد المحادثات (${cubit.notes.length})',
                              style: TextStyle(
                                  fontSize: 22.sp, fontWeight: FontWeight.bold),
                            )
                          : Container(),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        reverse: true,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Take5TogetherCard(
                            removeNote: () =>
                                cubit.removeNote(cubit.notes[index]),
                            index: index + 1,
                            take5togetherModel: cubit.notes[index]),
                        itemCount: cubit.notes.length,
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
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _customPopupItemBuilder(
    BuildContext context,
    Driver? driver,
    bool isSelected,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
      child: ListTile(
        selected: isSelected,
        title: Text(driver?.fullName ?? ''),
      ),
    );
  }
}
