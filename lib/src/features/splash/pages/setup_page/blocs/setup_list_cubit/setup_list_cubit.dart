import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studtime/src/shared/data/models/suggestion_item.dart';
import 'package:studtime/src/shared/data/models/group/group.dart';
import 'package:studtime/src/shared/data/models/teacher/teacher.dart';

part 'setup_list_state.dart';
part 'setup_list_cubit.freezed.dart';

/// кубит для загрузки данных для страницы настройки
class SetupListCubit extends Cubit<SetupListState> {
  final FirebaseFirestore _firestore;

  SetupListCubit(this._firestore) : super(const SetupListState.loading());

  Future<void> load() async {
    emit(const SetupListState.loading());
    try {
      final results = await Future.wait([
        _firestore.collection('teachers').get(),
        _firestore.collection('groups').get(),
      ]);

      final groupDocs = results[1].docs;
      final teacherDocs = results[0].docs;

      final groupFutures = groupDocs.map((e) => Group.fromDoc(e));
      final teacherFutures = teacherDocs.map((e) => Teacher.fromDoc(e));

      final suggestions = await Future.wait([
        ...groupFutures,
        ...teacherFutures,
      ]);

      emit(SetupListState.loaded(suggestions));
    } catch (e) {
      emit(SetupListState.error(e.toString()));
      rethrow;
    }
  }
}
