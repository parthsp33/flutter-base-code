import 'package:base_project/gen/colors.gen.dart';
import 'package:base_project/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

mixin class TextStyles {
  TextStyle _style({
    required double size,
    required Color color,
    required FontWeight fontWeight,
    double? height,
    TextDecoration textDecoration = TextDecoration.none,
  }) {
    return TextStyle(
      fontSize: size.sp,
      color: color,
      height: height,
      fontWeight: fontWeight,
      fontFamily: FontFamily.dMSans,
      decoration: textDecoration,
    );
  }

  TextStyle dmSans400({
    double size = 14,
    Color color = ColorName.neutral60,
    double? height,
    FontWeight fontWeight = FontWeight.w400,
    TextDecoration textDecoration = TextDecoration.none,
  }) =>
      _style(size: size, color: color, height: height, fontWeight: fontWeight, textDecoration: textDecoration);

  TextStyle dmSans500({
    double size = 14,
    Color color = ColorName.neutral20,
    double? height,
    FontWeight fontWeight = FontWeight.w500,
    TextDecoration textDecoration = TextDecoration.none,
  }) =>
      _style(size: size, color: color, height: height, fontWeight: fontWeight, textDecoration: textDecoration);

  TextStyle dmSans600({
    double size = 14,
    Color color = ColorName.primary50,
    double? height,
    FontWeight fontWeight = FontWeight.w600,
    TextDecoration textDecoration = TextDecoration.none,
  }) =>
      _style(size: size, color: color, height: height, fontWeight: fontWeight, textDecoration: textDecoration);

  TextStyle dmSans700({
    double size = 18,
    Color color = ColorName.neutral20,
    double? height,
    FontWeight fontWeight = FontWeight.w700,
    TextDecoration textDecoration = TextDecoration.none,
  }) =>
      _style(size: size, color: color, height: height, fontWeight: fontWeight, textDecoration: textDecoration);

  TextStyle dmSans900({
    double size = 28,
    Color color = ColorName.neutral20,
    double? height,
    FontWeight fontWeight = FontWeight.w900,
    TextDecoration textDecoration = TextDecoration.none,
  }) =>
      _style(size: size, color: color, height: height, fontWeight: fontWeight, textDecoration: textDecoration);
}
