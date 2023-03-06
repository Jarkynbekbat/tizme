import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studtime/src/shared/data/models/department/department.dart';
import 'package:studtime/src/shared/data/models/schedule/schedule.dart';
import 'package:studtime/src/shared/extensions/on_doc_ref.dart';

part 'way.freezed.dart';
part 'way.g.dart';

typedef DocMapSnap = DocumentSnapshot<Map<String, dynamic>>;

@freezed
abstract class Way with _$Way {
  const factory Way({
    required String id,
    required String name,
    required Department department,
  }) = _Way;

  factory Way.fromJson(Map<String, dynamic> json) => _$WayFromJson(json);

  static Future<Way> fromDoc(DocumentSnapshot doc) async {
    try {
      final data = doc.data() as Map<String, dynamic>;
      final departmentRef = data['department_ref'] as MapDocRef;
      final departmentDoc = await departmentRef.localFirstFetch();

      return Way(
        id: doc.id,
        name: data['name'] as String,
        department: await Department.fromDoc(departmentDoc),
      );
    } catch (e) {
      return Future.error('не удалось получить специальность');
    }
  }
}
