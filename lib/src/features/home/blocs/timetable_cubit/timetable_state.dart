part of 'timetable_cubit.dart';

@freezed
class TimetableState with _$TimetableState {
  const factory TimetableState.loading() = _Loading;
  const factory TimetableState.loaded(List<Timetable> items) = _Loaded;
  const factory TimetableState.error(String message) = _Error;
}
