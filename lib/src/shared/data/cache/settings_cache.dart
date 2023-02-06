import 'dart:convert';

import 'package:studtime/src/shared/data/cache/app_cache.dart';
import 'package:studtime/src/shared/data/models/settings/user_settings.dart';

/// Хранит выбор пользователя (группа, преподаватель)
class SettingsCache extends AppCache<UserSettings> {
  SettingsCache(super.prefs, super.key);

  @override
  Future<void> set(UserSettings value) async {
    final json = value.toJson();
    final jsonStr = jsonEncode(json);
    await super.prefs.setString(super.key, jsonStr);
  }

  @override
  UserSettings? get() {
    final jsonStr = super.prefs.getString(super.key);
    if (jsonStr == null) return null;
    final json = jsonDecode(jsonStr);
    return UserSettings.fromJson(json);
  }
}
