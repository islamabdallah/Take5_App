import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:signalr_core/signalr_core.dart';
import 'package:take5/core/constants/app_assets.dart';
import 'package:take5/logic/step_two_cubit/step_two_cubit.dart';
import 'package:take5/presentation/utils/dialogs/message_dialog.dart';
import '../../../core/constants/app_colors.dart';
import '../../../injection_container.dart';
import '../../utils/dialogs/loading_dialog.dart';
import '../../utils/helpers/helpers.dart';
import '../../widgets/drawer_widget.dart';
import '../../widgets/main_button.dart';
import '../../widgets/my_app_bar.dart';
import '../home/home.dart';
import 'step_two_waiting_screen.dart';

class StepTwoStartRequestScreen extends StatefulWidget {
  static const routeName = 'StepTwoStartRequestScreen';

  const StepTwoStartRequestScreen({Key? key}) : super(key: key);

  @override
  State<StepTwoStartRequestScreen> createState() =>
      _StepTwoStartRequestScreenState();
}

class _StepTwoStartRequestScreenState extends State<StepTwoStartRequestScreen> {
  @override
  void initState() {
    saveLastRoute(StepTwoStartRequestScreen.routeName);
    // var sr =  sl<SignalRHelper>();
    // sr.initiateConnection(context);
    // startSR();
    super.initState();
  }

  startSR() async {
    final connection = HubConnectionBuilder()
        .withUrl(
            'http://20.86.97.165/PriorityTool/NotificationHub',
            HttpConnectionOptions(
              // skipNegotiation: true,
              // transport:HttpTransportType.webSockets ,
              logging: (level, message) => print(message),
            ))
        .build();

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
      child: BlocConsumer<StepTwoCubit, StepTwoState>(
        listener: (context, state) {
          if (state is StepTwoStartRequestLoading) {
            loadingAlertDialog(context);
          }
          if (state is StepTwoStartRequestSuccess) {
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
                Navigator.pushNamedAndRemoveUntil(
                    context, StepTwoWaitingScreen.routeName, (route) => false);
          }
        }
          if (state is StepTwoStartRequestFail) {
            Navigator.pop(context);
            showMessageDialog(
                context: context, isSucceeded: false, message: state.message);
          }
          },
        builder: (context, state) {
          var cubit = StepTwoCubit.get(context);
          return Scaffold(
            drawer:  const DrawerWidget(),
            appBar: MyAppBar(title: "Request step 2".tr()),
            body: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Image.asset(AppAssets.stepTwoStartRequest),
                SizedBox(
                  height: 60.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: MainButton(
                    onPressed: () {
                      cubit.stepTwoStartRequest();
                    }, title:"Request step 2".tr(),),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
