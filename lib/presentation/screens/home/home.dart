import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take5/core/constants/app_colors.dart';
import 'package:take5/logic/home_cubit/home_cubit.dart';
import 'package:take5/presentation/screens/home/widgets/trip_card.dart';
import 'package:take5/presentation/screens/trip/trip.dart';
import 'package:take5/presentation/utils/dialogs/message_dialog.dart';
import 'package:take5/presentation/utils/helpers/helpers.dart';
import '../../../core/constants/app_assets.dart';
import '../../../logic/home_cubit/home_states.dart';
import '../../utils/dialogs/loading_dialog.dart';
import '../../widgets/drawer_widget.dart';
import '../../widgets/main_button.dart';
import '../../widgets/my_app_bar.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'HomeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    saveLastRoute(HomeScreen.routeName);
    HomeCubit.get(context).getCurrentTrip();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is HomeStartTripLoading) {
          loadingAlertDialog(context);
        }
        if (state is HomeStartTripSuccess) {
          Navigator.pop(context);
          Navigator.pushNamedAndRemoveUntil(
              context, TripScreen.routeName, (route) => false);
        }  
        if (state is HomeStartTripFail) {
          Navigator.pop(context);
          showMessageDialog(context: context, isSucceeded: false,message: "لا يمكنك بدأ الرحلة\n الرجاء التاكد من الانترنت");
        }
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          drawer: const DrawerWidget(),
          appBar: MyAppBar(title: 'الرحلة',),
          body: Column(
            children: [
              SizedBox(
                height: 16.h,
              ),
              state is HomeGetCurrentTripLoading
                  ?const Expanded(child: Center(child: CircularProgressIndicator()))
                  : cubit.trip == null
                      ? Column(
                          children: [
                            SizedBox(
                              height: 30.h,
                            ),
                            Image.asset(AppAssets.noTrip),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              'لا يوجد رحلة',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 28.sp),
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: MainButton(
                                onPressed: () {
                                  cubit.getCurrentTrip();
                                },
                                title: 'اعادة البحث',
                              ),
                            ),
                          ],
                        )
                      : TripCard(trip: cubit.trip!),
            ],
          ),
        );
      },
    );
  }
}
