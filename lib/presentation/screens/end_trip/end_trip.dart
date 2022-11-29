import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take5/core/constants/app_assets.dart';
import 'package:take5/presentation/utils/dialogs/loading_dialog.dart';
import 'package:take5/presentation/utils/dialogs/message_dialog.dart';

import '../../../core/constants/app_colors.dart';
import '../../../injection_container.dart';
import '../../../logic/end_trip_cubit/end_trip_cubit.dart';
import '../../utils/helpers/helpers.dart';
import '../../widgets/main_button.dart';
import '../home/home.dart';

class EndTripScreen extends StatefulWidget {
  static const routeName = 'EndTripScreen';

  const EndTripScreen({Key? key}) : super(key: key);

  @override
  State<EndTripScreen> createState() => _EndTripScreenState();
}

class _EndTripScreenState extends State<EndTripScreen> {

  @override
  void initState() {
    saveLastRoute(EndTripScreen.routeName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<EndTripCubit>(),
      child: BlocConsumer<EndTripCubit, EndTripState>(
        listener: (context, state) {
          if (state is EndTripLoading) {
            loadingAlertDialog(context);
          }

          if (state is EndTripSuccess) {
            Navigator.pop(context);
            showMessageDialog(context: context, isSucceeded: true,message: "انتهت الرحلة!", onPressedOk: (){
              Navigator.pushNamedAndRemoveUntil(
                  context, HomeScreen.routeName, (route) => false);
            });
          }

          if (state is EndTripFail) {
            Navigator.pop(context);
            showMessageDialog(context: context, isSucceeded: false,message: state.message, onPressedOk: (){
            });
          }
        },
        builder: (context, state) {
          var cubit = EndTripCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 80,
              elevation: 0,
              title:const Text(
                'انهاء الرحلة',
                style: TextStyle(color: AppColors.redColor),
              ),
              backgroundColor: Colors.white,
              centerTitle: true,
            ),
            body: Center(
              child: Column(
                children: [
                  Image.asset(AppAssets.endTrip,height: 330.h),
                  SizedBox(
                    height: 60.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: MainButton(
                      onPressed: cubit.endTrip, title: 'انهاء الرحلة',),
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}