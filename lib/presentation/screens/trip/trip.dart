import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:take5/data/datasources/local_data_source.dart';
import 'package:take5/presentation/screens/step_one/preparing_step.dart';

import '../../../core/utils/services/loaction_service.dart';
import '../../../injection_container.dart';

import '../../../logic/trip_cubit/trip_cubit.dart';
import '../../../logic/trip_cubit/trip_states.dart';
import '../../utils/helpers/helpers.dart';
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
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = TripCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Column(
                children: [
                  // Text(cubit.p.toString() ?? ''),
                  Text('${cubit.d?.toInt()} m' ?? ''),
                  ElevatedButton(
                    onPressed: cubit.isButtonEnabled
                        ? () {
                            Navigator.pushNamedAndRemoveUntil(
                                context,
                                PreparingStepScreen.routeName,
                                (route) => false);
                          }
                        : null,
                    child: const Text('Next'),
                  ),
                  // ElevatedButton(
                  // onPressed: () {
                  // LocalDataSource localDataSource = sl<LocalDataSource>();
                  // print( localDataSource.getCachedTakeFiveSurvey()?.stepTwoQuestions.length);
                  // },
                  // child: Text('printSurvey'),
                  // ),
                  // ElevatedButton(
                  // onPressed: () async {
                  // final service = FlutterBackgroundService();
                  // var isRunning = await service.isRunning();
                  // if (isRunning == true) {
                  // service.invoke("stopService");
                  // } },
                  // child: Text('stop service'),
                  // ),
                  //     ElevatedButton(
                  //     onPressed: () async {
                  //       SharedPreferences preferences = await SharedPreferences.getInstance();
                  //       await preferences.reload();
                  //       print(preferences.get("destination"));
                  //      },
                  //   child:const Text('continue'),
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
