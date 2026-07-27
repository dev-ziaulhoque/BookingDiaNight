// file: api_exceptions.dart

class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException(this.message, [this.statusCode]);

  @override
  String toString() => message;
}

class NetworkException extends ApiException {
  NetworkException([super.message = 'No internet connection']);
}

class TimeoutException extends ApiException {
  TimeoutException([super.message = 'Connection timed out. Please try again.']);
}

class UnauthorizedException extends ApiException {
  UnauthorizedException([super.message = 'Unauthorized access. Please login again.']);
}

class ValidationException extends ApiException {
  ValidationException(super.message,[super.statusCode]);
}

class ServerException extends ApiException {
  ServerException([super.message = 'Internal server error occurred.']);
}

class NotFoundException extends ApiException {
  NotFoundException([super.message = 'Requested resource not found.']);
}