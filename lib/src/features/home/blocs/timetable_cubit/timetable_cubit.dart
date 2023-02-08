import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studtime/src/features/home/blocs/settings_cubit.dart';
import 'package:studtime/src/shared/data/models/schedule/schedule.dart';
import 'package:studtime/src/shared/data/models/schedule/schedule_ref.dart';
import 'package:studtime/src/shared/data/models/settings/user_settings.dart';

part 'timetable_state.dart';
part 'timetable_cubit.freezed.dart';

/// Кубит для работы с расписанием
class TimetableCubit extends Cubit<TimetableState> {
  final FirebaseFirestore _firestore;
  final SettingsCubit _settingsCubit;

  late final StreamSubscription _settingsSub;

  TimetableCubit(this._firestore, this._settingsCubit)
      : super(const TimetableState.loading()) {
    _onSettingsChanged(_settingsCubit.state);
    _settingsSub = _settingsCubit.stream.listen(_onSettingsChanged);
  }

  @override
  Future<void> close() {
    _settingsSub.cancel();
    return super.close();
  }

  /// Обработать изменение настроек пользователя
  void _onSettingsChanged(UserSettings settings) async {
    emit(const TimetableState.loading());

    try {
      final isTeacher = settings.type == UserSettingsType.teacher;
      final timetable = isTeacher
          ? await _getTimetableByTeacher(settings.id)
          : await _getTimetableByGroup(settings.id);

      emit(TimetableState.loaded(items: timetable, isTeacher: isTeacher));
    } on Exception catch (e) {
      emit(TimetableState.error(e.toString()));
    }
  }

  /// Получить расписание по группе
  Future<List<Schedule>> _getTimetableByGroup(String groupUid) async {
    final groupRef = _firestore.doc('groups/$groupUid');
    final timetablesSnap = await _firestore
        .collection('timetables')
        .where('group_ref', isEqualTo: groupRef)
        .get();

    final timetables = timetablesSnap.docs;
    final items = timetables.map((e) => ScheduleRef.fromDoc(e)).toList();
    final schedules =
        await Future.wait(items.map((e) => Schedule.fromRef(e)).toList());
    return schedules;
  }

  /// Получить расписание по преподавателю
  Future<List<Schedule>> _getTimetableByTeacher(String teacherUid) async {
    final teacherRef = _firestore.doc('teachers/$teacherUid');
    final timetablesSnap = await _firestore
        .collection('timetables')
        .where('teacher_ref', isEqualTo: teacherRef)
        .get();

    final timetables = timetablesSnap.docs;
    final items = timetables.map((e) => ScheduleRef.fromDoc(e)).toList();
    final schedules = await Future.wait(items.map((e) => Schedule.fromRef(e)));
    return schedules;
  }
}
