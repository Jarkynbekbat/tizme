import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studtime/src/shared/data/models/suggestion_item.dart';

part 'group.freezed.dart';
part 'group.g.dart';

@freezed
class Group with _$Group implements SuggestionItem {
  const factory Group({
    required String id,
    required String name,
  }) = _Group;

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
}
