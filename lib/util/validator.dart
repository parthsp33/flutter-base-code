import 'validation_regex.dart';

class Validator {
  static bool isEmail(String value) => ValidationRegex.email.value.hasMatch(value.trim());

  static bool isPhone(String value) => ValidationRegex.phone.value.hasMatch(value.trim());

  static bool isPassword(String value) => ValidationRegex.password.value.hasMatch(value);

  static bool isFullName(String value) => ValidationRegex.fullName.value.hasMatch(value.trim());

  static bool isName(String value) => ValidationRegex.alphabetWithSpace.value.hasMatch(value.trim());

  static bool isNumber(String value) => ValidationRegex.onlyNumber.value.hasMatch(value);

  static bool isWebsite(String value) => ValidationRegex.website.value.hasMatch(value.trim());

  static bool isPercentage(String value) => ValidationRegex.percentage.value.hasMatch(value);

  static bool isAddress(String value) => ValidationRegex.address.value.hasMatch(value.trim());

  static bool isDescription(String value) => ValidationRegex.description.value.hasMatch(value.trim());

  static bool isSamePassword(String password, String confirmPassword) => password == confirmPassword;

  /// Card expiry in MM/YY format.
  static bool isValidExpiryDate(String? value) {
    if (value == null || value.isEmpty) return false;
    final parts = value.split('/');
    if (parts.length != 2) return false;
    final month = int.tryParse(parts.first);
    final year = int.tryParse('20${parts.last}');
    if (month == null || year == null || month < 1 || month > 12) return false;
    final lastMoment = DateTime(year, month + 1, 0, 23, 59, 59, 999);
    return !lastMoment.isBefore(DateTime.now());
  }
}

/// Safe type conversion for API values.
class Types {
  static String getString(dynamic val) => (val is String) ? val : (val is num ? val.toString() : '');

  static int getInt(dynamic val) {
    if (val is int) return val;
    if (val is double) return val.toInt();
    return int.tryParse(val?.toString() ?? '') ?? 0;
  }

  static double getDouble(dynamic val) {
    if (val is double) return val;
    if (val is int) return val.toDouble();
    return double.tryParse(val?.toString() ?? '') ?? 0.0;
  }

  static bool getBool(dynamic val) {
    if (val is bool) return val;
    if (val is int) return val == 1;
    if (val is String) return val == 'true' || val == '1';
    return false;
  }
}
