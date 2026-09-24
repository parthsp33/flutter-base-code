import 'core_export.dart';

/// Small reusable widget builders. Available in every BaseWidget.
mixin WidgetUtils on TextStyles {
  Widget buildDivider({Color color = ColorName.neutral95, double thickness = 1}) {
    return Divider(color: color, thickness: thickness);
  }

  Widget buildGradientDivider({
    List<Color>? colors,
    double height = 1,
    double width = double.infinity,
  }) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: colors ?? [ColorName.white, ColorName.neutral80]),
      ),
    );
  }

  Widget textButton({required String text, required VoidCallback onTap, TextStyle? style}) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: onTap,
      child: Text(text, style: style ?? dmSans500()),
    );
  }

  Widget shadowDecoration({required Widget child, double radius = 16}) {
    return Container(
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(radius.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(1, 1),
            spreadRadius: 2,
          ),
        ],
      ),
      child: child,
    );
  }

  Widget twoColorTitle({required String title, required String coloredTitle}) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: '$title ', style: dmSans900(height: 1.2)),
          TextSpan(text: coloredTitle, style: dmSans900(height: 1.2, color: ColorName.primary50)),
        ],
      ),
    );
  }
}
