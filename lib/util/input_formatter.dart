import 'package:flutter/services.dart';

import 'validation_regex.dart';

class InputFormatter {
  static List<TextInputFormatter> digitOnly = [FilteringTextInputFormatter.digitsOnly];

  static List<TextInputFormatter> email = [FilteringTextInputFormatter.allow(ValidationRegex.emailInput.value)];

  static List<TextInputFormatter> name = [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z ]'))];
}

class NoLeadingSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return newValue.text.startsWith(' ') ? oldValue : newValue;
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return newValue.copyWith(text: newValue.text.toUpperCase());
  }
}

/// Adds "/" after month for MM/YY input.
class ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;
    if (text.length == 2 && oldValue.text.length == 1) {
      return TextEditingValue(text: '$text/', selection: TextSelection.collapsed(offset: text.length + 1));
    }
    if (text.length == 2 && oldValue.text.length == 3) {
      return TextEditingValue(text: text.substring(0, 1), selection: const TextSelection.collapsed(offset: 1));
    }
    return newValue;
  }
}
