import 'package:shared_preferences/shared_preferences.dart';
import 'package:studtime/data/cache/is_first_time_cache.dart';

/// Репозиторий для работы с кэшем
class AppCacheRepo {
  late final IsFirstTimeCache isFirstTimeCache;

  /// Инициализируем все кэши
  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();

    isFirstTimeCache = IsFirstTimeCache(prefs, 'isFirstTime');
  }
}
