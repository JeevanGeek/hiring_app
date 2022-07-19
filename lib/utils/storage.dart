import 'package:hive_flutter/hive_flutter.dart';

class Storage {
  Storage._();

  static late Box box;

  static Future<void> init() async {
    await Hive.initFlutter();
    box = await Hive.openBox(StorageKeys.box);
  }

  static Future<void> clear() async {
    await box.clear();
  }

  static Future<void> setLogin(bool value) async {
    await box.put(StorageKeys.isLogged, value);
  }

  static bool isLoggedIn() {
    return box.get(StorageKeys.isLogged) ?? false;
  }

  static Future<void> setRole(String role) async {
    await box.put(StorageKeys.role, role);
  }

  static String? getRole() {
    return box.get(StorageKeys.role);
  }
}

class StorageKeys {
  StorageKeys._();

  static const String box = 'myBox';

  static const String isLogged = 'isLogged';
  static const String role = 'role';
}
