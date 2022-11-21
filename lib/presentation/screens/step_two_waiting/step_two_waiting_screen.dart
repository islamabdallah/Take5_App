import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:signalr_core/signalr_core.dart';
import 'package:take5/logic/step_two_cubit/step_two_cubit.dart';
import 'package:take5/presentation/screens/step_two/step_two.dart';

import '../../../core/constants/app_colors.dart';
import '../../../injection_container.dart';

class StepTwoWaitingScreen extends StatefulWidget {
  static const routeName = 'StepTwoWaitingScreen';
  const StepTwoWaitingScreen({Key? key}) : super(key: key);

  @override
  State<StepTwoWaitingScreen> createState() => _StepTwoWaitingScreenState();
}

class _StepTwoWaitingScreenState extends State<StepTwoWaitingScreen> {


  @override
  void initState() {
    // var sr =  sl<SignalRHelper>();
    // sr.initiateConnection(context);

    startSR();
    super.initState();
  }


  startSR() async {

    final connection = HubConnectionBuilder().withUrl(
        'http://20.86.97.165/PriorityTool/NotificationHub',
        HttpConnectionOptions(
          // skipNegotiation: true,
          // transport:HttpTransportType.webSockets ,
          logging: (level, message) => print(message),
        )).build();

    await connection.start();
    print('start signalR');
    connection.on('SubmitNotification', (message) {
      print(message.toString());
    });

    // await connection.invoke('SendMessage', args: ['Bob', 'Says hi!']);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StepTwoCubit>(
      create: (context) => sl<StepTwoCubit>(),
      child: BlocConsumer<StepTwoCubit,StepTwoState>(
        listener: (context,state){},
        builder: (context,state)
        {
          var cubit=StepTwoCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leading: Builder(
                  builder: (context) {
                    return IconButton(icon:const Icon(Icons.menu_open),onPressed: (){
                      Scaffold.of(context).openDrawer();
                    });
                  }
              ),
              toolbarHeight: 80,
              elevation: 0,
              iconTheme:const IconThemeData(color: AppColors.redColor),
              title:  Text(
                cubit.isRequestStep2?'المرحله التانيه':'انتظار المرحله التانيه',
                style:const TextStyle(color: AppColors.redColor),
              ),
              backgroundColor: Colors.white,
              centerTitle: true,
            ),
            body: Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Image.asset(cubit.isRequestStep2?'assets/images/request_step_2.png':'assets/images/waiting_step_2.png'),
                  SizedBox(
                    height: 60.h,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        cubit.isRequestStep2==true?cubit.toggleToWaitingToStepTwo():Navigator.pushNamed(context, StepTwoScreen.routeName);
                      },
                      child: cubit.isRequestStep2==true?Text("Request step 2".tr()):Text( "waiting step 2".tr()),
                    ),
                  )
                ],
              ),
          );
        },
      ),
    );
  }
}