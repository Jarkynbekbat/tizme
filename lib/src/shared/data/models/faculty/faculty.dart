import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'faculty.freezed.dart';
part 'faculty.g.dart';

@freezed
class Faculty with _$Faculty {
  const factory Faculty({
    required String id,
    required String name,
  }) = _Faculty;

  factory Faculty.fromJson(Map<String, dynamic> json) =>
      _$FacultyFromJson(json);

  factory Faculty.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    try {
      final model = Faculty.fromJson({'id': doc.id, ...doc.data()!});
      return model;
    } on Exception {
      throw Exception('не удалось получить факультет');
    }
  }
}
