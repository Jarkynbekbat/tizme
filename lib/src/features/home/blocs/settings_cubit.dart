import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studtime/src/shared/data/cache/settings_cache.dart';
import 'package:studtime/src/shared/data/models/settings/user_settings.dart';

class SettingsCubit extends Cubit<UserSettings> {
  final SettingsCache _settingsCache;
  SettingsCubit(this._settingsCache) : super(_settingsCache.get()!);

  void setSettings(UserSettings settings) {
    _settingsCache.set(settings);
    emit(settings);
  }
}
