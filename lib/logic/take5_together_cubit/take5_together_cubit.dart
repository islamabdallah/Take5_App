import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take5/logic/take5_together_cubit/take5_together_states.dart';
import '../../data/models/driver/driver.dart';
import '../../data/models/take5_together/take5_together.dart';
import '../../data/repositories/take5_repository.dart';

class Take5TogetherCubit extends Cubit<Take5TogetherStates> {
  static Take5TogetherCubit get(context) => BlocProvider.of(context);
  final Take5Repository take5Repository;

  Take5TogetherCubit({required this.take5Repository}) : super(InitialTake5TogetherState());
  TextEditingController coWorkerController = TextEditingController();
  TextEditingController whoStartConversationController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  List<Driver>drivers=[];
  getDrivers() {
    print('test');
    emit(Take5TogetherGetDriversLoading());
    final result = take5Repository.getCachedDrivers();
    result.fold((failure) {
      emit(Take5TogetherGetDriversFail(failure.message));
    }, (driversResponse) {
      if (driversResponse!= null) {
        drivers = driversResponse;
        print(drivers);
      }
      emit(Take5TogetherGetDriversSuccess());
    });
  }
  List<Take5TogetherModel>notes=[];
  addToNotes(Take5TogetherModel take5TogetherModel)
  {
    notes.add(take5TogetherModel);
    emit(Take5TogetherAddToNotesSuccess());
  }
}