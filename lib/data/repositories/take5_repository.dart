import 'package:dartz/dartz.dart';
import 'package:take5/core/constants/app_strings.dart';
import '../../core/constants/app_constants.dart';
import '../../core/errors/exceptions.dart';
import '../datasources/local_data_source.dart';
import '../models/all_trip_steps/all_trip_steps.dart';
import '../models/driver/driver.dart';
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
import '../models/take5_together/take5_together.dart';

abstract class Take5Repository {
  Future<Either<Failure, UserLoginResponse>> loginUser(
      {required int driverNumber, required String password});

  Either<Failure, Unit> clearUser();

  Future<Either<Failure, UserTripResponse>> getCurrentTrip(
      {required String userId});

  Future<Either<Failure, String>> startTrip(
      {required TripStartRequest tripStartRequest});

  Future<Either<Failure, String>> arrivedToDestination(
      {required TripDestinationArrivedModel tripDestinationArrivedModel});

  Future<Either<Failure, String>> completeStepOne(
      {required SurveyStepOneAnswersAPIModel surveyStepOneAnswersAPIModel});

  Future<Either<Failure, String>> startStepTwo(
      {required Take5StepTwoRequestAPIModel take5StepTwoRequestAPIModel});

  Future<Either<Failure, String>> getStepTwoStartRequestRespond(
      {required Take5StepTwoRequestAPIModel take5StepTwoRequestAPIModel});

  Future<Either<Failure, String>> completeStepTwo(
      {required SurveyStepTwoAnswersAPIModel surveyStepTwoAnswersAPIModel});

  Future<Either<Failure, String>> take5Together(
      {required List<Take5TogetherModel> notes});

  Future<Either<Failure, String>> checkTripStatus();

  Either<Failure, TakeFiveSurvey?> getCachedTakeFiveSurvey();

  Either<Failure, List<Driver>?> getCachedDrivers();

  Future<Either<Failure, String>> endTrip();

