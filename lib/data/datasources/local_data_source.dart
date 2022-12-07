import 'package:take5/core/constants/app_constants.dart';
import 'package:take5/core/constants/app_strings.dart';
import 'package:take5/data/datasources/boxes.dart';
import 'package:take5/data/models/take5_together/take5_together.dart';
import '../../core/constants/keys.dart';
import '../models/all_trip_steps/all_trip_steps.dart';
import '../models/driver/driver.dart';
import '../models/responses/trip_pending_response/user_trip_response.dart';
import '../models/responses/trip_start_response/trip_start_response.dart';

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

  Future<void> cacheDrivers(List<Driver> drivers);
 List<Driver>? getCachedDrivers();
  Future<void> cacheTake5Together(List<Take5TogetherModel> notes);
  List<Take5TogetherModel>? getCachedTake5Together();

  String cacheAllTripStepsModel(AllTripStepsModel allTripStepsModel);
  AllTripStepsModel? getCachedAllTripStepsModel();
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
  Future<void> cacheDrivers(List<Driver>drivers ) async {
    final box = Boxes.getTakeFiveBox();
    List<Map<String,dynamic>>mappedDrivers=[];
    for(var driver in drivers)
      {
        mappedDrivers.add(driver.toJson());
      }
    box.put(driversKey, mappedDrivers);
    print(mappedDrivers);
  }

  @override
  List<Driver>? getCachedDrivers() {
    final box = Boxes.getTakeFiveBox();
    if (box.get(driversKey) == null) {
      return null;
    } else {
      List<Driver>drivers=[];
      for(var driver in box.get(driversKey))
      {
        Map<String, dynamic> json =Map<String, dynamic>.from(driver);
        drivers.add(Driver.fromJson(json));
      }
      return drivers;
    }
  }
  @override
  Future<void> cacheTake5Together(List<Take5TogetherModel> notes)async
  {
    final box = Boxes.getTakeFiveBox();
    List<Map<String,dynamic>>mappedNotes=[];
    for(var note in notes)
    {
      mappedNotes.add(note.toJson());
    }
    box.put(notesKey,mappedNotes);
    print(mappedNotes);
  }

  @override
  List<Take5TogetherModel>? getCachedTake5Together()
  {
    final box = Boxes.getTakeFiveBox();
    if (box.get(notesKey) == null) {
      return null;
    } else {
      List<Take5TogetherModel>notes=[];
      for(var note in box.get(notesKey))
      {
        Map<String, dynamic> json =Map<String, dynamic>.from(note);
        notes.add(Take5TogetherModel.fromJson(json));
      }
      return notes;
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
  String cacheAllTripStepsModel(AllTripStepsModel allTripStepsModel) {
    final box = Boxes.getTakeFiveBox();
    box.put(collectionKey, allTripStepsModel.toJson());
    print(box.get(collectionKey));
    return AppStrings.saveDone;
  }

  @override
  AllTripStepsModel? getCachedAllTripStepsModel() {
    final box = Boxes.getTakeFiveBox();
    if (box.get(collectionKey) == null) {
      return null;
    } else {
      Map<String, dynamic> json =
          Map<String, dynamic>.from(box.get(collectionKey));
      return AllTripStepsModel.fromJson(json);
    }
  }

  @override
  void clearCollection() {
    final box = Boxes.getTakeFiveBox();
    box.delete(collectionKey);
  }
}
