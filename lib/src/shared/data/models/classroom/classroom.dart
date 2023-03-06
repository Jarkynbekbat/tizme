import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'classroom.freezed.dart';
part 'classroom.g.dart';

@freezed
class Classroom with _$Classroom {
  const factory Classroom({
    required String id,
    required String name,
  }) = _Classroom;

  factory Classroom.fromJson(Map<String, dynamic> json) =>
      _$ClassroomFromJson(json);

  factory Classroom.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    try {
      final model = Classroom.fromJson({'id': doc.id, ...doc.data()!});
      return model;
    } on Exception {
      throw Exception('не удалось получить аудиторию');
    }
  }
}
