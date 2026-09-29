import 'package:base_project/gen/fonts.gen.dart';

import '../../util/core_export.dart';

class AppTheme with TextStyles {
  ThemeData get appTheme => ThemeData(
    useMaterial3: true,
    fontFamily: FontFamily.dMSans,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.primary50.color,
      primary: AppColor.primary50.color,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: AppColor.white.color,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.white.color,
      surfaceTintColor: AppColor.white.color,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: dmSans600(size: 18, color: AppColor.neutral20.color),
      iconTheme: IconThemeData(color: AppColor.neutral20.color),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColor.primary50.color,
    ),
    dividerTheme: DividerThemeData(color: AppColor.neutral95.color),
    tabBarTheme: TabBarThemeData(
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(width: 3.h, color: AppColor.primary50.color),
      ),
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: AppColor.primary50.color,
      dividerColor: AppColor.neutral95.color,
      unselectedLabelColor: AppColor.neutral20.color,
      labelStyle: dmSans500(fontWeight: FontWeight.w700),
      unselectedLabelStyle: dmSans500(),
    ),
  );
}
