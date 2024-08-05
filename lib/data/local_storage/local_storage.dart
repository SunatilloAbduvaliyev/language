import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static SharedPreferences? pref;

  static Future<void> prefInstance() async {
    pref = await SharedPreferences.getInstance();
  }

  LocalStorage._();

  static LocalStorage instance = LocalStorage._();

  factory LocalStorage() => instance;

  static Future<void> setBool({
    required String key,
    required bool value,
  }) async {
    if (pref != null) {
      pref!.setBool(key, value);
    }
  }

  static Future<bool> getBool({
    required String key,
  }) async {
    if (pref != null) {
      return pref!.getBool(key) ?? false;
    }
    return false;
  }

  static Future<void> setListString({
    required String key,
    required List<String> value,
  }) async {
    if (pref != null) {
      pref!.setStringList(key, value);
    }
  }

  static Future<List<String>> getListString({
    required String key,
  }) async {
    if (pref != null) {
      return pref!.getStringList(key) ?? [];
    }
    return [];
  }
}
