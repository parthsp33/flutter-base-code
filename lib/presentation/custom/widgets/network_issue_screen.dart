import 'package:base_project/presentation/base/base_widget.dart';
import 'package:base_project/util/core_export.dart';

/// Opened by ConnectivityService when internet is lost. Closes by itself
/// when internet comes back, so the user can not go back manually.
class NetworkIssueScreen extends BaseWidget {
  NetworkIssueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.drawables.imgNoConnection.svg(height: 160.h, width: 160.w),
                48.h.verticalSpace,
                Text(Strings.noNetwork(), textAlign: TextAlign.center, style: dmSans500(size: 15)),
                10.h.verticalSpace,
                Text(
                  Strings.noNetworkMessage(),
                  textAlign: TextAlign.center,
                  style: dmSans500(size: 13, color: ColorName.neutral60),
                ),
              ],
            ).withSymmetricPadding(horizontal: 16.w),
          ),
        ),
      ),
    );
  }
}
