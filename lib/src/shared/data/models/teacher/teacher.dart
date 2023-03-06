import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studtime/src/shared/data/models/grade/grade.dart';
import 'package:studtime/src/shared/data/models/schedule/schedule.dart';
import 'package:studtime/src/shared/data/models/suggestion_item.dart';
import 'package:studtime/src/shared/extensions/on_doc_ref.dart';

part 'teacher.freezed.dart';
part 'teacher.g.dart';

@freezed
class Teacher with _$Teacher implements SuggestionItem {
  const factory Teacher({
    required String id,
    required String name,
    required Grade grade,
  }) = _Teacher;

  factory Teacher.fromJson(Map<String, dynamic> json) =>
      _$TeacherFromJson(json);

  static Future<Teacher> fromDoc(
      DocumentSnapshot<Map<String, dynamic>> doc) async {
    try {
      final data = doc.data() as Map<String, dynamic>;

      final gradeRef = data['grade_ref'] as MapDocRef;
      final gradeDoc = await gradeRef.localFirstFetch();

      return Teacher(
        id: doc.id,
        name: data['name'] as String,
        grade: Grade.fromDoc(gradeDoc),
      );
    } catch (e) {
      return Future.error('не удалось получить учителя');
    }
  }
}
