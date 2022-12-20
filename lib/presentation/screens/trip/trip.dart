import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:take5/logic/home_cubit/home_cubit.dart';
import 'package:take5/presentation/widgets/drawer_widget.dart';
import 'package:take5/presentation/widgets/powered_by_cemex.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_endpoints.dart';
import '../../../core/utils/services/loaction_service.dart';
import '../../../data/models/all_trip_steps/all_trip_steps.dart';
import '../../../data/models/requests/destination_arrived_request/destination_arrived_request.dart';
import '../../../data/models/trip/trip.dart';
import '../../../data/models/user/user.dart';
import '../../../injection_container.dart';
import '../../../logic/home_cubit/home_states.dart';
import '../../../logic/trip_cubit/trip_cubit.dart';
import '../../../logic/trip_cubit/trip_states.dart';
import '../../utils/dialogs/loading_dialog.dart';
import '../../utils/dialogs/message_dialog.dart';
import '../../utils/helpers/helpers.dart';
import '../../widgets/main_button.dart';
import '../../widgets/my_app_bar.dart';
import '../home/home.dart';
import '../step_one/step_one_questions.dart';



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
        listener: (context, state) {
          if (state is ArrivedLoadingTripState) {
            loadingAlertDialog(context);
          }
          if (state is ArrivedSuccessTripState) {
            switch (state.message) {
              case 'Cancelled':
                showMessageDialog(
                    context: context,
                    isSucceeded: true,
                    message:"trip canceled".tr(),
                    onPressedOk: () {
                      Navigator.pushNamedAndRemoveUntil(context,
                          HomeScreen.routeName, (route) => false);
                    });
                break;
              case 'Converted':
                showMessageDialog(
                    context: context,
                    isSucceeded: true,
                    message: "trip converted".tr(),
                    onPressedOk: () {
                      Navigator.pushNamedAndRemoveUntil(context,
                          HomeScreen.routeName, (route) => false);
                    });
                break;
              default:
                Navigator.pushReplacementNamed(
                    context, StepOneQuestionsScreen.routeName);
            }

          }
          if (state is ArrivedFailTripState) {
            Navigator.pop(context);
            showMessageDialog(
                context: context, isSucceeded: false, message: state.message);
          }
        },
        builder: (context, state) {
          var cubit = TripCubit.get(context);
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            drawer: const DrawerWidget(),
            appBar: MyAppBar(title: "distance".tr(),),
            body: Center(
              child: Column(
                children: [
                  const Spacer(),
                  Container(
                    width: 274.w,
                    height: 470.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x3f000000),
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: state is StartTripLoadingTripState
                        ? const Center(child: CircularProgressIndicator())
                        : Column(
                            children: [
                              Container(
                                width: 241.w,
                                child: Lottie.asset(AppAssets.truck,
                                    fit: BoxFit.cover),
                              ),
                              Text(
                                cubit.isArrived!=null && cubit.isArrived!
                                    ? "arrived".tr()
                                    : " متبقي ${(cubit.d! / 1000).toStringAsFixed(2)} كم ",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Color(0xff5d5d5d),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              BlocConsumer<HomeCubit,HomeStates>(
                                listener: (context,state){
                                  if (state is HomeCheckTripStatusSuccess) {
                                    // final context = navigatorKey.currentState!.overlay!.context;
                                    Navigator.pop(context);
                                    switch (state.status) {
                                      case 'Done':
                                        showMessageDialog(
                                          context: context,
                                          isSucceeded: true,
                                          message: "there is no change in trip".tr(),
                                          onPressedOk: ()
                                            {
                                              Navigator.pushNamedAndRemoveUntil(
                                                  context,
                                                  StepOneQuestionsScreen.routeName,
                                                      (route) => false);
                                            }
                                        );
                                        break;
                                      case 'Cancelled':
                                        showMessageDialog(
                                            context: context,
                                            isSucceeded: true,
                                            message:"trip canceled".tr(),
                                            onPressedOk: () {
                                              Navigator.pushNamedAndRemoveUntil(context,
                                                  HomeScreen.routeName, (route) => false);
                                            });
                                        break;
                                      case 'Converted':
                                        showMessageDialog(
                                            context: context,
                                            isSucceeded: true,
                                            message: "trip converted".tr(),
                                            onPressedOk: () {
                                              Navigator.pushNamedAndRemoveUntil(context,
                                                  HomeScreen.routeName, (route) => false);
                                            });
                                        break;
                                      default:
                                    }
                                  }
                                  if (state is HomeCheckTripStatusFail) {
                                    // final context = navigatorKey.currentState!.overlay!.context;
                                    Navigator.pop(context);
                                    showMessageDialog(
                                        context: context,
                                        isSucceeded: false,
                                        message: state.message
                                    );
                                  }
                                },
                                builder: (context,state)
                                {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                                    child: MainButton(
                                      onPressed:cubit.isButtonEnabled
                                          ? () async {
                                        var result = await cubit.submitArrival();
                                        if(result!=null && result==true) {
                                          if(!mounted) return;
                                          // todo checkTripStatus
                                          HomeCubit.get(context).checkTripStatus();
                                        }
                                      } : null, title: "fill form".tr(),),
                                  );
                                },
                              ),
                              SizedBox(height: 20.h),
                            ],
                          ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  const PoweredByCemex(),
                  SizedBox(
                    height: 20.h,
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
