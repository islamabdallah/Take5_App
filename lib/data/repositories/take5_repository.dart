import 'package:dartz/dartz.dart';
import '../../core/constants/app_constants.dart';
import '../../core/errors/exceptions.dart';
import '../datasources/local_data_source.dart';
import '../models/all_trip_steps/all_trip_steps.dart';
import '../models/requests/destination_arrived_request/destination_arrived_request.dart';
import '../models/requests/step_one_complete_request/step_one_complete_request.dart';
import '../models/requests/step_two_complete_request/step_two_complete_request.dart';
import '../models/requests/step_two_start_request/step_two_start_request.dart';
import '../models/requests/trip_start_request/trip_start_request.dart';
import '../models/responses/trip_pending_response/user_trip_response.dart';
import '../models/responses/trip_start_response/trip_start_response.dart';
import '../models/responses/user_login_response/user_login_response.dart';
import '../../core/errors/failures.dart';
import '../datasources/remote_data_source.dart';
import '../../core/network/device_connectivity.dart';

abstract class Take5Repository {
  Future<Either<Failure, UserLoginResponse>> loginUser(
      {required String serialNo, required String password});

  Either<Failure, Unit> clearUser();

  Future<Either<Failure, UserTripResponse>> getPendingTrip(
      {required String userId});

  Future<Either<Failure, TripStartResponse>> startTrip(
      {required TripStartRequest tripStartRequest});

  Future<Either<Failure, Unit>> arrivedToDestination(
      {required DestinationArrivedRequest destinationArrivedRequest});

  Future<Either<Failure, Unit>> completeStepOne(
      {required StepOneCompleteRequest stepOneCompleteRequest});

  Future<Either<Failure, Unit>> startStepTwo(
      {required StepTwoStartRequest stepTwoStartRequest});

  Future<Either<Failure, bool>> getStepTwoStartRequestRespond(
      {required String userId});

  Future<Either<Failure, Unit>> completeStepTwo(
      {required StepTwoCompleteRequest stepTwoCompleteRequest});

  Future<Either<Failure, String>> checkTripStatus();

  Either<Failure, TakeFiveSurvey?> getCachedTakeFiveSurvey();

  Future<Either<Failure, Unit>> sendCollection();
}

class Take5RepositoryImpl extends Take5Repository {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;
  final DeviceConnectivity deviceConnectivity;

