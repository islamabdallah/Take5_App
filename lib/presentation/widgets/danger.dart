import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:take5/logic/step_one_cubit/step_one_cubit.dart';
import '../../core/constants/app_colors.dart';
import '../../data/models/responses/trip_pending_response/user_trip_response.dart';
import '../utils/dialogs/message_dialog.dart';
import 'main_button.dart';

class Danger extends StatefulWidget {
  const Danger({Key? key}) : super(key: key);

  @override
  State<Danger> createState() => _DangerState();
}

class _DangerState extends State<Danger> {
  @override
  Widget build(BuildContext context) {
    var cubit = StepOneCubit.get(context);
    final _formKey = GlobalKey<FormState>();
    return BlocConsumer<StepOneCubit, StepOneState>(
      listener: (context,state) {
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "type of danger".tr(),
                style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 10.w,
              ),
              DropdownButtonFormField<DangerWithCategoryAPIModels>(
                  key: GlobalKey(),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 16.w),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(width: 10.w),
                    ),
                  ),
                  validator: (value) => value == null ? "required".tr() : null,
                  value: cubit.selectedCategory,
                  items: cubit.dangerControlsWithCategory
                      .map((d) => DropdownMenuItem<DangerWithCategoryAPIModels>(
                            value: d,
                            child: Text(d.dangerCategory),
                          ))
                      .toList(),
                  onChanged: cubit.onChangeSelectedCategory),
              SizedBox(
                height: 20.w,
              ),
              Text(
                "choice danger".tr(),
                style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 10.w,
              ),
              DropdownButtonFormField<DangerModel>(
                  key: GlobalKey(),
                  validator: (value) => value == null ? "required".tr() : null,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 16.w),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(width: 10.w),
                    ),
                  ),
                  value: cubit.selectedDanger,
                  items: cubit.selectedCategory?.dangerModels
                      .map((d) => DropdownMenuItem<DangerModel>(
                            child: Text(d.dangerName),
                            value: d,
                          ))
                      .toList(),
                  onChanged: cubit.onChangeSelectedDanger),
              SizedBox(
                height: 20.w,
              ),
              Text(
                "Ways to deal with risk".tr(),
                style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 10.w,
              ),
              InputDecorator(
                decoration: InputDecoration(
                    isDense: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 16.w),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(width: 10.w))),
                child: MultiSelectDialogField<MeasureControlApi>(
                  cancelText: Text("الغاء"),
                  confirmText: Text("تم"),
                  title: Text("اختار"),
                  buttonText: Text("التعامل"),
                  decoration: BoxDecoration(),
                  chipDisplay: MultiSelectChipDisplay(
                    alignment: Alignment.centerRight,
                  ),
                  validator: (value) => value == null ?"required".tr(): null,
                  key: GlobalKey(),
                  items: cubit.selectedDanger == null
                      ? []
                      : cubit.selectedDanger!.measureControlAPIs
                          .map((e) => MultiSelectItem(e, e.measureControlName))
                          .toList(),
                  listType: MultiSelectListType.CHIP,
                  initialValue: cubit.selectedControls,
                  onConfirm: cubit.onSelectControls,
                ),
              ),
              SizedBox(
                height: 30.w,
              ),
              Row(
                children: [
                  Expanded(
                    child: MainButton(
                      onPressed: () {
                        if(cubit.dangers.isEmpty)
                        {
                          showMessageDialog(
                            onPressedOk:  cubit.submitAnswers,
                              context: context,
                              message:  "there is no dangers".tr(),
                              isSucceeded: false);
                        }
                        else
                          {
                            cubit.submitAnswers();
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
                        print(cubit.dangers);
                        if (_formKey.currentState!.validate()) {
                          cubit.addDanger();
                        }
                      },
                      title:"add".tr(),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              cubit.dangers.isNotEmpty?Divider(
                indent: 0,
                endIndent: 0,
                color: Colors.grey,
                thickness: 0.8.h,
              ):Container(),
              SizedBox(
                height: 25.h,
              ),
              cubit.dangers.isNotEmpty?Text(
                ' ${"number of dangers".tr()} (${cubit.dangers.length})',
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
              ):Container(),
              Column(
                children: List.generate(
                    cubit.dangers.length,
                        (index) => Card(
                      elevation: 5,
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.symmetric(
                          vertical: 20.h, horizontal: 0),
                      child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                  width: 5.0, color: AppColors.mainColor),
                              left: BorderSide(
                                width: 2.0,
                                color: Color(0xFFE7E7E7),
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      ' ${"type of danger".tr()} ${index + 1}',
                                      style: TextStyle(
                                        color: AppColors.mainColor,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      onPressed: () {
                                        cubit.removeDanger(
                                            cubit.dangers[index]);
                                      },
                                      icon: const Icon(
                                        Icons.delete_forever,
                                        color: AppColors.redColor,
                                      ),
                                    ),
                                  ],
                                ),
                                RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: "type of danger".tr(),
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          color: AppColors.greyColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: cubit.dangers[index].category,
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        color: AppColors.greyColor,
                                      ),
                                    ),
                                  ]),
                                ),
                                RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text:"name of danger".tr(),
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          color: AppColors.greyColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: cubit.dangers[index].dangerName,
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        color: AppColors.greyColor,
                                      ),
                                    ),
                                  ]),
                                ),
                                RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text:"${"Ways to deal with risk".tr()}: ",
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          color: AppColors.greyColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ]),
                                ),
                                Column(
                                  children: List.generate(
                                      cubit.dangers[index]
                                          .measureControlAPIs.length,
                                          (i) => Row(
                                        children: [
                                          Text(
                                            '${i + 1} - ',
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                              color:
                                              AppColors.greyColor,
                                            ),
                                          ),
                                          Text(
                                            cubit
                                                .dangers[index]
                                                .measureControlAPIs[i]
                                                .measureControlName,
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                              color:
                                              AppColors.greyColor,
                                            ),
                                          ),
                                        ],
                                      )),
                                )
                              ],
                            ),
                          )),
                    )),
              )
              // ElevatedButton(
              //   onPressed:
              //       cubit.selectedControls!=null?
              //       () {
              //     cubit.addDanger();
              //   }:null, child:  Icon(Icons.add),
              // ),
            ],
          ),
        );
      },
    );
  }
}
