import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension WidgetPaddingExtension on Widget {
  Widget withPadding(EdgeInsetsGeometry padding) => Padding(padding: padding, child: this);

  Widget withAllPadding(double padding) => withPadding(EdgeInsets.all(padding));

  Widget withSymmetricPadding({double vertical = 0.0, double horizontal = 0.0}) {
    return withPadding(EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal));
  }

  Widget withOnlyPadding({double left = 0.0, double top = 0.0, double right = 0.0, double bottom = 0.0}) {
    return withPadding(EdgeInsets.only(left: left, top: top, right: right, bottom: bottom));
  }
}

extension WidgetExtensions on Widget {
  /// Tap handler that blocks double taps within 400 ms.
  Widget addOnTap(VoidCallback callback) {
    return InkWell(
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      onTap: () {
        if (!isRedundantClick(DateTime.now())) {
          HapticFeedback.mediumImpact();
          callback();
        }
      },
      child: this,
    );
  }

  Widget visibility({required bool isVisible}) => Visibility(visible: isVisible, child: this);
}

DateTime? _firstClickTime;

bool isRedundantClick(DateTime clickTime) {
  if (_firstClickTime != null && clickTime.difference(_firstClickTime!).inMilliseconds < 400) {
    return true;
  }
  _firstClickTime = clickTime;
  return false;
}

void hideKeyBoard(BuildContext context) => FocusScope.of(context).unfocus();

extension TextControllerExtension on TextEditingController {
  String get trimmedText => text.trim();
}

extension StringExtension on String {
  String toCapitalized() => isEmpty ? '' : '${this[0].toUpperCase()}${substring(1).toLowerCase()}';

  String get removeCircularBrackets => replaceAll('(', '').replaceAll(')', '');
}

extension ScrollControllerExtension on ScrollController {
  /// True when the list is scrolled to the end. Use it for pagination.
  bool get isLoadMore => position.pixels >= position.maxScrollExtent;
}
