import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final localStorageProvider = Provider<LocalStorage>(
  (ref) => throw UnimplementedError('Should be overridden on app init'),
);

class LocalStorage {
  final SharedPreferences _sharedPreferences;
  LocalStorage(this._sharedPreferences);
  static Future<LocalStorage> init() async {
    final sp = await SharedPreferences.getInstance();
    return LocalStorage(sp);
  }

  String? getString(String key) {
    return _sharedPreferences.getString(key);
  }

  Future<bool> setString(String key, String value) {
    return _sharedPreferences.setString(key, value);
  }

  Future<bool> removeKey(String key) {
    return _sharedPreferences.remove(key);
  }
}
