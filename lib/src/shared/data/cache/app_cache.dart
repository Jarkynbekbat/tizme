import 'package:shared_preferences/shared_preferences.dart';

/// Абстрактный класс для работы с кэшем через SharedPreferences
abstract class AppCache<T> {
  final SharedPreferences prefs;
  final String key;

  AppCache(this.prefs, this.key);

  Future<void> set(T value) {
    switch (T) {
      case String:
        return prefs.setString(key, value as String);
      case int:
        return prefs.setInt(key, value as int);
      case double:
        return prefs.setDouble(key, value as double);
      case bool:
        return prefs.setBool(key, value as bool);
      case List<String>:
        return prefs.setStringList(key, value as List<String>);
      default:
        throw Exception('Unsupported type');
    }
  }

  T? get() {
    switch (T) {
      case String:
        return prefs.getString(key) as T?;
      case int:
        return prefs.getInt(key) as T?;
      case double:
        return prefs.getDouble(key) as T?;
      case bool:
        return prefs.getBool(key) as T?;
      case List<String>:
        return prefs.getStringList(key) as T?;
      default:
        throw Exception('Unsupported type');
    }
  }

  Future<void> remove() {
    return prefs.remove(key);
  }
}
