import 'package:studtime/src/shared/data/cache/app_cache.dart';

class ThemeCache extends AppCache<bool> {
  ThemeCache(super.prefs, super.key);

  @override
  bool get() {
    /// если значение не было сохранено, то возвращаем true
    return super.get() ?? false;
  }

  Future<void> setBool(bool value) {
    /// если значение не было сохранено, то возвращаем true
    return super.set(value);
  }
}
