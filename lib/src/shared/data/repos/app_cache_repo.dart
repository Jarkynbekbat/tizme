import 'package:shared_preferences/shared_preferences.dart';
import 'package:studtime/src/shared/data/cache/chat_cache.dart';
import 'package:studtime/src/shared/data/cache/is_first_launch_cache.dart';
import 'package:studtime/src/shared/data/cache/is_intro_shown_cache.dart';
import 'package:studtime/src/shared/data/cache/settings_cache.dart';

/// Репозиторий для работы с кэшем
class AppCacheRepo {
  late final IsFirstLaunchCache isFirstLaunchCache;
  late final SettingsCache settingsCache;
  late final IsIntroShownCache isIntroShownCache;
  late final ChatCache chatCache;

  /// Инициализируем все кэши
  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    isFirstLaunchCache = IsFirstLaunchCache(prefs, 'is_first_launch');
    settingsCache = SettingsCache(prefs, 'settings');
    isIntroShownCache = IsIntroShownCache(prefs, 'is_intro_shown');
    chatCache = ChatCache(prefs, 'chat');
  }
}