  Future<Either<Failure, String>> sendCollection();
  Future<Either<Failure, bool>> sendToken({required String userId,required String userToken});
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
      {required int driverNumber, required String password}) async {
    //check device connectivity
    if (await deviceConnectivity.isConnected == false) {
      return const Left(DeviceConnectivityFailure());
    }
    try {
      UserLoginResponse result = await remoteDataSource.loginUser(
          driverNumber: driverNumber, password: password);
      localDataSource.cacheUser(result.data.userAPIModel);
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
  Future<Either<Failure, UserTripResponse>> getCurrentTrip(
      {required String userId}) async {
    try {
      UserTripResponse result =
      await remoteDataSource.getCurrentTrip(userId: userId);
      if (result.data != null) {
        localDataSource.cacheTrip(result.data!.tripAPIModel); //missed
        localDataSource.cacheTakeFiveSurvey(result.data!.allSurveyModel);
        localDataSource.cacheDrivers(result.data!.drivers);
      }
      // print(result.data.ALLSurveyModel);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  // already online
  @override
  Future<Either<Failure, String>> startTrip(
      {required TripStartRequest tripStartRequest}) async {
    try {
      String result =
      await remoteDataSource.startTrip(tripStartRequest: tripStartRequest);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  AllTripStepsModel _getStoredAllTripStepsModel() {
    return localDataSource.getCachedAllTripStepsModel() ??
        AllTripStepsModel(
            userId: AppConstants.user.userId,
            tripId: AppConstants.trip.tripNumber,
            truckNumber: AppConstants.trip.truckNumber,
            jobsiteId: AppConstants.trip.jobsiteNumber);
  }

  Future<String> _sendAllStepsModel(AllTripStepsModel allTripStepsModel) async {
    try {
      String result = await remoteDataSource.sendCollection(
          allTripStepsModel: allTripStepsModel);
      //done
      localDataSource.clearCollection();
      return result;
    } on ServerException catch (e) {
      //save local
      String result = localDataSource.cacheAllTripStepsModel(allTripStepsModel);
      return result;
    }
  }

  @override
  Future<Either<Failure, String>> arrivedToDestination(
      {required TripDestinationArrivedModel
      tripDestinationArrivedModel}) async {

    AllTripStepsModel allTripStepsModel = _getStoredAllTripStepsModel();

    allTripStepsModel = allTripStepsModel.copyWith(
        tripDestinationArrivedModel: tripDestinationArrivedModel,
        endStatus: 'DestinationArrived');

    if (!AppConstants.trip.jobsiteHasNetworkCoverage) {
      localDataSource.cacheAllTripStepsModel(allTripStepsModel);
      return const Right(AppStrings.saveDone);
    }

    if (await deviceConnectivity.isConnected == false) {
      return const Left(DeviceConnectivityFailure());
    }

    String result = await _sendAllStepsModel(allTripStepsModel);
    return Right(result);
  }

//done
  @override
  Future<Either<Failure, String>> completeStepOne(
      {required SurveyStepOneAnswersAPIModel
      surveyStepOneAnswersAPIModel}) async {

    AllTripStepsModel allTripStepsModel = _getStoredAllTripStepsModel();

    allTripStepsModel = allTripStepsModel.copyWith(
        surveyStepOneAnswersAPIModel: surveyStepOneAnswersAPIModel,
        endStatus: 'SurveyStepOneCompleted');

    if (!AppConstants.trip.jobsiteHasNetworkCoverage) {
      localDataSource.cacheAllTripStepsModel(allTripStepsModel);
      return const Right(AppStrings.saveDone);
    }

    if (await deviceConnectivity.isConnected == false) {
      return const Left(DeviceConnectivityFailure());
    }

    String result = await _sendAllStepsModel(allTripStepsModel);
    return Right(result);
  }

//done
  @override
  Future<Either<Failure, String>> startStepTwo(
      {required Take5StepTwoRequestAPIModel
      take5StepTwoRequestAPIModel}) async {

    AllTripStepsModel allTripStepsModel = _getStoredAllTripStepsModel();

    allTripStepsModel = allTripStepsModel.copyWith(
        take5StepTwoRequestAPIModel: take5StepTwoRequestAPIModel,
        endStatus: 'StepTwoRequested');

    if (!AppConstants.trip.jobsiteHasNetworkCoverage) {
      localDataSource.cacheAllTripStepsModel(allTripStepsModel);
      return const Right(AppStrings.saveDone);
    }

    if (await deviceConnectivity.isConnected == false) {
      return const Left(DeviceConnectivityFailure());
    }

    String result = await _sendAllStepsModel(allTripStepsModel);
    return Right(result);
  }

//done
  @override
  Future<Either<Failure, String>> completeStepTwo(

      {required SurveyStepTwoAnswersAPIModel
      surveyStepTwoAnswersAPIModel}) async {


    AllTripStepsModel allTripStepsModel = _getStoredAllTripStepsModel();

    allTripStepsModel = allTripStepsModel.copyWith(
        surveyStepTwoAnswersAPIModel: surveyStepTwoAnswersAPIModel,
        endStatus: 'SurveyStepTwoCompleted');

    if (!AppConstants.trip.jobsiteHasNetworkCoverage) {
      localDataSource.cacheAllTripStepsModel(allTripStepsModel);
      return const Right(AppStrings.saveDone);
    }

    if (await deviceConnectivity.isConnected == false) {
      return const Left(DeviceConnectivityFailure());
    }

    String result = await _sendAllStepsModel(allTripStepsModel);
    return Right(result);
  }

  @override
  Future<Either<Failure, String>> take5Together(
      {required List<Take5TogetherModel> notes}) async {
    AllTripStepsModel allTripStepsModel = _getStoredAllTripStepsModel();

    allTripStepsModel =
        allTripStepsModel.copyWith(take5TogetherAPIModels: notes);

    String result = localDataSource.cacheAllTripStepsModel(allTripStepsModel);
    return Right(result);
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
  Either<Failure, List<Driver>?> getCachedDrivers() {
    try {
      List<Driver>? result = localDataSource.getCachedDrivers();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> endTrip() async {
    if (await deviceConnectivity.isConnected == false) {
      return const Left(DeviceConnectivityFailure());
    }
    try {
      AllTripStepsModel allTripStepsModel = _getStoredAllTripStepsModel();
      allTripStepsModel =
          allTripStepsModel.copyWith(endStatus: 'TripCompleted');

      String result = await remoteDataSource.sendCollection(
          allTripStepsModel: allTripStepsModel);
      //done
      localDataSource.clearCollection();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> sendCollection() async {
    if (await deviceConnectivity.isConnected == false) {
      return const Left(DeviceConnectivityFailure());
    }

    // if(!AppConstants.trip.jobsiteHasNetworkCoverage && AppConstants.trip.tripStatus!="Pending"){
    //   return const Left(DeviceConnectivityFailure());
    // }
    try {
      AllTripStepsModel? collectionModel =
      localDataSource.getCachedAllTripStepsModel();
      if (collectionModel != null) {
        String result = await remoteDataSource.sendCollection(
            allTripStepsModel: collectionModel);
      }
      //done
      localDataSource.clearCollection();
      return  Right('???? ??????????????');
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> checkTripStatus() async {
    if (await deviceConnectivity.isConnected == false) {
      return const Left(DeviceConnectivityFailure());
    }
    try {
      String result;

      AllTripStepsModel? allTripStepsModel = localDataSource.getCachedAllTripStepsModel();
      if(allTripStepsModel==null || !AppConstants.trip.jobsiteHasNetworkCoverage){

        allTripStepsModel= AllTripStepsModel(
            userId: AppConstants.user.userId,
            tripId: AppConstants.trip.tripNumber,
            truckNumber: AppConstants.trip.truckNumber,
            jobsiteId: AppConstants.trip.jobsiteNumber);
      result = await remoteDataSource.checkTripStatus(
          allTripStepsModel: allTripStepsModel);
      } else{
        result = await remoteDataSource.sendCollection(
            allTripStepsModel: allTripStepsModel);
      }
      if(result=="Done"&& !AppConstants.trip.jobsiteHasNetworkCoverage){
        return Right(result);
      }else{
        localDataSource.clearCollection();
        return Right(result);
      }
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> getStepTwoStartRequestRespond(
      {required Take5StepTwoRequestAPIModel take5StepTwoRequestAPIModel}) async {

    try {
      AllTripStepsModel allTripStepsModel = _getStoredAllTripStepsModel();

      if(
      AppConstants.trip.tripStatus == "StepTwoResponsed") {
        return const Right("Approved");// Right(true)
      }
      //???? ???????? ?????????? ???????????????? ???? ????????????
      //???? ????request ???????????? ?? ?????????? ?????????? ???? case ???? inbetween
      //???? ?????? ?????????????? ???????????? ?? ???????? ????tripStatus ?? Responsed ???????? ?????????? approve ?????? ??????
      if (!AppConstants.trip.jobsiteHasNetworkCoverage ||
          allTripStepsModel.take5StepTwoRequestAPIModel?.requestDate != null)
        {
          String result = storeResponseDate(take5StepTwoRequestAPIModel: take5StepTwoRequestAPIModel);
          return Right(result);
        }


      if (await deviceConnectivity.isConnected == false) {
        return const Left(DeviceConnectivityFailure());
      }

      String result = await remoteDataSource.getStepTwoStartRequestRespond(
          allTripStepsModel: allTripStepsModel);
      return Right(result);
    } on ServerException catch (e) {
      String result = storeResponseDate(take5StepTwoRequestAPIModel: take5StepTwoRequestAPIModel);
      return Right(result);
    }
  }


 String storeResponseDate(
      {required Take5StepTwoRequestAPIModel
      take5StepTwoRequestAPIModel}) {
    Take5StepTwoRequestAPIModel? startStepTwoRequest;

    AllTripStepsModel allTripStepsModel = _getStoredAllTripStepsModel();
    startStepTwoRequest = allTripStepsModel.take5StepTwoRequestAPIModel;
    startStepTwoRequest != null
        ? startStepTwoRequest = startStepTwoRequest.copyWith(
        responseDate: take5StepTwoRequestAPIModel.responseDate)
        : startStepTwoRequest = take5StepTwoRequestAPIModel;

    allTripStepsModel = allTripStepsModel.copyWith(
        take5StepTwoRequestAPIModel: startStepTwoRequest);
    String result = localDataSource.cacheAllTripStepsModel(allTripStepsModel);
    return result;
  }


  @override
  Future<Either<Failure, bool>> sendToken({required String userId,required String userToken})
  async {
    try {
      bool result =await remoteDataSource.sendToken(userId: userId, userToken: userToken);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
