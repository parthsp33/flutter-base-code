import 'package:base_project/data/model/base_response.dart';
import 'package:base_project/presentation/service/connectivity_service.dart';
import 'package:base_project/util/core_export.dart';
import 'package:base_project/util/typedef.dart';

/// Every repo extends this class and calls [execute].
/// It checks internet, calls the API and converts any error
/// into a [BaseResponse], so the cubit only needs to check `isSuccess`.
///
/// Example:
/// ```dart
/// Future<BaseResponse> signIn(Map<String, dynamic> body) =>
///     execute(() => apiService.post(url: ApiConstants.signIn, data: body));
/// ```
mixin class ApiCaller {
  ApiService get apiService => GetIt.I<ApiService>();
  StorageService get storage => GetIt.I<StorageService>();
  NavigationService get navigation => GetIt.I<NavigationService>();

  static const List<int> _handledStatusCodes = [400, 403, 404, 405, 406, 409, 412, 417, 422, 500];

  Future<BaseResponse> execute(
    Future<Response> Function() apiCall, {
    OnApiError? onApiError,
    OnStatusCode? statusCode,
  }) async {
    if (!await GetIt.I<ConnectivityService>().isConnected()) {
      return _fail(Strings.noInternetConnectionError(), onApiError);
    }
    try {
      final res = await apiCall();
      statusCode?.call(res.statusCode ?? 0);
      return BaseResponse.fromData(res.data);
    } on DioException catch (e) {
      final code = e.response?.statusCode;
      statusCode?.call(code ?? 0);

      // Session expired. Only when logged in, so a wrong password on login shows the server message.
      if (code == 401 && storage.isLoggedIn) {
        final res = BaseResponse.fromData(e.response?.data);
        await storage.logout();
        navigation.pushAndRemoveUntil(Routes.signInScreen);
        return _fail(_messageOrDefault(res), onApiError);
      }
      if (code != null && (code == 401 || _handledStatusCodes.contains(code))) {
        final res = BaseResponse.fromData(e.response?.data);
        final message = _messageOrDefault(res);
        onApiError?.call(message);
        return res.copyWith(success: false, message: message);
      }
      switch (e.type) {
        case DioExceptionType.connectionError:
          return _fail(Strings.noInternetConnectionError(), onApiError);
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return _fail(Strings.requestTimeout(), onApiError);
        default:
          return _fail(Strings.somethingWentWrong(), onApiError);
      }
    } catch (e) {
      debugPrint('ApiCaller error: $e');
      return _fail(Strings.somethingWentWrong(), onApiError);
    }
  }

  /// Server message, or a common message when the body has none (for example an HTML error page).
  String _messageOrDefault(BaseResponse res) {
    return res.displayMessage.isNotEmpty ? res.displayMessage : Strings.somethingWentWrong();
  }

  BaseResponse _fail(String message, OnApiError? onApiError) {
    onApiError?.call(message);
    return BaseResponse(success: false, message: message);
  }
}
