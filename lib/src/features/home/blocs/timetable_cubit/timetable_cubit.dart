import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studtime/src/features/auth/blocs/auth_cubit/auth_cubit.dart';
import 'package:studtime/src/shared/data/models/schedule/schedule.dart';
import 'package:studtime/src/shared/data/models/schedule/schedule_ref.dart';

part 'timetable_state.dart';
part 'timetable_cubit.freezed.dart';

class TimetableCubit extends Cubit<TimetableState> {
  final FirebaseFirestore _firestore;
  final AuthCubit _authCubit;

  late final StreamSubscription _authSub;

  TimetableCubit(
    this._firestore,
    this._authCubit,
  ) : super(const TimetableState.loading()) {
    _onAuthChanged(_authCubit.state);
    _authSub = _authCubit.stream.listen(_onAuthChanged);
  }

  @override
  Future<void> close() {
    _authSub.cancel();
    return super.close();
  }

  void _onAuthChanged(AuthState state) {
    state.maybeWhen(
      loggedIn: (user) async {
        emit(const TimetableState.loading());

        try {
          final timetablesSnap = await _firestore
              .collection('timetables')
              .where('group_ref', isEqualTo: user.groupRef)
              .get();

          final timetables = timetablesSnap.docs;
          final items = timetables.map((e) => ScheduleRef.fromDoc(e)).toList();

          final schedules =
              await Future.wait(items.map((e) => Schedule.fromRef(e)));

          emit(TimetableState.loaded(schedules));
        } on Exception catch (e) {
          emit(TimetableState.error(e.toString()));
        }
      },
      orElse: () {
        emit(const TimetableState.loading());
      },
    );
  }
}
