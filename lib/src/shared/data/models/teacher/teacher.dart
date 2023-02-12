import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studtime/src/shared/data/models/suggestion_item.dart';

part 'teacher.freezed.dart';
part 'teacher.g.dart';

@freezed
abstract class Teacher with _$Teacher implements SuggestionItem {
  const factory Teacher({
    required String id,
    required String name,
  }) = _Teacher;

  factory Teacher.fromJson(Map<String, dynamic> json) =>
      _$TeacherFromJson(json);
}
