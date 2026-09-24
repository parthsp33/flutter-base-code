import 'package:localization/localization.dart';

class _LocaleDelegate {
  final String _key;

  _LocaleDelegate(this._key);

  String call([List<String>? args]) => _key.i18n(args ?? []);
}

/// All UI strings. First add the key in assets/languages/en.json,
/// then add a line here. Use it as: Strings.login()
/// With arguments: "hello_name": "Hello %s" -> Strings.helloName(['John'])
class Strings {
  static final appName = _LocaleDelegate('app_name');
  static final noInternetConnectionError = _LocaleDelegate('no_internet_connection_error');
  static final requestTimeout = _LocaleDelegate('request_timeout');
  static final somethingWentWrong = _LocaleDelegate('something_went_wrong');
  static final noNetwork = _LocaleDelegate('no_network');
  static final noNetworkMessage = _LocaleDelegate('no_network_message');
  static final noDataFound = _LocaleDelegate('no_data_found');

  static final welcome = _LocaleDelegate('welcome');
  static final back = _LocaleDelegate('back');
  static final loginInstruction = _LocaleDelegate('login_instruction');
  static final emailAddress = _LocaleDelegate('email_address');
  static final eEmailAddress = _LocaleDelegate('e_email_address');
  static final password = _LocaleDelegate('password');
  static final ePassword = _LocaleDelegate('e_password');
  static final login = _LocaleDelegate('login');
  static final logout = _LocaleDelegate('logout');
  static final home = _LocaleDelegate('home');
  static final homeMessage = _LocaleDelegate('home_message');

  static final emailEmpty = _LocaleDelegate('email_empty');
  static final emailInvalid = _LocaleDelegate('email_invalid');
  static final passwordEmpty = _LocaleDelegate('password_empty');
  static final passwordInvalid = _LocaleDelegate('password_invalid');

  static final ok = _LocaleDelegate('ok');
  static final cancel = _LocaleDelegate('cancel');
  static final yes = _LocaleDelegate('yes');
  static final no = _LocaleDelegate('no');
  static final logoutConfirm = _LocaleDelegate('logout_confirm');
}
