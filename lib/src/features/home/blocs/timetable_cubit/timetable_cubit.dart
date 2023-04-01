import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studtime/src/features/home/blocs/setup_cubit.dart';
import 'package:studtime/src/shared/data/models/classroom/classroom.dart';
import 'package:studtime/src/shared/data/models/group/group.dart';
import 'package:studtime/src/shared/data/models/schedule/schedule.dart';
import 'package:studtime/src/shared/data/models/setup/setup.dart';

part 'timetable_state.dart';
part 'timetable_cubit.freezed.dart';

/// Кубит для работы с расписанием
class TimetableCubit extends Cubit<TimetableState> {
  final FirebaseFirestore _firestore;
  final SetupCubit _settingsCubit;

  late final StreamSubscription _settingsSub;
  StreamSubscription? _timetableSub;

  TimetableCubit(this._firestore, this._settingsCubit)
      : super(const TimetableState.loading()) {
    _onSettingsChanged(_settingsCubit.state);
    _settingsSub = _settingsCubit.stream.listen(_onSettingsChanged);
  }

  @override
  Future<void> close() {
    _settingsSub.cancel();
    _timetableSub?.cancel();
    return super.close();
  }

  ///  подписаться на расписание аудитории
  void subscribeToClassroom(Classroom classroom) {
    _timetableSub?.cancel();
    emit(const TimetableState.loading());

    final classroomRef = _firestore.doc('classroms/${classroom.id}');
    _timetableSub = _firestore
        .collection('timetables')
        .where('classroom_ref', isEqualTo: classroomRef)
        .snapshots()
        .listen(
          (event) => _onTimetableChanged(event, isTeacher: false),
          onError: (e) => emit(TimetableState.error(e.toString())),
        );
  }

  /// Отписаться от расписания аудитории
  void unsubscrideFromClassroom() {
    _onSettingsChanged(_settingsCubit.state);
  }

  /// Обработать изменение настроек пользователя
  void _onSettingsChanged(Setup settings) async {
    _timetableSub?.cancel();
    emit(const TimetableState.loading());

    try {
      final isTeacher = settings.type == SetupType.teacher;

      if (isTeacher) {
        final teacherRef = _firestore.doc('teachers/${settings.id}');
        _timetableSub = _firestore
            .collection('timetables')
            .where('teacher_ref', isEqualTo: teacherRef)
            .snapshots()
            .listen(
              (event) => _onTimetableChanged(event, isTeacher: true),
              onError: (e) => emit(TimetableState.error(e.toString())),
            );
      }

      final groupRef = _firestore.doc('groups/${settings.id}');
      final groupDoc = await groupRef.get();
      final group = await Group.fromDoc(groupDoc);
      final wayRef = _firestore.doc('ways/${group.way.id}');

      _timetableSub = _firestore
          .collection('timetables')
          .where('target_ref', whereIn: [groupRef, wayRef])
          .snapshots()
          .listen(
            (event) => _onTimetableChanged(event, isTeacher: false),
            onError: (e) => emit(TimetableState.error(e.toString())),
          );
    } on Exception catch (e) {
      emit(TimetableState.error(e.toString()));
    }
  }

  void _onTimetableChanged(
    QuerySnapshot<Map<String, dynamic>> event, {
    required bool isTeacher,
  }) async {
    try {
      final futures = event.docs.map((e) => Schedule.fromDoc(e)).toList();
      final schedules = await Future.wait(futures);
      emit(TimetableState.loaded(items: schedules, isTeacher: isTeacher));
    } catch (e, stackTrace) {
      return Future.error(e, stackTrace);
    }
  }
}
