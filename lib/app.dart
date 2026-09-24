import 'package:base_project/resources/theme/theme.dart';
import 'package:base_project/util/core_export.dart';
import 'package:flutter/cupertino.dart' show DefaultCupertinoLocalizations;
import 'package:localization/localization.dart';

final RouteObserver<ModalRoute<void>> routeObserver = RouteObserver<ModalRoute<void>>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  String get _initialRoute {
    final storage = GetIt.I<StorageService>();
    return storage.isLoggedIn ? Routes.homeScreen : Routes.signInScreen;
  }

  @override
  Widget build(BuildContext context) {
    final navigation = GetIt.I<NavigationService>();

    return ScreenUtilInit(
      // Size of the design in Figma.
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          onGenerateTitle: (_) => Strings.appName(),
          debugShowCheckedModeBanner: !HostMode.isLive,
          theme: AppTheme().appTheme,
          navigatorKey: navigation.navigatorKey,
          scaffoldMessengerKey: navigation.scaffoldMessengerKey,
          navigatorObservers: [navigation, routeObserver],
          onGenerateRoute: onGenerateRoute,
          initialRoute: _initialRoute,
          locale: Locale(GetIt.I<StorageService>().language.name),
          supportedLocales: const [Locale('en')],
          localizationsDelegates: [
            DefaultMaterialLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
            LocalJsonLocalization.delegate,
          ],
          builder: (context, child) {
            // Keep text size same even if user changes phone font size.
            return MediaQuery.withNoTextScaling(child: child!);
          },
        );
      },
    );
  }
}
