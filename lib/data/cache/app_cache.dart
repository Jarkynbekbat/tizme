import 'package:shared_preferences/shared_preferences.dart';

/// Абстрактный класс для работы с кэшем через SharedPreferences
abstract class AppCache<T> {
  final SharedPreferences _prefs;
  final String _key;

  AppCache(this._prefs, this._key);

  Future<void> set(T value) {
    switch (T) {
      case String:
        return _prefs.setString(_key, value as String);
      case int:
        return _prefs.setInt(_key, value as int);
      case double:
        return _prefs.setDouble(_key, value as double);
      case bool:
        return _prefs.setBool(_key, value as bool);
      case List<String>:
        return _prefs.setStringList(_key, value as List<String>);
      default:
        throw Exception('Unsupported type');
    }
  }

  T? get() {
    switch (T) {
      case String:
        return _prefs.getString(_key) as T?;
      case int:
        return _prefs.getInt(_key) as T?;
      case double:
        return _prefs.getDouble(_key) as T?;
      case bool:
        return _prefs.getBool(_key) as T?;
      case List<String>:
        return _prefs.getStringList(_key) as T?;
      default:
        throw Exception('Unsupported type');
    }
  }

  Future<void> remove() {
    return _prefs.remove(_key);
  }
}
