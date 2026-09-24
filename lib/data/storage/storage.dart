import 'dart:convert';

import 'package:base_project/presentation/features/auth/sign_in/model/user_model.dart';
import 'package:base_project/util/enum.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'storage_constants.dart';

/// Local key value storage (Hive). Open the box in main() before using it.
class StorageService {
  final Box _box = Hive.box(box);

  bool hasData(String key) => _box.containsKey(key);

  String get authToken => _box.get(authTokenKey) ?? '';

  set authToken(String token) => _box.put(authTokenKey, token);

  bool get isLoggedIn => authToken.isNotEmpty;

  UserModel? get userInfo {
    final jsonString = _box.get(userInfoKey);
    if (jsonString is! String) return null;
    final data = json.decode(jsonString);
    return data is Map<String, dynamic> ? UserModel.fromJson(data) : null;
  }

  set userInfo(UserModel? user) {
    if (user == null) {
      _box.delete(userInfoKey);
    } else {
      _box.put(userInfoKey, json.encode(user.toJson()));
    }
  }

  LanguageType get language => LanguageType.valueOf(_box.get(languageKey));

  set language(LanguageType language) => _box.put(languageKey, language.name);

  bool get isFirstTimeUser => _box.get(isFirstTimeUserKey) ?? true;

  set isFirstTimeUser(bool value) => _box.put(isFirstTimeUserKey, value);

  Future<void> logout() async {
    await remove(userInfoKey);
    await remove(authTokenKey);
  }

  Future<void> remove(String key) => _box.delete(key);

  Future<int> clear() => _box.clear();

  /// Listen to a key: storage.watch(authTokenKey).listen((event) {...});
  Stream<BoxEvent> watch(String key) => _box.watch(key: key);
}
