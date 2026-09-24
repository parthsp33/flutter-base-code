import 'dart:io';

import 'package:base_project/data/storage/storage.dart';
import 'package:base_project/data/storage/storage_constants.dart';
import 'package:base_project/presentation/features/auth/sign_in/model/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  late Directory dir;
  late StorageService storage;

  setUp(() async {
    dir = await Directory.systemTemp.createTemp('hive_test');
    Hive.init(dir.path);
    await Hive.openBox(box);
    storage = StorageService();
  });

  tearDown(() async {
    await Hive.deleteFromDisk();
    await dir.delete(recursive: true);
  });

  test('userInfo saves and reads user', () {
    storage.userInfo = const UserModel(id: '1', name: 'John', email: 'john@mail.com');
    expect(storage.userInfo?.name, 'John');
  });

  test('userInfo set to null removes user without crash', () {
    storage.userInfo = const UserModel(id: '1');
    storage.userInfo = null;
    expect(storage.userInfo, isNull);
    expect(storage.hasData(userInfoKey), isFalse);
  });

  test('logout clears token and user', () async {
    storage.authToken = 'token';
    storage.userInfo = const UserModel(id: '1');
    await storage.logout();
    expect(storage.isLoggedIn, isFalse);
    expect(storage.userInfo, isNull);
  });
}
