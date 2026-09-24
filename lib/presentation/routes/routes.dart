import 'package:base_project/presentation/custom/widgets/network_issue_screen.dart';
import 'package:base_project/presentation/features/auth/sign_in/sign_in_screen.dart';
import 'package:base_project/presentation/features/home/home_screen.dart';
import 'package:flutter/cupertino.dart';

/// Route names. Add a new name here and a case in [onGenerateRoute].
class Routes {
  static const String signInScreen = 'signInScreen';
  static const String homeScreen = 'homeScreen';
  static const String networkIssueScreen = 'networkIssueScreen';
}

Route? onGenerateRoute(RouteSettings settings) {
  Widget? page;
  switch (settings.name) {
    case Routes.signInScreen:
      page = SignInScreen();
      break;
    case Routes.homeScreen:
      page = HomeScreen();
      break;
    case Routes.networkIssueScreen:
      page = NetworkIssueScreen();
      break;
    // Example with arguments:
    // case Routes.detailScreen:
    //   final args = settings.arguments as Map<String, dynamic>;
    //   page = DetailScreen(id: args['id'] as String);
    //   break;
  }

  if (page == null) return null;
  return CupertinoPageRoute(builder: (_) => page!, settings: settings);
}
