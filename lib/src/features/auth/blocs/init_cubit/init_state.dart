part of 'init_cubit.dart';

@freezed
class InitState with _$InitState {
  const factory InitState.loading() = _Initial;
  const factory InitState.loaded() = _Loaded;
  const factory InitState.error(String message) = _Error;
}
