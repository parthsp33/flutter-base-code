import 'package:base_project/data/api/api_constants.dart';

/// App environment. Select it at build time:
///   flutter run --dart-define=ENV=local
///   flutter run --dart-define=ENV=stage   (default)
///   flutter build apk --dart-define=ENV=live
enum HostMode {
  local,
  stage,
  live;

  static final HostMode env = HostMode.values.firstWhere(
    (e) => e.name == const String.fromEnvironment('ENV', defaultValue: 'stage'),
    orElse: () => HostMode.stage,
  );

  static bool get isLive => env == HostMode.live;

  String get baseUrl {
    switch (this) {
      case HostMode.local:
        return ApiConstants.localBaseUrl;
      case HostMode.stage:
        return ApiConstants.stageBaseUrl;
      case HostMode.live:
        return ApiConstants.liveBaseUrl;
    }
  }
}
