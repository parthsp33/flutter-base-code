import 'package:base_project/string/string.dart';
import 'package:base_project/util/validator.dart';

/// Request body for login. Validation lives in the model
/// so the cubit stays small and it is easy to unit test.
class SignInModel {
  final String email;
  final String password;

  SignInModel({required this.email, required this.password});

  Map<String, dynamic> toJson() => {
        'email': email.trim(),
        'password': password,
      };

  /// Returns (isValid, errorMessage).
  (bool, String) isValidate() {
    if (email.trim().isEmpty) return (false, Strings.emailEmpty());
    if (!Validator.isEmail(email)) return (false, Strings.emailInvalid());
    if (password.isEmpty) return (false, Strings.passwordEmpty());
    if (!Validator.isPassword(password)) return (false, Strings.passwordInvalid());
    return (true, '');
  }
}
