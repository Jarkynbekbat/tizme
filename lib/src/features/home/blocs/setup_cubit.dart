import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studtime/src/shared/data/cache/setup_cache.dart';
import 'package:studtime/src/shared/data/models/setup/setup.dart';

class SetupCubit extends Cubit<Setup> {
  final SetupCache _settingsCache;
  SetupCubit(this._settingsCache) : super(_settingsCache.get()!);

  void setSettings(Setup settings) {
    _settingsCache.set(settings);
    emit(settings);
  }
}
