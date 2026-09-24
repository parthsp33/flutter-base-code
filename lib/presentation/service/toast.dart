import 'package:base_project/gen/colors.gen.dart';
import 'package:base_project/presentation/service/navigation.dart';
import 'package:base_project/util/app_const.dart';
import 'package:base_project/util/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

/// Shows snack bars without context. Uses the root ScaffoldMessenger.
class ToastService with TextStyles {
  ScaffoldMessengerState? get _messenger => GetIt.I<NavigationService>().scaffoldMessengerKey.currentState;

  void errorToast(String message) {
    _show(message, bgColor: ColorName.errorBg, textColor: ColorName.errorText);
  }

  void successToast(String message) {
    _show(message, bgColor: ColorName.successBg, textColor: ColorName.successText);
  }

  void actionToast(String message, {required String actionLabel, required VoidCallback onAction}) {
    _messenger
      ?..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(message),
          action: SnackBarAction(label: actionLabel, onPressed: onAction),
        ),
      );
  }

  void _show(String message, {required Color bgColor, required Color textColor}) {
    if (message.isEmpty) return;
    _messenger
      ?..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: bgColor,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.r)),
          content: Text(message, style: dmSans600(color: textColor)),
          duration: const Duration(milliseconds: AppConst.snackBarDuration),
        ),
      );
  }
}
