import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take5/core/constants/app_assets.dart';
import 'package:take5/presentation/utils/dialogs/loading_dialog.dart';
import 'package:take5/presentation/utils/dialogs/message_dialog.dart';

import '../../../core/constants/app_colors.dart';
import '../../../injection_container.dart';
import '../../../logic/end_trip_cubit/end_trip_cubit.dart';
import '../home/home.dart';

class EndTripScreen extends StatelessWidget {
  static const routeName = 'EndTripScreen';

  const EndTripScreen({Key? key}) : super(key: key);

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
              leading: Builder(
                  builder: (context) {
                    return IconButton(
                        icon: Icon(Icons.menu_open), onPressed: () {
                      Scaffold.of(context).openDrawer();
                    });
                  }
              ),
              toolbarHeight: 80,
              elevation: 0,
              iconTheme: IconThemeData(color: AppColors.mainColor),
              title: Text(
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
                  SizedBox(height: 16.h,),
                  ElevatedButton(
                    onPressed: cubit.endTrip,
                    child: const Text('انهاء الرحلة'),
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