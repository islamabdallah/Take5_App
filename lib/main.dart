import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:take5/logic/home_cubit/home_states.dart';
import 'package:take5/presentation/screens/home/home.dart';
import 'package:take5/presentation/screens/step_one/preparing_step.dart';
import 'package:take5/presentation/screens/step_one/step_one_questions.dart';
import 'package:take5/presentation/screens/step_two/step_two.dart';
import 'package:take5/presentation/screens/step_two_waiting/step_two_waiting_screen.dart';
import 'package:take5/presentation/screens/take5_together/take5_together.dart';
import 'package:take5/presentation/screens/trip/trip.dart';
import 'package:take5/presentation/utils/dialogs/loading_dialog.dart';
import 'package:take5/presentation/utils/dialogs/message_dialog.dart';
import 'core/bloc_observer.dart';
import 'core/config/routes/routes.dart';
import 'core/constants/app_assets.dart';
import 'core/constants/app_colors.dart';
import 'core/constants/app_constants.dart';
import 'core/utils/services/background_service.dart';
import 'data/models/user/user.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';
import 'logic/home_cubit/home_cubit.dart';
import 'logic/take5_together_cubit/take5_together_cubit.dart';
import 'presentation/screens/end_trip/end_trip.dart';
import 'presentation/screens/login/login_screen.dart';
import 'presentation/screens/step_two_waiting/step_two_start_request_screen.dart';
import 'presentation/utils/helpers/helpers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await di.init();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>('user');
  await Hive.openBox('route');
  await Hive.openBox('takeFiveSurvey');
  await BackgroundService.initializeService();

  //todo remove this
  getLastRoute();

  final service = FlutterBackgroundService();
  var isRunning = await service.isRunning();
  if (isRunning == true) {
    service.invoke("stopService");
  }

  BlocOverrides.runZoned(
    () {
      runApp(
        EasyLocalization(
          path: AppAssets.appTranslations,
          supportedLocales: const [
            Locale('en'),
            Locale('ar'),
          ],
          fallbackLocale: const Locale('en'),
          startLocale: const Locale('ar'),
          child: const MyApp(),
        ),
      );
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      // splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<HomeCubit>(create: (context) => sl<HomeCubit>()),
            // BlocProvider<Take5TogetherCubit>(create: (context) => sl<Take5TogetherCubit>()),
          ],
          child: MaterialApp(
            navigatorKey: AppConstants.navigatorKey,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.backgroundColor,
              primarySwatch: AppColors.materialMainColor,
              iconTheme: IconThemeData(color: AppColors.mainColor),
              fontFamily: 'Vazirmatn',
              // textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
              // useMaterial3: true,
            ),
            builder: (_, child) {
              return BlocListener<HomeCubit, HomeStates>(
                listener: (context, state) {
                  var context = AppConstants.navigatorKey.currentContext!;
                  // final context = navigatorKey.currentState!.overlay!.context;
                  if (state is HomeCheckTripStatusLoading) {
                    loadingAlertDialog(context);
                  }
                  if (state is HomeCheckTripStatusSuccess) {
                    // final context = navigatorKey.currentState!.overlay!.context;
                    Navigator.pop(context);
                    switch (state.status) {
                      case 'Done':
                        showMessageDialog(
                          context: context,
                          isSucceeded: true,
                          message: 'لا يوجد تغيير في الرحلة',
                        );
                        break;
                      case 'Cancelled':
                        showMessageDialog(
                            context: context,
                            isSucceeded: true,
                            message: 'تم الغاء الرحلة',
                            onPressedOk: () {
                              Navigator.pushNamedAndRemoveUntil(context,
                                  HomeScreen.routeName, (route) => false);
                            });

                        break;
                      case 'Converted':
                        showMessageDialog(
                            context: context,
                            isSucceeded: true,
                            message: 'تم تحويل الرحلة',
                            onPressedOk: () {
                              Navigator.pushNamedAndRemoveUntil(context,
                                  HomeScreen.routeName, (route) => false);
                            });
                        break;
                      default:
                    }
                  }
                },
                child: child,
              );
            },
            onGenerateRoute: AppRoutes.onGenerateRoutes,
           initialRoute: getLastRoute(),
           // initialRoute: LoginScreen.routeName,
            // initialRoute: StepTwoWaitingScreen.routeName,
            //initialRoute: StepOneQuestionsScreen.routeName,
            // initialRoute: PreparingStepScreen.routeName,
            // initialRoute: StepOneDangersScreen.routeName,
            // initialRoute: HomeScreen.routeName,
            // initialRoute: StepTwoScreen.routeName,
            // initialRoute: TripScreen.routeName,
           //initialRoute: Take5TogetherScreen.routeName,
           //  initialRoute: EndTripScreen.routeName,
            // initialRoute: StepTwoStartRequestScreen.routeName,
            // initialRoute: StepTwoWaitingScreen.routeName,
          ),
        );
      },
    );
  }
}
