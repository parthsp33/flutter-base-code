import 'package:flutter/material.dart';

enum AppColor {
  black(0xFF000000),
  errorBg(0xFFF3DCE2),
  errorText(0xFF9B0654),
  green(0xFF34C759),
  neutral10(0xFF17181C),
  neutral20(0xFF2E3138),
  neutral50(0xFF737A8C),
  neutral60(0xFF8F94A3),
  neutral80(0xFFC7CAD1),
  neutral95(0xFFEEEFF1),
  neutral99(0xFFF4F4F6),
  primary50(0xFFFF5500),
  primary95(0xFFFFEDD3),
  primary99(0xFFFFF7EC),
  red(0xFFFF3B30),
  secondary30(0xFF6B23A6),
  successBg(0xFFC2F3E4),
  successText(0xFF416764),
  white(0xFFFFFFFF);

  const AppColor(this.value);

  final int value;

  Color get color => Color(value);
}
