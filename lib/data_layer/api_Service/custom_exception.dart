class CustomException implements Exception {
  final dynamic _message;


  CustomException([this._message]);

  @override
  String toString() {
    return "$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String? message])
      : super(message);
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message);
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message]) : super(message);
}

class InvalidInputException extends CustomException {
  InvalidInputException([String? message]) : super(message);
}