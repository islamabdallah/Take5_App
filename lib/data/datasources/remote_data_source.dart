import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:take5/data/models/big_model/bid_model.dart';
import 'package:take5/data/models/requests/destination_arrived_request/destination_arrived_request.dart';
import 'package:take5/data/models/requests/step_one_complete_request/step_one_complete_request.dart';
import 'package:take5/data/models/requests/step_two_complete_request/step_two_complete_request.dart';
import 'package:take5/data/models/requests/step_two_start_request/step_two_start_request.dart';
import 'package:take5/data/models/requests/trip_start_request/trip_start_request.dart';
import 'package:take5/data/models/responses/trip_pending_response/user_trip_response.dart';
import 'package:take5/data/models/responses/trip_start_response/trip_start_response.dart';
import '../models/responses/user_login_response/user_login_response.dart';

abstract class RemoteDataSource {
  Future<UserLoginResponse> loginUser(
      {required String mobileNo, required String password});

  Future<UserTripResponse> getUserTrip(
      {required String userId});

  Future<TripStartResponse> startTrip(
      {required TripStartRequest tripStartRequest});

  Future<String> sendCollection(
      {required CollectionModel collectionModel});

  Future<String> checkTripStatus(
      {CollectionModel? collectionModel});

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

class FakeRemoteDataSourceImpl extends RemoteDataSource {
  @override
  Future<UserLoginResponse> loginUser({
    required String mobileNo,
    required String password,
  }) async {

    String response =
        await rootBundle.loadString('assets/endpoints/login_response.json');

    return UserLoginResponse.fromJson(jsonDecode(response));
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
  Future<String> sendCollection({required CollectionModel collectionModel}) async{
    // TODO: implement sendCollection
    // throw UnimplementedError();
    return "Done";
  }

  @override
  Future<String> checkTripStatus({CollectionModel? collectionModel}) async {

    return "Done";
  }
}
