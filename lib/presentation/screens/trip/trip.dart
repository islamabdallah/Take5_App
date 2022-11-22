import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:take5/core/constants/app_constants.dart';
import 'package:take5/data/datasources/local_data_source.dart';
import 'package:take5/presentation/widgets/drawer_widget.dart';
import 'package:take5/presentation/widgets/powered_by_cemex.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/utils/services/loaction_service.dart';
import '../../../injection_container.dart';

import '../../../logic/trip_cubit/trip_cubit.dart';
import '../../../logic/trip_cubit/trip_states.dart';
import '../../utils/helpers/helpers.dart';
import '../step_one_questions/step_one_questions.dart';

class TripScreen extends StatefulWidget {
  static const routeName = 'TripScreen';

  const TripScreen({Key? key}) : super(key: key);

  @override
  State<TripScreen> createState() => _TripScreenState();
}

class _TripScreenState extends State<TripScreen> {
  @override
  void initState() {
    saveLastRoute(TripScreen.routeName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TripCubit>()..start(),
      child: BlocConsumer<TripCubit, TripStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = TripCubit.get(context);
          return Scaffold(
            drawer: const DrawerWidget(),
            appBar: AppBar(
              leading: Builder(
                  builder: (context) {
                    return IconButton(icon: Icon(Icons.menu_open),onPressed: (){
                      Scaffold.of(context).openDrawer();
                    });
                  }
              ),
              toolbarHeight: 80,
              elevation: 0,
              iconTheme: IconThemeData(color: AppColors.redColor),
              title: Text(
                'المسافة',
                style: TextStyle(color: AppColors.redColor),
              ),
              backgroundColor: Colors.white,
              centerTitle: true,
            ),
            body: Center(
              child: Column(
                children: [
                  Spacer(),
                  Container(
                    width: 274.w,
                    height: 400.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x3f000000),
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child:
                    state is StartTripLoadingTripState?
                      Center(child: CircularProgressIndicator())
                          :
                    Column(
                      children: [
                        Container(
                          child: Lottie.asset(
                            AppAssets.truck,
                            fit: BoxFit.scaleDown
                          ),
                        ),
                        Text(
                          " متبقي ${cubit.d?.toInt()} متر ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff5d5d5d),
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 40.h,),
                        ElevatedButton(
                          onPressed: cubit.isButtonEnabled
                              ? () {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      StepOneQuestionsScreen.routeName,
                                      (route) => false);
                                }
                              : null,
                          child: const Text('املأ الاستمارة'),
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                  Spacer(flex: 2,),
                  PoweredByCemex(),
                  SizedBox(height: 20.h,),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
