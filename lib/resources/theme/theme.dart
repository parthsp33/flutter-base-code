import 'package:base_project/gen/fonts.gen.dart';

import '../../util/core_export.dart';

class AppTheme with TextStyles {
  ThemeData get appTheme => ThemeData(
        useMaterial3: true,
        fontFamily: FontFamily.dMSans,
        colorScheme: ColorScheme.fromSeed(
          seedColor: ColorName.primary50,
          primary: ColorName.primary50,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: ColorName.white,
        appBarTheme: AppBarTheme(
          backgroundColor: ColorName.white,
          surfaceTintColor: ColorName.white,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: dmSans600(size: 18, color: ColorName.neutral20),
          iconTheme: const IconThemeData(color: ColorName.neutral20),
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(color: ColorName.primary50),
        dividerTheme: const DividerThemeData(color: ColorName.neutral95),
        tabBarTheme: TabBarThemeData(
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 3.h, color: ColorName.primary50),
          ),
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: ColorName.primary50,
          dividerColor: ColorName.neutral95,
          unselectedLabelColor: ColorName.neutral20,
          labelStyle: dmSans500(fontWeight: FontWeight.w700),
          unselectedLabelStyle: dmSans500(),
        ),
      );
}
