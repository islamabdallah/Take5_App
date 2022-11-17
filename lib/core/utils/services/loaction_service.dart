import 'dart:async';
import 'dart:ui';

import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<void> checkPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
  }

  Future<Position> getCurrentLocation() async {
    await checkPermission();
    return await Geolocator.getCurrentPosition();
  }

  double getDistance(Position currentLocation, Position destinationLocation) {
    return Geolocator.distanceBetween(
        currentLocation.latitude,
        currentLocation.longitude,
        destinationLocation.latitude,
        destinationLocation.longitude);
  }

  StreamSubscription<Position> subscribeEvent(
      Function(Position p)? event, int distance) {
    LocationSettings locationSettings = LocationSettings(
      distanceFilter: distance,
    );
    StreamSubscription<Position> positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position position) {
      if (event != null) {
        event.call(position);
      }
    });
    return positionStream;
  }
}
