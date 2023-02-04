import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studtime/src/features/home/blocs/timetable_cubit/timetable_cubit.dart';
import 'package:studtime/src/shared/data/models/schedule/schedule.dart';

class DayTimetableCubit extends Cubit<TimetableState> {
  final TimetableCubit _timetableCubit;
  final Weekday _weekday;

  DayTimetableCubit(this._timetableCubit, this._weekday)
      : super(_timetableCubit.state) {
    _onTimetableChanged(_timetableCubit.state);
    _timetableCubit.stream.listen(_onTimetableChanged);
  }

  @override
  Future<void> close() {
    _timetableCubit.close();
    return super.close();
  }

  void _onTimetableChanged(TimetableState event) {
    event.maybeWhen(
      loaded: (list) {
        final filtered = list.where((e) => e.day == _weekday).toList();
        emit(TimetableState.loaded(filtered));
      },
      orElse: () {
        emit(event);
      },
    );
  }
}
