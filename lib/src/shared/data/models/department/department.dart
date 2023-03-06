import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studtime/src/shared/data/models/faculty/faculty.dart';
import 'package:studtime/src/shared/data/models/schedule/schedule.dart';
import 'package:studtime/src/shared/extensions/on_doc_ref.dart';

part 'department.freezed.dart';
part 'department.g.dart';

typedef DocMapSnap = DocumentSnapshot<Map<String, dynamic>>;

@freezed
abstract class Department with _$Department {
  const factory Department({
    required String id,
    required String name,
    required Faculty faculty,
  }) = _Department;

  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);

  static Future<Department> fromDoc(DocumentSnapshot doc) async {
    try {
      final data = doc.data() as Map<String, dynamic>;

      final facultyRef = data['faculty_ref'] as MapDocRef;
      final facultyDoc = await facultyRef.localFirstFetch();

      return Department(
        id: doc.id,
        name: data['name'] as String,
        faculty: Faculty.fromDoc(facultyDoc),
      );
    } catch (e) {
      return Future.error('не удалось получить кафедру');
    }
  }
}
