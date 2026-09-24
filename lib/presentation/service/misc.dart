import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

/// Small helper methods that do not fit anywhere else.
class MiscService {
  Future<PackageInfo> getPackageInfo() => PackageInfo.fromPlatform();

  Future<bool> openBrowser(String url) async {
    final uri = Uri.tryParse(url);
    if (uri == null) return false;
    try {
      return await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      debugPrint('Failed to open browser: $e');
      return false;
    }
  }

  Future<bool> openMail(String to, {String subject = '', String body = ''}) async {
    final uri = Uri(
      scheme: 'mailto',
      path: to,
      query: 'subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}',
    );
    return _launch(uri);
  }

  Future<bool> openPhoneDial(String number) => _launch(Uri(scheme: 'tel', path: number));

  Future<bool> _launch(Uri uri) async {
    try {
      return await launchUrl(uri);
    } catch (e) {
      debugPrint('Failed to launch $uri: $e');
      return false;
    }
  }

  void closeKeyboard() => SystemChannels.textInput.invokeMethod('TextInput.hide');

  void setFullScreen(bool isFullScreen) {
    SystemChrome.setEnabledSystemUIMode(isFullScreen ? SystemUiMode.immersive : SystemUiMode.edgeToEdge);
  }

  /// "johndoe@mail.com" -> "jo***oe@mail.com"
  String hideEmail(String email) {
    final parts = email.split('@');
    if (parts.length != 2 || parts.first.length < 3) return email;
    final name = parts.first;
    final keep = name.length > 6 ? 2 : 1;
    return '${name.substring(0, keep)}***${name.substring(name.length - keep)}@${parts.last}';
  }

  Color hexToColor(String? hexColor, {Color fallback = const Color(0xFFE0E0E0)}) {
    if (hexColor == null || hexColor.isEmpty) return fallback;
    final value = int.tryParse(hexColor.replaceFirst('#', ''), radix: 16);
    return value == null ? fallback : Color(value | 0xFF000000);
  }
}
