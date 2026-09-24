import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Prints request and response logs in debug mode only.
/// Keep it as the last interceptor so it prints the final request.
class CustomLogInterceptor extends Interceptor {
  CustomLogInterceptor({
    this.requestHeader = true,
    this.requestBody = false,
    this.responseBody = false,
    this.error = true,
  });

  final bool requestHeader;
  final bool requestBody;
  final bool responseBody;
  final bool error;

  void _print(Object? object) {
    if (kDebugMode) debugPrint(object.toString());
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _print('*** Request *** ${options.method} ${options.uri}');
    if (requestHeader) {
      options.headers.forEach((key, v) => _print(' $key: $v'));
    }
    if (requestBody && options.data != null) {
      if (options.data is FormData) {
        for (final field in (options.data as FormData).fields) {
          _print(' ${field.key}: ${field.value}');
        }
      } else {
        _print(' data: ${options.data}');
      }
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _print('*** Response *** ${response.statusCode} ${response.requestOptions.uri}');
    if (responseBody && kDebugMode) log(response.toString());
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (error) {
      _print('*** DioException *** ${err.response?.statusCode} ${err.requestOptions.uri}');
      _print(' ${err.message}');
      if (err.response != null) _print(' ${err.response}');
    }
    handler.next(err);
  }
}
