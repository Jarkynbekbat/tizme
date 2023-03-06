import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studtime/src/shared/data/models/schedule/schedule.dart';
import 'package:studtime/src/shared/data/models/way/way.dart';
import 'package:studtime/src/shared/extensions/on_doc_ref.dart';

part 'subject.freezed.dart';
part 'subject.g.dart';

typedef DocMapSnap = DocumentSnapshot<Map<String, dynamic>>;

@freezed
abstract class Subject with _$Subject {
  const factory Subject({
    required String id,
    required String name,
    required Way way,
  }) = _Subject;

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);

  static Future<Subject> fromDoc(DocumentSnapshot doc) async {
    try {
      final data = doc.data() as Map<String, dynamic>;
      final wayRef = data['way_ref'] as MapDocRef;
      final wayDoc = await wayRef.localFirstFetch();

      return Subject(
        id: doc.id,
        name: data['name'] as String,
        way: await Way.fromDoc(wayDoc),
      );
    } catch (e) {
      return Future.error('не удалось получить предмет');
    }
  }
}
