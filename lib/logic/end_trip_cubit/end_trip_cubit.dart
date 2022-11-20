import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../data/repositories/take5_repository.dart';

part 'end_trip_state.dart';

class EndTripCubit extends Cubit<EndTripState> {
  static EndTripCubit get(context) => BlocProvider.of(context);

  final Take5Repository take5Repository;

  EndTripCubit({required this.take5Repository}) : super(EndTripInitial());

  Future<void> endTrip() async {
    emit(EndTripLoading());
    final result = await take5Repository.sendCollection();
    result.fold((failure) {
      emit(EndTripFail(failure.message));
    }, (startTripResponse) {
      emit(EndTripSuccess());
    });
  }
}
