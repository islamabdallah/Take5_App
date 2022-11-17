
// if you are using dio client, so you don't need to make exceptions, dio already made it for you
//see https://pub.dev/packages/dio#handling-errors

class ServerException implements Exception {
  final String message;
  ServerException(this.message);
}
