// file: api_error_handler.dart

import 'dart:io';
import 'package:dio/dio.dart';

import 'api_expection.dart';

class ApiErrorHandler {
  /// Extract error message robustly from any API response data
  static String extractErrorMessage(dynamic data) {
    if (data == null) return 'Unknown error occurred';

    if (data is Map<String, dynamic>) {
      // Handle typical Laravel/Node.js validation errors
      if (data.containsKey('errors') && data['errors'] is Map) {
        final errorsMap = data['errors'] as Map<String, dynamic>;
        if (errorsMap.isNotEmpty) {
          final firstKey = errorsMap.keys.first;
          final firstError = errorsMap[firstKey];
          if (firstError is List && firstError.isNotEmpty) {
            return firstError.first.toString();
          }
          return firstError.toString();
        }
      }

      // Handle direct string 'errors' array
      if (data.containsKey('errors') && data['errors'] is List) {
        final errorsList = data['errors'] as List;
        if (errorsList.isNotEmpty) return errorsList.first.toString();
      }

      // Handle standard 'message' key
      if (data.containsKey('message') && data['message'] != null) {
        return data['message'].toString();
      }

      // Handle standard 'error' key
      if (data.containsKey('error') && data['error'] != null) {
        return data['error'].toString();
      }
    }

    if (data is String && data.isNotEmpty) {
      return data;
    }

    return 'Something went wrong';
  }

  /// Convert DioException to Custom Exception
  static ApiException handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return TimeoutException();

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode ?? 0;
        final message = extractErrorMessage(error.response?.data);

        if (statusCode == 401) return UnauthorizedException(message);
        if (statusCode == 404) return NotFoundException(message);
        if (statusCode >= 400 && statusCode < 500) return ValidationException(message, statusCode);
        if (statusCode >= 500) return ServerException();

        return ApiException(message, statusCode);

      case DioExceptionType.connectionError:
        if (error.error is SocketException) {
          return NetworkException();
        }
        return NetworkException('Connection error occurred');

      case DioExceptionType.cancel:
        return ApiException('Request was cancelled');

      default:
        return ApiException('An unexpected error occurred');
    }
  }
}