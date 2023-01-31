import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studtime/src/shared/data/models/student/student.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseFirestore _firestore;

  AuthCubit(this._firestore) : super(const AuthState.initial());

  Future<void> login(String cypher) async {
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

      emit(AuthState.loggedIn(studentModel));
    } catch (e) {
      emit(const AuthState.error('Something went wrong'));
    }
  }
}
