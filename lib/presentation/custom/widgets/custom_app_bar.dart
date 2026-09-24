import '../../../util/core_export.dart';

/// App bar with round back button, center title and optional trailing widget.
class CustomAppBar extends StatelessWidget with TextStyles implements PreferredSizeWidget {
  final String title;
  final bool showBack;
  final VoidCallback? onTapBack;
  final Widget? trailing;
  final Color bgColor;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBack = true,
    this.onTapBack,
    this.trailing,
    this.bgColor = Colors.transparent,
  });

  Widget _circle(Widget child) {
    return Container(
      height: 44.w,
      width: 44.w,
      decoration: BoxDecoration(
        color: ColorName.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 5, offset: const Offset(1, 1)),
        ],
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            SizedBox(
              width: 44.w,
              child: showBack
                  ? _circle(Assets.drawables.icArrow.svg(fit: BoxFit.scaleDown)).addOnTap(
                      () => onTapBack != null ? onTapBack!() : GetIt.I<NavigationService>().pop(),
                    )
                  : null,
            ),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: dmSans500(size: 20, color: ColorName.black),
              ),
            ),
            SizedBox(width: 44.w, child: trailing != null ? _circle(trailing!) : null),
          ],
        ).withSymmetricPadding(horizontal: 12.w, vertical: 4.h),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 8.h);
}
