import 'package:hive_flutter/hive_flutter.dart';

class Storage {
  Storage._();

  static late Box box;

  static Future init() async {
    await Hive.initFlutter();
    box = await Hive.openBox(StorageKeys.box);
  }

  static Future setLogin(bool value) async {
    await box.put(StorageKeys.isLogged, value);
  }

  static bool isLoggedIn() {
    return box.get(StorageKeys.isLogged) ?? false;
  }
}

class StorageKeys {
  StorageKeys._();

  static const String box = 'myBox';

  static const String isLogged = 'isLogged';
}
