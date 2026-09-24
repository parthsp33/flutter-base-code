import 'package:base_project/presentation/custom/widgets/custom_dialog.dart';
import 'package:base_project/util/core_export.dart';

class HomeCubit extends BaseCubit {
  String get userName {
    final user = storage.userInfo;
    if (user == null) return '';
    return user.name.isNotEmpty ? user.name : user.email;
  }

  Future<void> onTapLogout() async {
    final isConfirm = await DialogUtils.confirmDialog(title: Strings.logout(), message: Strings.logoutConfirm());
    if (!isConfirm) return;
    // TODO: Call logout API here if your backend needs it.
    await storage.logout();
    navigation.pushAndRemoveUntil(Routes.signInScreen);
  }
}
