import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studtime/src/shared/data/models/suggestion_item.dart';
import 'package:studtime/src/shared/data/models/group/group.dart';
import 'package:studtime/src/shared/data/models/teacher/teacher.dart';

part 'setup_state.dart';
part 'setup_cubit.freezed.dart';

/// кубит для загрузки данных для страницы настройки
class SetupCubit extends Cubit<SetupState> {
  final FirebaseFirestore _firestore;

  SetupCubit(this._firestore) : super(const SetupState.loading());

  Future<void> load() async {
    emit(const SetupState.loading());
    try {
      final results = await Future.wait([
        _firestore.collection('teachers').get(),
        _firestore.collection('groups').get(),
      ]);

      final teacherMaps = results[0].docs.map((e) => {'id': e.id, ...e.data()});
      final groupMaps = results[1].docs.map((e) => {'id': e.id, ...e.data()});

      final teachers = teacherMaps.map((e) => Teacher.fromJson(e)).toList();
      final groups = groupMaps.map((e) => Group.fromJson(e)).toList();

      final suggestions = [...teachers, ...groups];
      emit(SetupState.loaded(suggestions));
    } catch (e) {
      emit(SetupState.error(e.toString()));
    }
  }
}
