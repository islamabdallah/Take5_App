// import 'package:dartz/dartz.dart';
// import '../../core/constants/app_constants.dart';
// import '../../core/errors/exceptions.dart';
// import '../datasources/local_data_source.dart';
// import '../models/all_trip_steps/all_trip_steps.dart';
// import '../models/driver/driver.dart';
// import '../models/requests/destination_arrived_request/destination_arrived_request.dart';
// import '../models/requests/step_one_complete_request/step_one_complete_request.dart';
// import '../models/requests/step_two_complete_request/step_two_complete_request.dart';
// import '../models/requests/step_two_start_request/step_two_start_request.dart';
// import '../models/requests/trip_start_request/trip_start_request.dart';
// import '../models/responses/trip_pending_response/user_trip_response.dart';
// import '../models/responses/trip_start_response/trip_start_response.dart';
// import '../models/responses/user_login_response/user_login_response.dart';
// import '../../core/errors/failures.dart';
// import '../datasources/remote_data_source.dart';
// import '../../core/network/device_connectivity.dart';
// import '../models/take5_together/take5_together.dart';
//
// abstract class Take5Repository {
//   Future<Either<Failure, UserLoginResponse>> loginUser(
//       {required int driverNumber, required String password});
//
//   Either<Failure, Unit> clearUser();
//
//   Future<Either<Failure, UserTripResponse>> getCurrentTrip(
//       {required String userId});
//
//   Future<Either<Failure, TripStartResponse>> startTrip(
//       {required TripStartRequest tripStartRequest});
//
//   Future<Either<Failure, String>> arrivedToDestination(
//       {required TripDestinationArrivedModel tripDestinationArrivedModel});
//
//   Future<Either<Failure, String>> completeStepOne(
//       {required SurveyStepOneAnswersAPIModel surveyStepOneAnswersAPIModel});
//
//   Future<Either<Failure, String>> startStepTwo(
//       {required Take5StepTwoRequestAPIModel take5StepTwoRequestAPIModel});
//
//   Future<Either<Failure, bool>> getStepTwoStartRequestRespond(
//       {AllTripStepsModel? allTripStepsModel});
//
//   Future<Either<Failure, String>> completeStepTwo(
//       {required SurveyStepTwoAnswersAPIModel surveyStepTwoAnswersAPIModel});
//
//   Future<Either<Failure, String>> take5Together(
//       {required List<Take5TogetherModel> notes});
//
//   Future<Either<Failure, String>> startStepTwoOffline(
//       {required Take5StepTwoRequestAPIModel take5StepTwoRequestAPIModel});
//
//   Future<Either<Failure, String>> checkTripStatus();
//
//   Either<Failure, TakeFiveSurvey?> getCachedTakeFiveSurvey();
//
//   Either<Failure, List<Driver>?> getCachedDrivers();
//
//   Future<Either<Failure, String>> endTrip();
//
//   Future<Either<Failure, String>> sendCollection();
// }
//
// class Take5RepositoryImpl extends Take5Repository {
//   final LocalDataSource localDataSource;
//   final RemoteDataSource remoteDataSource;
//   final DeviceConnectivity deviceConnectivity;
//
//   Take5RepositoryImpl({
//     required this.remoteDataSource,
//     required this.localDataSource,
//     required this.deviceConnectivity,
//   });
//
//   @override
//   Future<Either<Failure, UserLoginResponse>> loginUser(
//       {required int driverNumber, required String password}) async {
//     //check device connectivity
//     if (await deviceConnectivity.isConnected == false) {
//       return const Left(DeviceConnectivityFailure());
//     }
//     try {
//       UserLoginResponse result = await remoteDataSource.loginUser(
//           driverNumber: driverNumber, password: password);
//       localDataSource.cacheUser(result.data.userAPIModel);
//       return Right(result);
//     } on ServerException catch (e) {
//       return Left(ServerFailure(e.message));
//     }
//   }
//
//   @override
//   Either<Failure, Unit> clearUser() {
//     //todo ask Islam
//     // sendCollection();
//     try {
//       localDataSource.clearCachedUser();
//       return const Right(unit);
//     } catch (e) {
//       return const Left(StorageFailure("Error"));
//     }
//   }
//
//   // already online
//   @override
//   Future<Either<Failure, UserTripResponse>> getCurrentTrip(
//       {required String userId}) async {
//     try {
//       UserTripResponse result =
//           await remoteDataSource.getCurrentTrip(userId: userId);
//       if (result.data != null) {
//         localDataSource.cacheTrip(result.data!.tripAPIModel); //missed
//         localDataSource.cacheTakeFiveSurvey(result.data!.allSurveyModel);
//         localDataSource.cacheDrivers(result.data!.drivers);
//       }
//       // print(result.data.ALLSurveyModel);
//       return Right(result);
//     } on ServerException catch (e) {
//       return Left(ServerFailure(e.message));
//     }
//   }
//
//   // already online
//   @override
//   Future<Either<Failure, TripStartResponse>> startTrip(
//       {required TripStartRequest tripStartRequest}) async {
//     try {
//       TripStartResponse result =
//           await remoteDataSource.startTrip(tripStartRequest: tripStartRequest);
//       return Right(result);
//     } on ServerException catch (e) {
//       return Left(ServerFailure(e.message));
//     }
//   }
//
// //done
//   @override
//   Future<Either<Failure, String>> arrivedToDestination(
//       {required TripDestinationArrivedModel
//           tripDestinationArrivedModel}) async {
//     if (AppConstants.trip.jobsiteHasNetworkCoverage) {
//       if (await deviceConnectivity.isConnected == false) {
//         return const Left(DeviceConnectivityFailure());
//       }
//       AllTripStepsModel allTripStepsModel;
//       if (localDataSource.getCachedAllTripStepsModel() == null) {
//         allTripStepsModel = AllTripStepsModel(
//             userId: AppConstants.user.userId,
//             tripId: AppConstants.trip.tripNumber,
//             jobsiteId: AppConstants.trip.jobsiteNumber);
//       } else {
//         allTripStepsModel = localDataSource.getCachedAllTripStepsModel()!;
//       }
//       allTripStepsModel = allTripStepsModel.copyWith(
//           tripDestinationArrivedModel: tripDestinationArrivedModel,
//           endStatus: 'DestinationArrived');
//       try {
//         String result = await remoteDataSource.sendCollection(
//             allTripStepsModel: allTripStepsModel);
//         //done
//         localDataSource.clearCollection();
//         return Right(result);
//       } on ServerException catch (e) {
//         //save local
//         String result =
//             localDataSource.cacheAllTripStepsModel(allTripStepsModel);
//         return Right(result);
//       }
//     } else {
//       AllTripStepsModel allTripStepsModel;
//       if (localDataSource.getCachedAllTripStepsModel() == null) {
//         allTripStepsModel = AllTripStepsModel(
//             userId: AppConstants.user.userId,
//             tripId: AppConstants.trip.tripNumber,
//             jobsiteId: AppConstants.trip.jobsiteNumber);
//       } else {
//         allTripStepsModel = localDataSource.getCachedAllTripStepsModel()!;
//       }
//       allTripStepsModel = allTripStepsModel.copyWith(
//           tripDestinationArrivedModel: tripDestinationArrivedModel,
//           endStatus: 'DestinationArrived');
//       localDataSource.cacheAllTripStepsModel(allTripStepsModel);
//       return const Right('تم الحفظ');
//     }
//   }
//
// //done
//   @override
//   Future<Either<Failure, String>> completeStepOne(
//       {required SurveyStepOneAnswersAPIModel
//           surveyStepOneAnswersAPIModel}) async {
//     if (AppConstants.trip.jobsiteHasNetworkCoverage) {
//       //check device connectivity
//       if (await deviceConnectivity.isConnected == false) {
//         return const Left(DeviceConnectivityFailure());
//       }
//       AllTripStepsModel allTripStepsModel;
//       if (localDataSource.getCachedAllTripStepsModel() == null) {
//         allTripStepsModel = AllTripStepsModel(
//             userId: AppConstants.user.userId,
//             tripId: AppConstants.trip.tripNumber,
//             jobsiteId: AppConstants.trip.jobsiteNumber);
//       } else {
//         allTripStepsModel = localDataSource.getCachedAllTripStepsModel()!;
//       }
//       allTripStepsModel = allTripStepsModel.copyWith(
//           surveyStepOneAnswersAPIModel: surveyStepOneAnswersAPIModel,
//           endStatus: 'SurveyStepOneCompleted');
//       try {
//         String result = await remoteDataSource.sendCollection(
//             allTripStepsModel: allTripStepsModel);
//         //done
//         localDataSource.clearCollection();
//         return Right(result);
//       } on ServerException catch (e) {
//         //save local
//         String result =
//             localDataSource.cacheAllTripStepsModel(allTripStepsModel);
//         return Right(result);
//       }
//     } else {
//       AllTripStepsModel allTripStepsModel;
//       if (localDataSource.getCachedAllTripStepsModel() == null) {
//         allTripStepsModel = AllTripStepsModel(
//             userId: AppConstants.user.userId,
//             tripId: AppConstants.trip.tripNumber,
//             jobsiteId: AppConstants.trip.jobsiteNumber);
//       } else {
//         allTripStepsModel = localDataSource.getCachedAllTripStepsModel()!;
//       }
//       allTripStepsModel = allTripStepsModel.copyWith(
//           surveyStepOneAnswersAPIModel: surveyStepOneAnswersAPIModel,
//           endStatus: 'SurveyStepOneCompleted');
//       localDataSource.cacheAllTripStepsModel(allTripStepsModel);
//       return const Right('تم الحفظ');
//     }
//   }
//
// //done
//   @override
//   Future<Either<Failure, String>> startStepTwo(
//       {required Take5StepTwoRequestAPIModel
//           take5StepTwoRequestAPIModel}) async {
//     if (AppConstants.trip.jobsiteHasNetworkCoverage) {
//       //check device connectivity
//       if (await deviceConnectivity.isConnected == false) {
//         return const Left(DeviceConnectivityFailure());
//       }
//       AllTripStepsModel allTripStepsModel;
//       if (localDataSource.getCachedAllTripStepsModel() == null) {
//         allTripStepsModel = AllTripStepsModel(
//             userId: AppConstants.user.userId,
//             tripId: AppConstants.trip.tripNumber,
//             jobsiteId: AppConstants.trip.jobsiteNumber);
//       } else {
//         allTripStepsModel = localDataSource.getCachedAllTripStepsModel()!;
//       }
//       allTripStepsModel = allTripStepsModel.copyWith(
//           take5StepTwoRequestAPIModel: take5StepTwoRequestAPIModel,
//           endStatus: 'StepTwoRequested');
//       try {
//         String result = await remoteDataSource.sendCollection(
//             allTripStepsModel: allTripStepsModel);
//         //done
//         localDataSource.clearCollection();
//         return Right(result);
//       } on ServerException catch (e) {
//         //save local
//         //make response time same as request
//         String result = localDataSource.cacheAllTripStepsModel(
//             allTripStepsModel.copyWith(
//                 take5StepTwoRequestAPIModel:
//                     take5StepTwoRequestAPIModel.copyWith(
//                         responseDate:
//                             take5StepTwoRequestAPIModel.requestDate)));
//         return Right(result);
//       }
//     } else {
//       AllTripStepsModel allTripStepsModel;
//       if (localDataSource.getCachedAllTripStepsModel() == null) {
//         allTripStepsModel = AllTripStepsModel(
//             userId: AppConstants.user.userId,
//             tripId: AppConstants.trip.tripNumber,
//             jobsiteId: AppConstants.trip.jobsiteNumber);
//       } else {
//         allTripStepsModel = localDataSource.getCachedAllTripStepsModel()!;
//       }
//       allTripStepsModel = allTripStepsModel.copyWith(
//           take5StepTwoRequestAPIModel: take5StepTwoRequestAPIModel,
//           endStatus: 'StepTwoRequested');
//       localDataSource.cacheAllTripStepsModel(allTripStepsModel);
//       return const Right('تم الحفظ');
//     }
//   }
//
// //done
//   @override
//   Future<Either<Failure, String>> completeStepTwo(
//       {required SurveyStepTwoAnswersAPIModel
//           surveyStepTwoAnswersAPIModel}) async {
//     if (AppConstants.trip.jobsiteHasNetworkCoverage) {
//       //check device connectivity
//       if (await deviceConnectivity.isConnected == false) {
//         return const Left(DeviceConnectivityFailure());
//       }
//       AllTripStepsModel allTripStepsModel;
//       if (localDataSource.getCachedAllTripStepsModel() == null) {
//         allTripStepsModel = AllTripStepsModel(
//             userId: AppConstants.user.userId,
//             tripId: AppConstants.trip.tripNumber,
//             jobsiteId: AppConstants.trip.jobsiteNumber);
//       } else {
//         allTripStepsModel = localDataSource.getCachedAllTripStepsModel()!;
//       }
//       allTripStepsModel = allTripStepsModel.copyWith(
//           surveyStepTwoAnswersAPIModel: surveyStepTwoAnswersAPIModel,
//           endStatus: 'SurveyStepTwoCompleted');
//       try {
//         String result = await remoteDataSource.sendCollection(
//             allTripStepsModel: allTripStepsModel);
//         //done
//         localDataSource.clearCollection();
//         return Right(result);
//       } on ServerException catch (e) {
//         //save local
//         String result =
//             localDataSource.cacheAllTripStepsModel(allTripStepsModel);
//         return Right(result);
//       }
//     } else {
//       AllTripStepsModel allTripStepsModel;
//       if (localDataSource.getCachedAllTripStepsModel() == null) {
//         allTripStepsModel = AllTripStepsModel(
//             userId: AppConstants.user.userId,
//             tripId: AppConstants.trip.tripNumber,
//             jobsiteId: AppConstants.trip.jobsiteNumber);
//       } else {
//         allTripStepsModel = localDataSource.getCachedAllTripStepsModel()!;
//       }
//       allTripStepsModel = allTripStepsModel.copyWith(
//           surveyStepTwoAnswersAPIModel: surveyStepTwoAnswersAPIModel,
//           endStatus: 'SurveyStepTwoCompleted');
//       localDataSource.cacheAllTripStepsModel(allTripStepsModel);
//       return const Right('تم الحفظ');
//     }
//   }
//
//   @override
//   Future<Either<Failure, String>> take5Together(
//       {required List<Take5TogetherModel> notes}) async {
//     AllTripStepsModel allTripStepsModel;
//     if (localDataSource.getCachedAllTripStepsModel() == null) {
//       allTripStepsModel = AllTripStepsModel(
//           userId: AppConstants.user.userId,
//           tripId: AppConstants.trip.tripNumber,
//           jobsiteId: AppConstants.trip.jobsiteNumber);
//     } else {
//       allTripStepsModel = localDataSource.getCachedAllTripStepsModel()!;
//     }
//     allTripStepsModel =
//         allTripStepsModel.copyWith(take5TogetherAPIModels: notes);
//     localDataSource.cacheAllTripStepsModel(allTripStepsModel);
//     return const Right('تم الحفظ');
//   }
//
//   @override
//   Either<Failure, TakeFiveSurvey?> getCachedTakeFiveSurvey() {
//     try {
//       TakeFiveSurvey? result = localDataSource.getCachedTakeFiveSurvey();
//       return Right(result);
//     } on ServerException catch (e) {
//       return Left(ServerFailure(e.message));
//     }
//   }
//
//   @override
//   Either<Failure, List<Driver>?> getCachedDrivers() {
//     try {
//       List<Driver>? result = localDataSource.getCachedDrivers();
//       return Right(result);
//     } on ServerException catch (e) {
//       return Left(ServerFailure(e.message));
//     }
//   }
//
//   @override
//   Future<Either<Failure, String>> endTrip() async {
//     if (await deviceConnectivity.isConnected == false) {
//       return const Left(DeviceConnectivityFailure());
//     }
//     try {
//       AllTripStepsModel? allTripStepsModel =
//           localDataSource.getCachedAllTripStepsModel();
//       allTripStepsModel ??= AllTripStepsModel(
//           userId: AppConstants.user.userId,
//           tripId: AppConstants.trip.tripNumber,
//           jobsiteId: AppConstants.trip.jobsiteNumber);
//       allTripStepsModel =
//           allTripStepsModel.copyWith(endStatus: 'TripCompleted');
//       String result = await remoteDataSource.sendCollection(
//           allTripStepsModel: allTripStepsModel);
//       //done
//       localDataSource.clearCollection();
//       return Right(result);
//     } on ServerException catch (e) {
//       return Left(ServerFailure(e.message));
//     }
//   }
//
//   @override
//   Future<Either<Failure, String>> sendCollection() async {
//     if (await deviceConnectivity.isConnected == false) {
//       return const Left(DeviceConnectivityFailure());
//     }
//
//     // if(!AppConstants.trip.jobsiteHasNetworkCoverage && AppConstants.trip.tripStatus!="Pending"){
//     //   return const Left(DeviceConnectivityFailure());
//     // }
//     try {
//       AllTripStepsModel? collectionModel =
//           localDataSource.getCachedAllTripStepsModel();
//
//       if (collectionModel != null) {
//         await remoteDataSource.sendCollection(
//             allTripStepsModel: collectionModel);
//       }
//       //done
//       localDataSource.clearCollection();
//       return const Right('تم الارسال');
//     } on ServerException catch (e) {
//       return Left(ServerFailure(e.message));
//     }
//   }
//
//   @override
//   Future<Either<Failure, String>> checkTripStatus() async {
//     if (await deviceConnectivity.isConnected == false) {
//       return const Left(DeviceConnectivityFailure());
//     }
//     try {
//       AllTripStepsModel? allTripStepsModel =
//           localDataSource.getCachedAllTripStepsModel();
//       allTripStepsModel ??= AllTripStepsModel(
//           userId: AppConstants.user.userId,
//           tripId: AppConstants.trip.tripNumber,
//           jobsiteId: AppConstants.trip.jobsiteNumber);
//
//       String result = await remoteDataSource.checkTripStatus(
//           allTripStepsModel: allTripStepsModel);
//       localDataSource.clearCollection();
//       return Right(result);
//     } on ServerException catch (e) {
//       return Left(ServerFailure(e.message));
//     }
//   }
//
//   @override
//   Future<Either<Failure, bool>> getStepTwoStartRequestRespond(
//       {AllTripStepsModel? allTripStepsModel}) async {
//     if (AppConstants.trip.jobsiteHasNetworkCoverage &&
//         await deviceConnectivity.isConnected == false) {
//       return const Left(DeviceConnectivityFailure());
//     }
//
//     try {
//       AllTripStepsModel? allTripStepsModel =
//           localDataSource.getCachedAllTripStepsModel();
//       allTripStepsModel ??= AllTripStepsModel(
//           userId: AppConstants.user.userId,
//           tripId: AppConstants.trip.tripNumber,
//           jobsiteId: AppConstants.trip.jobsiteNumber);
//
//       //لو مفيش تغطية للانترنت في الرحلة
//       //لو الrequest متبعتش و خزناه لوكال في case ال inbetween
//       //لو عمل استكمال للرحلة و كانت الtripStatus ب Responsed يعني اتعمل approve قبل كدا
//       if (!AppConstants.trip.jobsiteHasNetworkCoverage ||
//           allTripStepsModel.take5StepTwoRequestAPIModel != null ||
//           AppConstants.trip.tripStatus == "StepTwoResponsed") {
//         return const Right(true);
//       }
//
//       bool result = await remoteDataSource.getStepTwoStartRequestRespond(
//           allTripStepsModel: allTripStepsModel);
//       return Right(result);
//     } on ServerException catch (e) {
//       return Left(ServerFailure(e.message));
//     }
//   }
//
//   @override
//   Future<Either<Failure, String>> startStepTwoOffline(
//       {required Take5StepTwoRequestAPIModel
//           take5StepTwoRequestAPIModel}) async {
//     Take5StepTwoRequestAPIModel? startStepTwoRequest;
//     AllTripStepsModel allTripStepsModel;
//     if (localDataSource.getCachedAllTripStepsModel() == null) {
//       allTripStepsModel = AllTripStepsModel(
//           userId: AppConstants.user.userId,
//           tripId: AppConstants.trip.tripNumber,
//           jobsiteId: AppConstants.trip.jobsiteNumber);
//     } else {
//       allTripStepsModel = localDataSource.getCachedAllTripStepsModel()!;
//       startStepTwoRequest = allTripStepsModel.take5StepTwoRequestAPIModel;
//     }
//     startStepTwoRequest != null
//         ? startStepTwoRequest.copyWith(
//             responseDate: take5StepTwoRequestAPIModel.responseDate)
//         : startStepTwoRequest = take5StepTwoRequestAPIModel;
//
//     allTripStepsModel = allTripStepsModel.copyWith(
//         take5StepTwoRequestAPIModel: startStepTwoRequest);
//     localDataSource.cacheAllTripStepsModel(allTripStepsModel);
//     return const Right('تم الحفظ');
//   }
// }
