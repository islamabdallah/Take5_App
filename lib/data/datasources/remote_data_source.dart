import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:take5/core/constants/app_constants.dart';
import 'package:take5/data/models/requests/trip_start_request/trip_start_request.dart';
import 'package:take5/data/models/responses/trip_pending_response/user_trip_response.dart';
import 'package:take5/data/models/responses/trip_start_response/trip_start_response.dart';
import '../../core/constants/app_endpoints.dart';
import '../../core/utils/services/dio_client.dart';
import '../models/all_trip_steps/all_trip_steps.dart';
import '../models/responses/user_login_response/user_login_response.dart';

abstract class RemoteDataSource {
  Future<UserLoginResponse> loginUser(
      {required int driverNumber, required String password});

  Future<UserTripResponse> getCurrentTrip(
      {required String userId});

  Future<TripStartResponse> startTrip(
      {required TripStartRequest tripStartRequest});

  Future<String> sendCollection(
      {required AllTripStepsModel allTripStepsModel});

  Future<String> checkTripStatus(
      {AllTripStepsModel? allTripStepsModel});

  Future<bool> getStepTwoStartRequestRespond(
      {AllTripStepsModel? allTripStepsModel});

}

// class RemoteDataSourceImpl extends RemoteDataSource {
//   final DioClient client;
//   RemoteDataSourceImpl({required this.client});
//
//   @override
//   Future<UserLoginResponse> loginUser(
//       {required String mobileNo, required String password}) async {
//     final response = await client.request(
//         url: AppEndpoints.userLogin,
//         method: HttpMethod.POST,
//         data: {'mobileNo': mobileNo, 'password': password});
//     print(response.data);
//     return UserLoginResponse.fromJson(response.data);
//   }
// }

class  RemoteDataSourceImpl  extends RemoteDataSource {
  final DioClient client;
   RemoteDataSourceImpl({required this.client});
  @override
  Future<UserLoginResponse> loginUser({
    required int driverNumber,
    required String password,
  }) async {

    // String response =
    //     await rootBundle.loadString('assets/endpoints/login_response.json');
    final response = await client.request(
        url: AppEndpoints.userLogin,
        method: HttpMethod.POST,
        data: {'driverNumber': driverNumber, 'password': password,'rememberMe':true});
    print(response.data);
    return UserLoginResponse.fromJson(response.data);
  }

  @override
  Future<UserTripResponse> getCurrentTrip({required String userId}) async{
    final response = await client.request(
        url: AppEndpoints.currentTrip,
        method: HttpMethod.POST,
        queryParameters: {
          'userId':userId,
        },);
   // print(userId);
    print(response);
    return UserTripResponse.fromJson(response.data);
  }

  @override
  Future<TripStartResponse> startTrip({required TripStartRequest tripStartRequest})async {
    final response = await client.request(
      url: AppEndpoints.tripStarting,
      method: HttpMethod.POST,
      data: tripStartRequest
    );
    print(response.data);
    return TripStartResponse.fromJson(response.data);
  }

  @override
  Future<String> sendCollection({required AllTripStepsModel allTripStepsModel}) async{
    print(jsonEncode(allTripStepsModel.toJson()));
    final response = await client.request(
        url: AppConstants.trip.jobsiteHasNetworkCoverage? AppEndpoints.sendTripUpdate:AppEndpoints.sendOfflineTripAllSteps,
        method: HttpMethod.POST,
        data: allTripStepsModel
    );
    print(response.data);
    return response.data['data'];
  }

  @override
  Future<String> checkTripStatus({AllTripStepsModel? allTripStepsModel}) async {
    print(allTripStepsModel.toString());
    final response = await client.request(
        url: AppEndpoints.checkTripStatus,
        method: HttpMethod.POST,
        data: allTripStepsModel
    );
    print(response.data);
    return response.data['data'];
  }

  @override
  Future<bool> getStepTwoStartRequestRespond({AllTripStepsModel? allTripStepsModel}) async{
    final response = await client.request(
        url: AppEndpoints.isRequestApproved,
        method: HttpMethod.POST,
        data: allTripStepsModel
    );
    print(response.data);
    return response.data['data'];
  }
}
