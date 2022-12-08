import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:take5/logic/home_cubit/home_cubit.dart';
import 'package:take5/presentation/screens/home/widgets/no_trip_widget.dart';
import 'package:take5/presentation/screens/home/widgets/trip_card.dart';
import 'package:take5/presentation/screens/trip/trip.dart';
import 'package:take5/presentation/utils/dialogs/message_dialog.dart';
import 'package:take5/presentation/utils/helpers/helpers.dart';
import '../../../core/firebase/push_notification_service.dart';
import '../../../logic/home_cubit/home_states.dart';
import '../../utils/dialogs/loading_dialog.dart';
import '../../widgets/drawer_widget.dart';
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
    PushNotificationService.init(context);
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
          showMessageDialog(context: context, isSucceeded: false,message: "you can't start trip make sure that network is well".tr());
        }
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          drawer: const DrawerWidget(),
          appBar: MyAppBar(title: "trip".tr(),),
          body: Column(
            children: [
              SizedBox(height: 16.h,),
              state is HomeGetCurrentTripLoading
                  ?const Expanded(child: Center(child: CircularProgressIndicator()))
                  : cubit.trip == null
                      ?const NoTripWidget()
                      : TripCard(trip: cubit.trip!),
            ],
          ),
        );
      },
    );
  }
}
