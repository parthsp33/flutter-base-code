import 'dart:async';

import 'package:base_project/presentation/routes/routes.dart';
import 'package:base_project/presentation/service/navigation.dart';
import 'package:base_project/util/app_const.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';

/// Checks internet and opens the "No Network" screen when connection is lost.
/// Call startListening() once in main().
class ConnectivityService {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  Future<bool> isConnected() async {
    final result = await _connectivity.checkConnectivity();
    return _hasConnection(result);
  }

  void startListening() {
    _subscription ??= _connectivity.onConnectivityChanged.listen((result) async {
      final navigation = GetIt.I<NavigationService>();
      // Navigator is not ready yet (event came before the first frame).
      if (navigation.navigatorKey.currentState == null) return;
      final isOnNetworkScreen = AppConst.currentScreen == Routes.networkIssueScreen;
      if (_hasConnection(result)) {
        if (isOnNetworkScreen) navigation.pop();
      } else {
        // Small delay to skip quick network switch (wifi to mobile).
        await Future.delayed(const Duration(milliseconds: 500));
        if (!await isConnected() &&
            navigation.navigatorKey.currentState != null &&
            AppConst.currentScreen != Routes.networkIssueScreen) {
          navigation.push(Routes.networkIssueScreen);
        }
      }
    });
  }

  void dispose() => _subscription?.cancel();

  bool _hasConnection(List<ConnectivityResult> result) {
    return result.any((e) => e != ConnectivityResult.none);
  }
}
