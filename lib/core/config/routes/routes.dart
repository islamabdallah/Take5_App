import 'package:flutter/material.dart';
import '../../../presentation/screens/home/home.dart';
import '../../../presentation/screens/login/login_screen.dart';
import '../../../presentation/screens/step_one_dangers/step_one_dangers.dart';
import '../../../presentation/screens/step_one_questions/step_one_questions.dart';
import '../../../presentation/screens/step_two/step_two.dart';
import '../../../presentation/screens/step_two_waiting/step_two_waiting_screen.dart';
import '../../../presentation/screens/trip/trip.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {

      case LoginScreen.routeName:
        return _materialRoute(const LoginScreen(), LoginScreen.routeName);

      case StepTwoWaitingScreen.routeName:
        return _materialRoute(const StepTwoWaitingScreen(), StepTwoWaitingScreen.routeName);

      case HomeScreen.routeName:
        return _materialRoute(const HomeScreen(), HomeScreen.routeName);

      case TripScreen.routeName:
        return _materialRoute(const TripScreen(), TripScreen.routeName);

      case StepOneQuestionsScreen.routeName:
        return _materialRoute(const StepOneQuestionsScreen(), StepOneQuestionsScreen.routeName);
      case StepOneDangersScreen.routeName:
        return _materialRoute(const StepOneDangersScreen(), StepOneDangersScreen.routeName);


      case StepTwoScreen.routeName:
        return _materialRoute(const StepTwoScreen(), StepTwoScreen.routeName);

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _materialRoute(
            const Scaffold(
              body: SafeArea(
                child: Center(
                  child: Text('Route Error'),
                ),
              ),
            ),
            '404');
    }
  }

  static Route<dynamic> _materialRoute(Widget view, String routeName) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => view,
    );
  }
}