  Take5RepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.deviceConnectivity,
  });

  @override
  Future<Either<Failure, UserLoginResponse>> loginUser(
      {required String serialNo, required String password}) async {
    //check device connectivity
    if (await deviceConnectivity.isConnected == false) {
      return const Left(DeviceConnectivityFailure());
    }
    try {
      UserLoginResponse result = await remoteDataSource.loginUser(
          serialNo: serialNo, password: password);
      localDataSource.cacheUser(result.data);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Either<Failure, Unit> clearUser() {
    //todo ask Islam
    // sendCollection();
    try {
      localDataSource.clearCachedUser();
      return const Right(unit);
    } catch (e) {
      return const Left(StorageFailure("Error"));
    }
  }

  // already online
  @override
  Future<Either<Failure, UserTripResponse>> getPendingTrip(
      {required String userId}) async {
    try {
      UserTripResponse result =
          await remoteDataSource.getUserTrip(userId: userId);
      localDataSource.cacheTrip(result.data); //missed
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  // already online
  @override
  Future<Either<Failure, TripStartResponse>> startTrip(
      {required TripStartRequest tripStartRequest}) async {
    try {
      TripStartResponse result =
          await remoteDataSource.startTrip(tripStartRequest: tripStartRequest);
      localDataSource.cacheTakeFiveSurvey(result.data);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

//done
  @override
  Future<Either<Failure, Unit>> arrivedToDestination(
      {required DestinationArrivedRequest destinationArrivedRequest}) async {
    if (AppConstants.trip.jobsiteHasNetworkCoverage) {
      if (await deviceConnectivity.isConnected == false) {
        return const Left(DeviceConnectivityFailure());
      }
      AllTripStepsModel allTripStepsModel;
      if (localDataSource.getCachedAllTripStepsModel() == null) {
        allTripStepsModel = AllTripStepsModel(
            userId: AppConstants.user.userId,
            tripId: AppConstants.trip.tripNumber,
            jobsiteId: AppConstants.trip.jobsiteNumber);
      } else {
        allTripStepsModel = localDataSource.getCachedAllTripStepsModel()!;
      }
      allTripStepsModel = allTripStepsModel.copyWith(
          destinationArrivedRequest: destinationArrivedRequest);
      try {
        await remoteDataSource.sendCollection(allTripStepsModel: allTripStepsModel);
        //done
        localDataSource.clearCollection();
        return const Right(unit);
      } on ServerException catch (e) {
        //save local
        localDataSource.cacheAllTripStepsModel(allTripStepsModel);
        return const Right(unit);
      }
    } else {
      AllTripStepsModel collectionModel;
      if (localDataSource.getCachedAllTripStepsModel() == null) {
        collectionModel =AllTripStepsModel(
            userId: AppConstants.user.userId,
            tripId: AppConstants.trip.tripNumber,
            jobsiteId: AppConstants.trip.jobsiteNumber);
      } else {
        collectionModel = localDataSource.getCachedAllTripStepsModel()!;
      }
      collectionModel = collectionModel.copyWith(
          destinationArrivedRequest: destinationArrivedRequest);
      localDataSource.cacheAllTripStepsModel(collectionModel);
      return const Right(unit);
    }
  }

//done
  @override
  Future<Either<Failure, Unit>> completeStepOne(
      {required StepOneCompleteRequest stepOneCompleteRequest}) async {
    if (AppConstants.trip.jobsiteHasNetworkCoverage) {
      //check device connectivity
      if (await deviceConnectivity.isConnected == false) {
        return const Left(DeviceConnectivityFailure());
      }
      AllTripStepsModel allTripStepsModel;
      if (localDataSource.getCachedAllTripStepsModel() == null) {
        allTripStepsModel = AllTripStepsModel(
            userId: AppConstants.user.userId,
            tripId: AppConstants.trip.tripNumber,
            jobsiteId: AppConstants.trip.jobsiteNumber);
      } else {
        allTripStepsModel = localDataSource.getCachedAllTripStepsModel()!;
      }
      allTripStepsModel = allTripStepsModel.copyWith(
          stepOneCompleteRequest: stepOneCompleteRequest);
      try {
        await remoteDataSource.sendCollection(allTripStepsModel: allTripStepsModel);
        //done
        localDataSource.clearCollection();
        return const Right(unit);
      } on ServerException catch (e) {
        //save local
        localDataSource.cacheAllTripStepsModel(allTripStepsModel);
        return const Right(unit);
      }
    } else {
      AllTripStepsModel allTripStepsModel;
      if (localDataSource.getCachedAllTripStepsModel() == null) {
        allTripStepsModel = AllTripStepsModel(
            userId: AppConstants.user.userId,
            tripId: AppConstants.trip.tripNumber,
            jobsiteId: AppConstants.trip.jobsiteNumber);
      } else {
        allTripStepsModel = localDataSource.getCachedAllTripStepsModel()!;
      }
      allTripStepsModel = allTripStepsModel.copyWith(
          stepOneCompleteRequest: stepOneCompleteRequest);
      localDataSource.cacheAllTripStepsModel(allTripStepsModel);
      return const Right(unit);
    }
  }

//done
  @override
  Future<Either<Failure, Unit>> startStepTwo(
      {required StepTwoStartRequest stepTwoStartRequest}) async {
    if (AppConstants.trip.jobsiteHasNetworkCoverage) {
      //check device connectivity
      if (await deviceConnectivity.isConnected == false) {
        return const Left(DeviceConnectivityFailure());
      }
      AllTripStepsModel  allTripStepsModel;
      if (localDataSource.getCachedAllTripStepsModel() == null) {
        allTripStepsModel = AllTripStepsModel(
            userId: AppConstants.user.userId,
            tripId: AppConstants.trip.tripNumber,
            jobsiteId: AppConstants.trip.jobsiteNumber);
      } else {
        allTripStepsModel = localDataSource.getCachedAllTripStepsModel()!;
      }
      allTripStepsModel =
          allTripStepsModel.copyWith(stepTwoStartRequest: stepTwoStartRequest);
      try {
        await remoteDataSource.sendCollection(allTripStepsModel:  allTripStepsModel);
        //done
        localDataSource.clearCollection();
        return const Right(unit);
      } on ServerException catch (e) {
        //save local
        localDataSource.cacheAllTripStepsModel(allTripStepsModel);
        return const Right(unit);
      }
    } else {
      AllTripStepsModel allTripStepsModel;
      if (localDataSource.getCachedAllTripStepsModel() == null) {
        allTripStepsModel = AllTripStepsModel(
            userId: AppConstants.user.userId,
            tripId: AppConstants.trip.tripNumber,
            jobsiteId: AppConstants.trip.jobsiteNumber);
      } else {
        allTripStepsModel = localDataSource.getCachedAllTripStepsModel()!;
      }
      allTripStepsModel =
          allTripStepsModel.copyWith(stepTwoStartRequest: stepTwoStartRequest);
      localDataSource.cacheAllTripStepsModel(allTripStepsModel);
      return const Right(unit);
    }
  }

//done
  @override
  Future<Either<Failure, Unit>> completeStepTwo(
      {required StepTwoCompleteRequest stepTwoCompleteRequest}) async {
    if (AppConstants.trip.jobsiteHasNetworkCoverage) {
      //check device connectivity
      if (await deviceConnectivity.isConnected == false) {
        return const Left(DeviceConnectivityFailure());
      }
      AllTripStepsModel allTripStepsModel;
      if (localDataSource.getCachedAllTripStepsModel() == null) {
        allTripStepsModel = AllTripStepsModel(
            userId: AppConstants.user.userId,
            tripId: AppConstants.trip.tripNumber,
            jobsiteId: AppConstants.trip.jobsiteNumber);
      } else {
        allTripStepsModel = localDataSource.getCachedAllTripStepsModel()!;
      }
      allTripStepsModel = allTripStepsModel.copyWith(
          stepTwoCompleteRequest: stepTwoCompleteRequest);
      try {
        await remoteDataSource.sendCollection(allTripStepsModel: allTripStepsModel);
        //done
        localDataSource.clearCollection();
        return const Right(unit);
      } on ServerException catch (e) {
        //save local
        localDataSource.cacheAllTripStepsModel(allTripStepsModel);
        return const Right(unit);
      }
    } else {
      AllTripStepsModel allTripStepsModel;
      if (localDataSource.getCachedAllTripStepsModel()== null) {
        allTripStepsModel = AllTripStepsModel(
            userId: AppConstants.user.userId,
            tripId: AppConstants.trip.tripNumber,
            jobsiteId: AppConstants.trip.jobsiteNumber);
      } else {
        allTripStepsModel = localDataSource.getCachedAllTripStepsModel()!;
      }
      allTripStepsModel =allTripStepsModel.copyWith(
          stepTwoCompleteRequest: stepTwoCompleteRequest);
      localDataSource.cacheAllTripStepsModel(allTripStepsModel);
      return const Right(unit);
    }
  }

  @override
  Either<Failure, TakeFiveSurvey?> getCachedTakeFiveSurvey() {
    try {
      TakeFiveSurvey? result = localDataSource.getCachedTakeFiveSurvey();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> sendCollection() async {
    try {
      AllTripStepsModel? collectionModel = localDataSource.getCachedAllTripStepsModel();

      if (collectionModel != null) {
        await remoteDataSource.sendCollection(allTripStepsModel: collectionModel);
      }
      //done
      localDataSource.clearCollection();
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> checkTripStatus() async {
    try {
      AllTripStepsModel? allTripStepsModel= localDataSource.getCachedAllTripStepsModel();
      String result = await remoteDataSource.checkTripStatus(
          allTripStepsModel: allTripStepsModel);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> getStepTwoStartRequestRespond(
      {required String userId}) async {
    try {
      bool result =
          await remoteDataSource.getStepTwoStartRequestRespond(userId: userId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
