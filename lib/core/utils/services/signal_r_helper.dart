import 'package:flutter/material.dart';
import 'package:signalr_core/signalr_core.dart';

class SignalRHelper{
  late final HubConnection connection;
  SignalRHelper(String hubBaseURL){
    connection = HubConnectionBuilder()
        .withUrl(
        hubBaseURL,
        HttpConnectionOptions(
          logging: (level, message)
          => print(message),
        )
    ).build();
  }
  initiateConnection(BuildContext context) async {
    await connection.start();
    connection.on("ReceiveMessage", (arguments){
      print(arguments);
      //Do what needs to be done
    });
  }
}