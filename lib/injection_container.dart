
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:take5/core/network/device_connectivity.dart';

import 'core/utils/services/signal_r_helper.dart';
import 'data/repositories/take5_repository.dart';
import 'logic/end_trip_cubit/end_trip_cubit.dart';
import 'logic/home_cubit/home_cubit.dart';
import 'logic/login_cubit/login_cubit.dart';
import 'core/network/network_availability.dart';
import 'core/utils/services/attachments_service.dart';
import 'core/utils/services/local_storage_service.dart';
import 'core/utils/services/dio_client.dart';
import 'data/datasources/remote_data_source.dart';
import 'data/datasources/local_data_source.dart';
import 'logic/step_one_cubit/step_one_cubit.dart';
import 'logic/step_two_cubit/step_two_cubit.dart';
import 'logic/trip_cubit/trip_cubit.dart';
final sl = GetIt.instance;

Future<void> init() async {
//! blocs/cubits

  sl.registerFactory(() => LoginCubit(take5Repository: sl()));
  sl.registerFactory(() => HomeCubit(take5Repository: sl()));
  sl.registerFactory(() => TripCubit(take5Repository: sl()));
  sl.registerFactory(() => StepTwoCubit(take5Repository: sl()));
  sl.registerFactory(() => StepOneCubit(take5Repository: sl()));
  sl.registerFactory(() => EndTripCubit(take5Repository: sl()));

//! Repositories
  sl.registerLazySingleton<Take5Repository>(() => Take5RepositoryImpl(
        remoteDataSource: sl(),
        localDataSource: sl(),
        deviceConnectivity: sl(),
      ));

//! Datasources
  sl.registerLazySingleton<RemoteDataSource>(
      () => FakeRemoteDataSourceImpl());

  // sl.registerLazySingleton<RemoteDataSource>(
  //     () => RemoteDataSourceImpl(client: sl()));

  sl.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl());

//! Core
  sl.registerLazySingleton(() => DioClient(sl()));
  sl.registerLazySingleton(() => LocalStorageService(sl()));
  sl.registerLazySingleton<NetworkAvailability>(() => NetworkAvailabilityImpl(sl()));
  sl.registerLazySingleton<DeviceConnectivity>(() => DeviceConnectivityImpl(sl()));
  sl.registerLazySingleton(() => AttachmentsService(sl()));
  sl.registerFactory(() => SignalRHelper('http://localhost:5000/chatHub'));

//! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton(() => ImagePicker());
}
