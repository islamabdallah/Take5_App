class AppEndpoints {
  // add a private constructor to prevent this class being instantiated
  // e.g. invoke `LocalStorageKey()` accidentally
  AppEndpoints._();
  // the properties are static so that we can use them without a class instance
  // e.g. can be retrieved by `LocalStorageKey.saveUserId`.
  static const String baseUrl = 'http://20.86.97.165/take5/api';
  static const String userLogin = '$baseUrl/LoginAPI/userLogin';
  static const String currentTrip = '$baseUrl/LoginAPI/GetCurrentTripForDriver';

}
