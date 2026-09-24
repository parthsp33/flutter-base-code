import 'package:base_project/config/env.dart';
import 'package:base_project/data/storage/storage.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'api_constants.dart';
import 'custom_log_interceptor.dart';

/// Low level HTTP client. Repos should not use this directly,
/// they should use [ApiCaller.execute] so errors are handled in one place.
class ApiService {
  late final Dio _dio;

  ApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: HostMode.env.baseUrl,
        connectTimeout: ApiConstants.timeout,
        sendTimeout: ApiConstants.timeout,
        receiveTimeout: ApiConstants.timeout,
        receiveDataWhenStatusError: true,
        headers: {'Accept': 'application/json'},
      ),
    );
    _dio.interceptors.add(_authInterceptor);
    _dio.interceptors.add(CustomLogInterceptor(requestBody: true, responseBody: true));
  }

  StorageService get _storage => GetIt.I<StorageService>();

  /// Adds the saved token to every request and saves a new token
  /// if the server sends one back in the response header.
  InterceptorsWrapper get _authInterceptor => InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = _storage.authToken;
          if (token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
        onResponse: (response, handler) {
          final newToken = response.headers.value('x-authorization-token');
          if (newToken != null && newToken.isNotEmpty) {
            _storage.authToken = newToken;
          }
          handler.next(response);
        },
      );

  Future<Response> get({required String url, Map<String, dynamic>? queryParams}) {
    return _dio.get(url, queryParameters: queryParams);
  }

  /// Sends JSON by default. Pass FormData as data to send multipart form data.
  Future<Response> post({required String url, dynamic data, Map<String, dynamic>? queryParams}) {
    return _dio.post(url, data: data, queryParameters: queryParams);
  }

  /// Use this to upload files. data must be FormData with MultipartFile.
  Future<Response> multiPart({required String url, required FormData data, Map<String, dynamic>? queryParams}) {
    return _dio.post(
      url,
      data: data,
      queryParameters: queryParams,
      options: Options(contentType: Headers.multipartFormDataContentType),
    );
  }

  Future<Response> put({required String url, dynamic data, Map<String, dynamic>? queryParams}) {
    return _dio.put(url, data: data, queryParameters: queryParams);
  }

  Future<Response> patch({required String url, dynamic data, Map<String, dynamic>? queryParams}) {
    return _dio.patch(url, data: data, queryParameters: queryParams);
  }

  Future<Response> delete({required String url, dynamic data, Map<String, dynamic>? queryParams}) {
    return _dio.delete(url, data: data, queryParameters: queryParams);
  }

  void addHeader(String key, String value) => _dio.options.headers[key] = value;
}
