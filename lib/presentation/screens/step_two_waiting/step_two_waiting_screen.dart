import 'package:flutter/material.dart';
import 'package:signalr_core/signalr_core.dart';

import '../../../core/utils/services/signal_r_helper.dart';
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
    return Scaffold(
      body: Container(),
    );
  }
}