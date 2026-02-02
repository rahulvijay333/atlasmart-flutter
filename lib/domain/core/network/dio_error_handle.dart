import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

import '../error/api_error.dart';

class DioErrorHandler {
  static AppException handle(DioException e) {
    if (e.error is SocketException) {
      return AppException("No internet connection");
    }

    if (e.error is TimeoutException) {
      return AppException("Request timed out.Please try again.");
    }
    final status = e.response?.statusCode;
    final msg = e.response?.data['Msg'] ?? e.response?.statusMessage;

    if (status == 401) {
      return AppException(msg ?? "Unauthorized request");
    }

    if (status == 404) {
      return AppException(msg ?? "Resource not found");
    }

    if (status == 500) {
      return AppException(msg ?? "Server error, try again later");
    }

    return AppException(msg ?? "Network error, please try again");
  }
}
