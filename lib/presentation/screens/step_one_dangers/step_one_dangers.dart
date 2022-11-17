import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:take5/presentation/screens/step_one_dangers/widgets/selected_dangers.dart';
import '../../../injection_container.dart';
import '../../../logic/step_one_cubit/step_one_cubit.dart';
import '../../utils/helpers/helpers.dart';
import '../../widgets/danger.dart';

class StepOneDangersScreen extends StatefulWidget {
  static const routeName = 'StepOneDangersScreen';

  const StepOneDangersScreen({Key? key}) : super(key: key);

  @override
  State<StepOneDangersScreen> createState() => _StepOneDangersScreenState();
}

class _StepOneDangersScreenState extends State<StepOneDangersScreen> {
  Map<String, List<int>> tripDangerMeasureControls = {};

  int c = 1;

  void addTripDanger() {}

  @override
  void initState() {
    saveLastRoute(StepOneDangersScreen.routeName);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<StepOneCubit>()..getStepOneQuestions(),
      child: BlocConsumer<StepOneCubit, StepOneState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = StepOneCubit.get(context);
          final _formKey = GlobalKey<FormBuilderState>();
          return Scaffold(
              appBar: AppBar(
                title:const Text('مخاطر المرحله الاولى'),
                centerTitle: true,
              ),
              body: SingleChildScrollView(
                child: FormBuilder(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    children: [
                      ...List.generate(c, (index) => const Danger(),),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          itemCount: cubit.dangers.length,
                          itemBuilder:(context,index)=>SelectedDangerWidget(),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            //_formKey.currentState?.validate()==true
                            cubit.submitAnswers();
                          },
                          child: Text('print')),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
