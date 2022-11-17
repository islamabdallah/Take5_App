import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:take5/logic/step_one_cubit/step_one_cubit.dart';

import '../../data/models/responses/trip_start_response/trip_start_response.dart';
import '../../data/data.dart';

class Danger extends StatefulWidget {
  const Danger({Key? key}) : super(key: key);

  @override
  State<Danger> createState() => _DangerState();
}

class _DangerState extends State<Danger> {
  @override
  Widget build(BuildContext context) {
    var cubit = StepOneCubit.get(context);
    return BlocBuilder<StepOneCubit, StepOneState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<
                          DangerControlsWithCategoryModel>(
                      value: cubit.selectedCategory,
                      items: cubit.dangerControlsWithCategory
                          .map((d) =>
                              DropdownMenuItem<DangerControlsWithCategoryModel>(
                                value: d,
                                child: Text(d.dangerCategory),
                              ))
                          .toList(),
                      onChanged: cubit.onChangeSelectedCategory),
                ),
                Expanded(
                  child: DropdownButtonFormField<DangerModel>(
                      key: GlobalKey(),
                      value: cubit.selectedDanger,
                      items: cubit.selectedCategory?.dangerModels
                          .map((d) => DropdownMenuItem<DangerModel>(
                                child: Text(d.dangerName),
                                value: d,
                              ))
                          .toList(),
                      onChanged: cubit.onChangeSelectedDanger),
                ),
              ],
            ),
            MultiSelectDialogField<MeasureControlApi>(
              key: GlobalKey(),
              items: cubit.selectedDanger == null
                  ? []
                  : cubit.selectedDanger!.controls
                      .map((e) => MultiSelectItem(e, e.MeasureControlName))
                      .toList(),
              listType: MultiSelectListType.CHIP,
              initialValue: cubit.selectedControls,
              onConfirm: cubit.onSelectControls,
            ),
            ElevatedButton(
              onPressed:
                  cubit.selectedControls!=null?
                  () {
                cubit.addDanger();
              }:null, child:  Icon(Icons.add),
            ),
          ],
        );
      },
    );
  }
}
