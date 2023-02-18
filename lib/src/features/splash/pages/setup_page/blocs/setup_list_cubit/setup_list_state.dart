part of 'setup_list_cubit.dart';

@freezed
class SetupListState with _$SetupListState {
  const factory SetupListState.loading() = _Loading;
  const factory SetupListState.loaded(List<SuggestionItem> items) = _Loaded;
  const factory SetupListState.error(String message) = _Error;
}
