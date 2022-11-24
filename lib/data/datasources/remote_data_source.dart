import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:take5/data/models/requests/trip_start_request/trip_start_request.dart';
import 'package:take5/data/models/responses/trip_pending_response/user_trip_response.dart';
import 'package:take5/data/models/responses/trip_start_response/trip_start_response.dart';
import '../../core/constants/app_endpoints.dart';
import '../../core/utils/services/dio_client.dart';
import '../models/all_trip_steps/all_trip_steps.dart';
import '../models/responses/user_login_response/user_login_response.dart';

abstract class RemoteDataSource {
  Future<UserLoginResponse> loginUser(
      {required String serialNo, required String password});

  Future<UserTripResponse> getUserTrip(
      {required String userId});

  Future<TripStartResponse> startTrip(
      {required TripStartRequest tripStartRequest});

  Future<String> sendCollection(
      {required AllTripStepsModel allTripStepsModel});

  Future<String> checkTripStatus(
      {AllTripStepsModel? allTripStepsModel});

  Future<bool> getStepTwoStartRequestRespond(
      {required String userId});

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
    required String serialNo,
    required String password,
  }) async {

    // String response =
    //     await rootBundle.loadString('assets/endpoints/login_response.json');
    final response = await client.request(
        url: AppEndpoints.userLogin,
        method: HttpMethod.POST,
        data: {'driverNumber': serialNo, 'password': password,'rememberMe':true});
    print(response.data);
    return UserLoginResponse.fromJson(response.data);
  }

  @override
  Future<UserTripResponse> getUserTrip({required String userId}) async{
    // TODO: implement getPendingTrip
    // throw UnimplementedError();
    String response =
    await rootBundle.loadString('assets/endpoints/trip_response.json');
    return UserTripResponse.fromJson(jsonDecode(response));
  }

  @override
  Future<TripStartResponse> startTrip({required TripStartRequest tripStartRequest})async {
    // TODO: implement startTrip
    //throw UnimplementedError();
    String response =
    await rootBundle.loadString('assets/endpoints/trip_start_response.json');
    return TripStartResponse.fromJson(jsonDecode(response));
  }

  @override
  Future<String> sendCollection({required AllTripStepsModel allTripStepsModel}) async{
    // TODO: implement sendCollection
    // throw UnimplementedError();
    return "Done";
  }

  @override
  Future<String> checkTripStatus({AllTripStepsModel? allTripStepsModel}) async {

    return "Done";
  }

  @override
  Future<bool> getStepTwoStartRequestRespond({required String userId}) async{
    return true;
  }
}
