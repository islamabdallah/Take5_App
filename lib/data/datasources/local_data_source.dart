import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:take5/core/constants/app_constants.dart';
import 'package:take5/data/datasources/boxes.dart';
import 'package:take5/data/models/big_model/bid_model.dart';
import '../../core/constants/keys.dart';
import '../../core/utils/services/local_storage_service.dart';
import '../models/requests/destination_arrived_request/destination_arrived_request.dart';
import '../models/requests/step_one_complete_request/step_one_complete_request.dart';
import '../models/requests/step_two_complete_request/step_two_complete_request.dart';
import '../models/requests/step_two_start_request/step_two_start_request.dart';
import '../models/requests/trip_start_request/trip_start_request.dart';
import '../models/responses/trip_start_response/trip_start_response.dart';
import '../models/responses/user_login_response/user_login_response.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import '../models/trip/trip.dart';
import '../models/user/user.dart';

abstract class LocalDataSource {
  // responses
  Future<void> cacheUser(User user);
  User? getCachedUser();
  void clearCachedUser();

  Future<void> cacheTrip(Trip trip);
  Trip? getCachedTrip();

  Future<void> cacheTakeFiveSurvey(TakeFiveSurvey takeFiveSurvey);
  TakeFiveSurvey? getCachedTakeFiveSurvey();


  void cacheCollection(CollectionModel bigModel);
  CollectionModel? getCachedCollection();
  void clearCollection();
}

class LocalDataSourceImpl implements LocalDataSource {
  //final LocalStorageService localStorageService;
  //LocalDataSourceImpl({required this.localStorageService});
  @override
  Future<void> cacheUser(User user) async {
    final box = Boxes.getUser();
    box.put(userKey, user);
    // box.add(user);
    // print(box.getAt(0));
    //print('***');
  }

  @override
  User? getCachedUser() {
    final box = Boxes.getUser();
    print(box.get(userKey));
    return box.get(userKey);
  }


  @override
  void clearCachedUser(){
    final box = Boxes.getUser();
    box.clear();
  }

  @override
  Future<void> cacheTakeFiveSurvey(TakeFiveSurvey takeFiveSurvey) async {
    final box = Boxes.getTakeFiveBox();
    box.put(takeFiveSurveyKey, takeFiveSurvey.toJson());
    print(TakeFiveSurvey.fromJson(box.get(takeFiveSurveyKey)));
  }

  @override
  TakeFiveSurvey? getCachedTakeFiveSurvey() {
    final box = Boxes.getTakeFiveBox();
    if (box.get(takeFiveSurveyKey) == null) {
      return null;
    } else {
      Map<String, dynamic> json =
          Map<String, dynamic>.from(box.get(takeFiveSurveyKey));
      return TakeFiveSurvey.fromJson(json);
    }
  }

  @override
  Future<void> cacheTrip(Trip trip) async {
    final box = Boxes.getTakeFiveBox();
    box.put(tripKey, trip.toJson());
    print(box.get(tripKey));
  }

  @override
  Trip? getCachedTrip() {
    final box = Boxes.getTakeFiveBox();
    if (box.get(tripKey) == null) {
      return null;
    } else {
      Map<String, dynamic> json = Map<String, dynamic>.from(box.get(tripKey));
      return Trip.fromJson(json);
    }
  }

  @override
  void cacheCollection(CollectionModel bigModel) {
    final box = Boxes.getTakeFiveBox();
    box.put(collectionKey, bigModel.toJson());
    print(box.get(collectionKey));
  }

  @override
  CollectionModel? getCachedCollection() {
    final box = Boxes.getTakeFiveBox();
    if (box.get(collectionKey) == null) {
      return null;
    } else {
      Map<String, dynamic> json =
          Map<String, dynamic>.from(box.get(collectionKey));
      return CollectionModel.fromJson(json);
    }
  }

  @override
  void clearCollection() {
    final box = Boxes.getTakeFiveBox();
    box.delete(collectionKey);
  }
}
