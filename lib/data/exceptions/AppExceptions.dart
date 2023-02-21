class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  String toString() {
    return "$_prefix $_message";
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message]) : super(message, "Error During Communication: ");
}
class BadRequestException extends AppExceptions {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}
class UnauthorisedException extends AppExceptions {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}
class NoInternetException extends AppExceptions {
  NoInternetException([message]) : super(message, "No Internet: ");
}
class RequestTimeoutException extends AppExceptions {
  RequestTimeoutException([message]) : super(message, "Request Timeout: ");
}