import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studtime/src/shared/data/cache/user_cache.dart';
import 'package:studtime/src/shared/data/models/student/student.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseFirestore _firestore;
  final UserCache _userCache;

  AuthCubit(
    this._firestore,
    this._userCache,
  ) : super(const AuthState.initialization());

  /// инициализация начального состояния
  void init() async {
    final student = _userCache.get();
    if (student != null) {
      emit(AuthState.loggedIn(student));
    } else {
      emit(const AuthState.loggedOut());
    }
  }

  /// авторизация пользователя по шифру из AVN
  Future<void> loginWithCypher(String cypher) async {
    emit(const AuthState.loading());
    try {
      final student = await _firestore
          .collection('students')
          .where('cypher', isEqualTo: cypher)
          .get();

      if (student.docs.isEmpty) {
        emit(const AuthState.error('Student not found'));
        return;
      }

      final studentData = student.docs.first.data();
      final studentModel = Student.fromJson(studentData);

      /// сохраняем данные пользователя в кэше
      _userCache.set(studentModel);

      emit(AuthState.loggedIn(studentModel));
    } catch (e) {
      emit(const AuthState.error('Something went wrong'));
    }
  }

  Future<void> logout() async {
    emit(const AuthState.loading());
    try {
      /// удаляем данные пользователя из кэша
      _userCache.remove();

      emit(const AuthState.loggedOut());
    } catch (e) {
      emit(const AuthState.error('Something went wrong'));
    }
  }
}
