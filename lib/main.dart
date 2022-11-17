import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:take5/logic/home_cubit/home_states.dart';
import 'package:take5/presentation/screens/step_one_dangers/step_one_dangers.dart';
import 'package:take5/presentation/utils/dialogs/loading_dialog.dart';
import 'package:take5/presentation/utils/dialogs/message_dialog.dart';
import 'package:take5/presentation/utils/helpers/helpers.dart';
import 'core/bloc_observer.dart';
import 'core/config/routes/routes.dart';
import 'core/constants/app_assets.dart';
import 'core/constants/app_colors.dart';
import 'core/constants/app_constants.dart';
import 'core/utils/services/background_service.dart';
import 'core/utils/services/loaction_service.dart';
import 'data/models/user/user.dart';
import 'injection_container.dart' as di;

import 'injection_container.dart';
import 'logic/home_cubit/home_cubit.dart';

import 'presentation/screens/home/home.dart';
import 'presentation/screens/login/login_screen.dart';
import 'presentation/screens/step_one_questions/step_one_questions.dart';
import 'presentation/screens/step_two/step_two.dart';
import 'presentation/screens/step_two_waiting/step_two_waiting_screen.dart';
import 'presentation/screens/trip/trip.dart';

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
            builder: (context, child) {
              return BlocListener<HomeCubit, HomeStates>(
                  listener: (context, state) {
              // final context = navigatorKey.currentState!.overlay!.context;
                if (state is HomeCheckTripStatusLoading) {
                  loadingAlertDialog(AppConstants.navigatorKey.currentContext!);
                }
                if (state is HomeCheckTripStatusSuccess) {
                  // final context = navigatorKey.currentState!.overlay!.context;
                  Navigator.pop(AppConstants.navigatorKey.currentContext!);
                  showMessageDialog(
                      context: AppConstants.navigatorKey.currentContext!,
                      isSucceeded: true,
                      message: state.status);
                }
              },
                child: child,
              );
            },
            onGenerateRoute: AppRoutes.onGenerateRoutes,
            //initialRoute: getLastRoute(),
            initialRoute: LoginScreen.routeName,
            // initialRoute: StepTwoWaitingScreen.routeName,
            // initialRoute: StepOneQuestionsScreen.routeName,
            //initialRoute: StepOneDangersScreen.routeName,
            //  initialRoute: HomeScreen.routeName,
            //initialRoute: StepTwoScreen.routeName,
            //initialRoute: TripScreen.routeName,
          ),
        );
      },
    );
  }
}
