import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studtime/src/features/home/blocs/setup_cubit.dart';
import 'package:studtime/src/shared/data/models/classroom/classroom.dart';
import 'package:studtime/src/shared/data/models/schedule/schedule.dart';
import 'package:studtime/src/shared/data/models/setup/setup.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'timetable_state.dart';
part 'timetable_cubit.freezed.dart';

/// Кубит для работы с расписанием
class TimetableCubit extends Cubit<TimetableState> {
  final SupabaseClient _supabase;
  final SetupCubit _settingsCubit;

  late final StreamSubscription _settingsSub;

  TimetableCubit(
    this._supabase,
    this._settingsCubit,
  ) : super(const TimetableState.loading()) {
    _onSettingsChanged(_settingsCubit.state);
    _settingsSub = _settingsCubit.stream.listen(_onSettingsChanged);
  }

  @override
  Future<void> close() {
    _settingsSub.cancel();
    return super.close();
  }

  ///  подписаться на расписание аудитории
  void fetchForClassroom(Classroom classroom) async {
    try {
      emit(const TimetableState.loading());
      final schedules = await _supabase
          .from('schedules')
          .select<List<Map<String, dynamic>>>(
              '*, classroom(*), subject(*), teacher(*), group(*), way(*)')
          .eq('classroom_id', classroom.id);
      _onTimetableChanged(schedules, isTeacher: false);
    } on Exception catch (ex) {
      emit(TimetableState.error(ex.toString()));
    }
  }

  /// Отписаться от расписания аудитории
  void unsubscrideFromClassroom() {
    _onSettingsChanged(_settingsCubit.state);
  }

  /// Обработать изменение настроек пользователя
  void _onSettingsChanged(Setup settings) async {
    emit(const TimetableState.loading());

    try {
      final isTeacher = settings.type == SetupType.teacher;

      if (isTeacher) {
        final teacherId = settings.id;

        final rawSchedules = await _supabase
            .from('schedules')
            .select(
                '*, classrooms(*), subjects(*), teachers(*), groups(*), ways(*)')
            .eq('teacher_id', teacherId);
        _onTimetableChanged(rawSchedules, isTeacher: true);
        return;
      }

      final groupId = settings.id;
      final wayIdMap = await _supabase
          .from('groups')
          .select<Map>('way_id')
          .eq('id', groupId)
          .limit(1)
          .single();

      final rawSchedules = await _supabase
          .from('schedules')
          .select<List<Map<String, dynamic>>>(
              '*, classrooms(*), subjects(*), teachers(*), groups(*), ways(*)')
          .or('group_id.eq.$groupId, way_id.eq.${wayIdMap['way_id']}');

      _onTimetableChanged(rawSchedules, isTeacher: false);
    } on Exception catch (e) {
      emit(TimetableState.error(e.toString()));
    }
  }

  void _onTimetableChanged(
    List<Map<String, dynamic>> rawSchedules, {
    required bool isTeacher,
  }) async {
    try {
      final schedules = rawSchedules.map((e) => Schedule.fromJson(e)).toList();
      emit(TimetableState.loaded(items: schedules, isTeacher: isTeacher));
    } catch (e, stackTrace) {
      return Future.error(e, stackTrace);
    }
  }
}
