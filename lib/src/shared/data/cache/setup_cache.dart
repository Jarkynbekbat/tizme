import 'dart:convert';

import 'package:studtime/src/shared/data/cache/app_cache.dart';
import 'package:studtime/src/shared/data/models/setup/setup.dart';

/// Хранит выбор пользователя (группа, преподаватель)
class SetupCache extends AppCache<Setup> {
  SetupCache(super.prefs, super.key);

  @override
  Future<void> set(Setup value) async {
    final json = value.toJson();
    final jsonStr = jsonEncode(json);
    await super.prefs.setString(super.key, jsonStr);
  }

  @override
  Setup? get() {
    final jsonStr = super.prefs.getString(super.key);
    if (jsonStr == null) return null;
    final json = jsonDecode(jsonStr);
    return Setup.fromJson(json);
  }
}
