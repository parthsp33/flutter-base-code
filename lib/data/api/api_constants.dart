/// All API end points. Add new end points here only.
class ApiConstants {
  // TODO: Replace with your project URLs.
  static const String localBaseUrl = 'http://localhost:8000/';
  static const String stageBaseUrl = 'https://stage.example.com/';
  static const String liveBaseUrl = 'https://api.example.com/';

  static const String api = 'api/';
  static const String version = 'v1/';
  static const String _prefix = '$api$version';

  static const Duration timeout = Duration(seconds: 60);

  // Auth
  static const String signIn = '${_prefix}login';
  static const String signUp = '${_prefix}register';
  static const String logout = '${_prefix}logout';
}
