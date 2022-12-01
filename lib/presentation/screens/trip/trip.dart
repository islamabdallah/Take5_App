import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:take5/presentation/widgets/drawer_widget.dart';
import 'package:take5/presentation/widgets/powered_by_cemex.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {

    });
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
            drawer: const DrawerWidget(),
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
              title:const Text(
                'المسافة',
                style: TextStyle(color: AppColors.redColor),
              ),
              backgroundColor: Colors.white,
              centerTitle: true,
            ),
            body: Center(
              child: Column(
                children: [
                 const Spacer(),
                  Container(
                    width: 274.w,
                    height: 470.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow:const [
                        BoxShadow(
                          color: Color(0x3f000000),
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child:
                    state is StartTripLoadingTripState?
                     const Center(child: CircularProgressIndicator())
                       :
                    Column(
                      children: [
                        Container(
                          width: 241.w,
                          child: Lottie.asset(
                            AppAssets.truck,
                            fit: BoxFit.cover
                          ),
                        ),
                        Text(
                          state is ArrivedSuccessTripState?
                            'تم التوصيل'
                                :
                          " متبقي ${(cubit.d!/1000).toStringAsFixed(2)} كم ",
                          textAlign: TextAlign.center,
                          style:const TextStyle(
                            color: Color(0xff5d5d5d),
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 40.h,),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: ElevatedButton(
                            onPressed: cubit.isButtonEnabled
                                ? () {
                                    Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        StepOneQuestionsScreen.routeName,
                                        (route) => false);
                                  }
                                : null,
                            child: Text('املأ الاستمارة'),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r), // <-- Radius
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                 const Spacer(flex: 2,),
                  const PoweredByCemex(),
                  SizedBox(height: 20.h,),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
