import 'package:base_project/util/app_const.dart';
import 'package:flutter/material.dart';

/// Navigate without context: `GetIt.I<NavigationService>().push(Routes.homeScreen)`
/// Add it to MaterialApp.navigatorObservers so currentScreen stays correct.
class NavigationService extends RouteObserver<PageRoute<dynamic>> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  NavigatorState get _navigator => navigatorKey.currentState!;

  Future<dynamic> push(String routeName, {Object? arguments}) {
    return _navigator.pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacement(String routeName, {Object? arguments}) {
    return _navigator.pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushAndRemoveUntil(String routeName, {Object? arguments}) {
    return _navigator.pushNamedAndRemoveUntil(routeName, (route) => false, arguments: arguments);
  }

  void popUntil(String routeName) {
    _navigator.popUntil((route) => route.settings.name == routeName);
  }

  void popToRoot() => _navigator.popUntil((route) => route.isFirst);

  void pop([Object? result]) => _navigator.pop(result);

  bool canPop() => _navigator.canPop();

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    AppConst.currentScreen = route.settings.name ?? '';
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    AppConst.currentScreen = previousRoute?.settings.name ?? '';
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    AppConst.currentScreen = newRoute?.settings.name ?? '';
  }
}
