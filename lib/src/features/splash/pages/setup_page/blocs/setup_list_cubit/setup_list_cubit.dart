import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studtime/src/shared/data/models/suggestion_item.dart';
import 'package:studtime/src/shared/data/models/group/group.dart';
import 'package:studtime/src/shared/data/models/teacher/teacher.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'setup_list_state.dart';
part 'setup_list_cubit.freezed.dart';

/// кубит для загрузки данных для страницы настройки
class SetupListCubit extends Cubit<SetupListState> {
  final SupabaseClient _supabase;

  SetupListCubit(this._supabase) : super(const SetupListState.loading());

  Future<void> load() async {
    emit(const SetupListState.loading());
    try {
      final results = await Future.wait([
        _supabase.from('teachers').select<List<Map<String, dynamic>>>(),
        _supabase.from('groups').select<List<Map<String, dynamic>>>(),
      ]);

      final groupDocs = results[1];
      final teacherDocs = results[0];

      final groupFutures = groupDocs.map((e) => Group.fromJson(e));
      final teacherFutures = teacherDocs.map((e) => Teacher.fromJson(e));
      final suggestions = [...groupFutures, ...teacherFutures];

      emit(SetupListState.loaded(suggestions));
    } catch (e) {
      emit(SetupListState.error(e.toString()));
      rethrow;
    }
  }
}
