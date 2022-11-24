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
import '../../../injection_container.dart';
import '../../../logic/home_cubit/home_states.dart';
import '../../utils/dialogs/loading_dialog.dart';
import '../../widgets/drawer_widget.dart';

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
        if (state is HomeStartTripLoading || state is HomeGetCurrentTripLoading) {
          loadingAlertDialog(context);
        }
        if (state is HomeStartTripSuccess) {
          Navigator.pop(context);
           Navigator.pushNamedAndRemoveUntil(
              context, TripScreen.routeName, (route) => false);
        }
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
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
              'الرحلة',
              style: TextStyle(color: AppColors.redColor),
            ),
            backgroundColor: Colors.white,
            centerTitle: true,
          ),
          body: Column(
            children: [
              SizedBox(height: 16.h,),
              if (state != HomeGetCurrentTripLoading() && cubit.trip != null)
              TripCard(trip: cubit.trip!),
            ],
          ),
        );
      },
    );
  }
}
