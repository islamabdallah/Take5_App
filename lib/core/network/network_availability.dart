import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkAvailability {
  Future<bool> get isAvailable;
}

class NetworkAvailabilityImpl implements NetworkAvailability {
  final InternetConnectionChecker connectionChecker;

  NetworkAvailabilityImpl(this.connectionChecker);
  @override
  Future<bool> get isAvailable => connectionChecker.hasConnection;
}
