import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studtime/src/shared/data/models/schedule/schedule.dart';
import 'package:studtime/src/shared/data/models/suggestion_item.dart';
import 'package:studtime/src/shared/data/models/way/way.dart';
import 'package:studtime/src/shared/extensions/on_doc_ref.dart';

part 'group.freezed.dart';
part 'group.g.dart';

typedef DocMapSnap = DocumentSnapshot<Map<String, dynamic>>;

@freezed
abstract class Group with _$Group implements SuggestionItem {
  const factory Group({
    required String id,
    required String name,
    required Way way,
  }) = _Group;

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  static Future<Group> fromDoc(DocumentSnapshot doc) async {
    try {
      final data = doc.data() as Map<String, dynamic>;
      final wayRef = data['way_ref'] as MapDocRef;
      final wayDoc = await wayRef.localFirstFetch();

      final group = Group(
        id: doc.id,
        name: data['name'] as String,
        way: await Way.fromDoc(wayDoc),
      );

      return group;
    } catch (e) {
      return Future.error('не удалось получить группу');
    }
  }
}
