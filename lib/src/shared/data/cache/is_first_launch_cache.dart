import 'package:studtime/src/shared/data/cache/app_cache.dart';

/// Кэш для хранения информации о том, первый ли раз пользователь открывает приложение
class IsFirstLaunchCache extends AppCache<bool> {
  IsFirstLaunchCache(super.prefs, super.key);

  @override
  bool get() {
    /// если значение не было сохранено, то возвращаем true
    return super.get() ?? true;
  }
}
