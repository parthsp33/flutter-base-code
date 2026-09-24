import 'package:base_project/presentation/base/base_widget.dart';
import 'package:flutter/cupertino.dart';

import '../../../util/core_export.dart';

/// Main filled button. Use [isDisabledCondition] to enable or disable it
/// from text field values, and [isShowLoading] to show a small loader.
class CustomButton extends BaseWidget {
  final String text;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final Color? bgColor;
  final bool isShowLoading;
  final bool isDisabled;
  final bool Function()? isDisabledCondition;

  CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.width,
    this.height,
    this.textStyle,
    this.bgColor,
    this.isShowLoading = false,
    this.isDisabled = false,
    this.isDisabledCondition,
  });

  @override
  Widget build(BuildContext context) {
    final bool disabled = isDisabled || (isDisabledCondition?.call() ?? false);

    return GestureDetector(
      onTap: disabled || isShowLoading ? null : onTap,
      child: Container(
        height: height ?? 51.h,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: disabled ? ColorName.neutral95 : (bgColor ?? ColorName.primary50),
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: textStyle ?? dmSans500(size: 16, color: disabled ? ColorName.neutral50 : ColorName.white),
            ),
            if (isShowLoading) ...[
              12.w.horizontalSpace,
              CupertinoActivityIndicator(color: ColorName.white, radius: 10.w),
            ],
          ],
        ),
      ),
    );
  }
}

/// Outlined button with optional leading icon.
class CustomOutlineButton extends BaseWidget {
  final String text;
  final VoidCallback onTap;
  final Widget? icon;
  final double? height;
  final double width;

  CustomOutlineButton({
    super.key,
    required this.text,
    required this.onTap,
    this.icon,
    this.height,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 51.h,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: ColorName.neutral50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.r)),
          backgroundColor: ColorName.white,
        ),
        onPressed: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[icon!, 8.w.horizontalSpace],
            Text(text, style: dmSans600(color: ColorName.neutral20)),
          ],
        ),
      ),
    );
  }
}
