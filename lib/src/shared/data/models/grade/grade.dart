import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'grade.freezed.dart';
part 'grade.g.dart';

@freezed
class Grade with _$Grade {
  const factory Grade({
    required String id,
    required String name,
  }) = _Grade;

  factory Grade.fromJson(Map<String, dynamic> json) => _$GradeFromJson(json);

  factory Grade.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    try {
      final model = Grade.fromJson({'id': doc.id, ...doc.data()!});
      return model;
    } on Exception {
      return Grade.error();
    }
  }

  factory Grade.error() => const Grade(
        id: '',
        name: 'ошибка[класс]',
      );
}
