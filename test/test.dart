import 'package:flutter_test/flutter_test.dart';
import 'package:take5/data/datasources/local_data_source.dart';
import 'package:take5/data/datasources/remote_data_source.dart';
import 'package:take5/data/models/driver/driver.dart';
import 'package:take5/data/models/requests/trip_start_request/trip_start_request.dart';
import 'package:take5/data/models/responses/trip_pending_response/user_trip_response.dart';
import 'package:take5/data/models/responses/trip_start_response/trip_start_response.dart';
import 'package:take5/injection_container.dart';
import 'package:take5/injection_container.dart' as di;
import 'package:take5/injection_container.dart';

Future<void> main() async {
  await di.init();
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });
  // test(
  //   'test login API',//name
  //       () async {
  //     //arrange
  //     RemoteDataSource remoteDataSource = sl<RemoteDataSource>();
  //     //act
  //     final result = await remoteDataSource.loginUser(mobileNo: 'asmaa', password: '1234');
  //     //assert
  //     print(result);
  //   },
  // );
  // test(
  //   'test startTrip API',//name
  //       () async {
  //     //arrange
  //     RemoteDataSource remoteDataSource = sl<RemoteDataSource>();
  //     //act
  //     TripStartResponse result = await remoteDataSource.startTrip(tripStartRequest: TripStartRequest(userId: '123456', tripId:1, jobsiteId: 1, startingDate: DateTime.now()));
  //     var takeFiveSurvey = result.data;
  //     //assert
  //     print(result);
  //     print(TakeFiveSurvey.fromJson(takeFiveSurvey.toJson()));
  //   },
  // );
  test(
    'test cacheDrivers',//name
        () async {
      //arrange
      LocalDataSource  localDataSource = sl<LocalDataSource>();
      //act
     localDataSource.cacheDrivers([Driver(id:1,fullName: "asmaa"),Driver(id:2,fullName: "ahmed")]);

    },
  );
  // test(
  //   'test getPendingTrip API',//name
  //       () async {
  //     //arrange
  //     RemoteDataSource remoteDataSource = sl<RemoteDataSource>();
  //     //act
  //     final result = await remoteDataSource.getPendingTrip(userId: '123');
  //     //assert
  //     print(result);
  //   },
  // );
  // test(
  //   'test startTrip repository API',//name
  //       () async {
  //     //arrange
  //         Take5Repository take5repository=sl<Take5Repository>();
  //     //act
  //     final result = await take5repository.startTrip(tripStartRequest: TripStartRequest(userId: '123', tripId: 1, jobsiteId: 1, startingDate: DateTime.now()));
  //     //assert
  //     print(result);
  //   },
  // );
  // test(
  //   'test getPendingTrip repository API',//name
  //       () async {
  //     //arrange
  //     Take5Repository take5repository=sl<Take5Repository>();
  //     //act
  //     final result = await take5repository.getPendingTrip(userId: '123');
  //     //assert
  //     print(result);
  //   },
  // );
  // test(
  //   'test arrivedToDestination repository API',//name
  //       () async {
  //     //arrange
  //     Take5Repository take5repository=sl<Take5Repository>();
  //     //act
  //     final result = await take5repository.arrivedToDestination(destinationArrivedRequest: DestinationArrivedRequest(userId: '123', tripId:1, jobsiteId: 1, destinationArrivedDate: DateTime.now()));
  //     //assert
  //     print(result);
  //   },
  // );
  // test(
  //   'test cachedUser Hive local data source API',//name
  //       () async {
  //     //arrange
  //     LocalDataSource localDataSource=sl<LocalDataSource>();
  //     //act
  //     await localDataSource.cacheUser(User());
  //     //assert
  //
  //   },
  // );
}
