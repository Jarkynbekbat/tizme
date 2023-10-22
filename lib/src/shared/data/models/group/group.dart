import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studtime/src/shared/data/models/suggestion_item.dart';

part 'group.freezed.dart';
part 'group.g.dart';

@freezed
abstract class Group extends SuggestionItem with _$Group {
  const factory Group({
    required int id,
    required String name,
    required int wayId,
  }) = _Group;

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
}
