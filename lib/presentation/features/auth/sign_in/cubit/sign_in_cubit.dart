import 'package:base_project/presentation/features/auth/sign_in/model/sign_in_model.dart';
import 'package:base_project/presentation/features/auth/sign_in/model/user_model.dart';
import 'package:base_project/presentation/features/auth/sign_in/repo/sign_in_repo.dart';
import 'package:base_project/util/core_export.dart';

class SignInCubit extends BaseCubit {
  SignInCubit({SignInRepo? repo}) : _repo = repo ?? SignInRepo();

  final SignInRepo _repo;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool get isButtonDisabled => emailController.text.trim().isEmpty || passwordController.text.isEmpty;

  /// Rebuilds only the login button (see buildWhen in the screen).
  void onFieldChanged() => emit(OnChanged());

  Future<void> onTapSignIn() async {
    final model = SignInModel(email: emailController.text, password: passwordController.text);
    final (isValid, errorMessage) = model.isValidate();
    if (!isValid) {
      showError(errorMessage);
      return;
    }

    emit(Loading());
    final res = await _repo.signIn(reqData: model.toJson());

    if (res.isSuccess && res.data is Map<String, dynamic>) {
      final user = UserModel.fromJson(res.data);
      if (user.token.isNotEmpty) storage.authToken = user.token;
      storage.userInfo = user;
      showSuccess(res.displayMessage);
      safeEmit(ApiSuccess(user));
      navigation.pushAndRemoveUntil(Routes.homeScreen);
    } else {
      onApiError(res.displayMessage);
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
