import 'package:shared_preferences/shared_preferences.dart';
import 'package:studtime/src/shared/data/cache/is_intro_shown_cache.dart';
import 'package:studtime/src/shared/data/cache/settings_cache.dart';

/// Репозиторий для работы с кэшем
class AppCacheRepo {
  late final IsIntroShownCache isIntroShownCache;
  late final SettingsCache settingsCache;

  /// Инициализируем все кэши
  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    isIntroShownCache = IsIntroShownCache(prefs, 'is_intro_shown');
    settingsCache = SettingsCache(prefs, 'settings');
  }
}
