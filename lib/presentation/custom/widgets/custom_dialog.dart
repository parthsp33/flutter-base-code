import 'package:base_project/presentation/custom/widgets/custom_button.dart';

import '../../../util/core_export.dart';

class DialogUtils {
  /// Yes / No dialog. Returns true when user taps the positive button.
  static Future<bool> confirmDialog({
    required String title,
    required String message,
    String? positiveText,
    String? negativeText,
  }) async {
    final styles = TextStyles();
    final result = await showDialog<bool>(
      context: appContext,
      builder: (context) => AlertDialog(
        backgroundColor: ColorName.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
        title: Text(title, textAlign: TextAlign.center, style: styles.dmSans700()),
        content: Text(message, textAlign: TextAlign.center, style: styles.dmSans400()),
        actionsPadding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
        actions: [
          Row(
            children: [
              Expanded(
                child: CustomOutlineButton(
                  height: 44.h,
                  text: negativeText ?? Strings.no(),
                  onTap: () => Navigator.of(context).pop(false),
                ),
              ),
              12.w.horizontalSpace,
              Expanded(
                child: CustomButton(
                  height: 44.h,
                  text: positiveText ?? Strings.yes(),
                  onTap: () => Navigator.of(context).pop(true),
                ),
              ),
            ],
          ),
        ],
      ),
    );
    return result ?? false;
  }
}
