abstract class Failure {
  final String message;

  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

class StorageFailure extends Failure {
  const StorageFailure(String message) : super(message);
}

class DeviceConnectivityFailure extends Failure {
  const DeviceConnectivityFailure({final String message = 'تأكد من اتصالك بالانترنت'})
      : super(message);
}
class NetworkAvailabilityFailure extends Failure {
  const NetworkAvailabilityFailure({final String message = 'لا يوجد تغطية بالانترنت'})
      : super(message);
}

