part of 'setup_cubit.dart';

@freezed
class SetupState with _$SetupState {
  const factory SetupState.loading() = _Loading;
  const factory SetupState.loaded(List<SuggestionItem> items) = _Loaded;
  const factory SetupState.error(String message) = _Error;
}
