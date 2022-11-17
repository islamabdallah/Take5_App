class AppEndpoints {
  // add a private constructor to prevent this class being instantiated
  // e.g. invoke `LocalStorageKey()` accidentally
  AppEndpoints._();

  // the properties are static so that we can use them without a class instance
  // e.g. can be retrieved by `LocalStorageKey.saveUserId`.
  static const String baseUrl = 'http://20.86.97.165/Dictionary/api';
  static const String userLogin = '$baseUrl/User/Login';
  static const String allNews = '$baseUrl/News/GetAll';
  static const String allProducts = '$baseUrl/Product/GetAll';
  static const String statesAndJobs = '$baseUrl/MasterData/MasterData';
  static const String userRegister = '$baseUrl/User/Register';
  static const String userProfile = '$baseUrl/User/Profile';
  static const String homeData = '$baseUrl/Home/Data';
  static const String search = '$baseUrl/Question/Search';
  static const String myQuestions = '$baseUrl/Question/CustomerQuestions';
  static const String userToken = '$baseUrl/User/Token';
  static const String postQuestion = '$baseUrl/Question/PostQuestion';

  static const String youtubeApi = 'https://www.googleapis.com/youtube/v3/videos';

}
