import 'package:studtime/data/cache/app_cache.dart';

/// Кэш для хранения информации о том, первый ли раз пользователь открывает приложение
class IsFirstTimeCache extends AppCache<bool> {
  IsFirstTimeCache(super.prefs, super.key);

  @override
  bool get() {
    /// если значение не было сохранено, то возвращаем true
    return super.get() ?? true;
  }
}
