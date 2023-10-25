import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studtime/src/shared/data/models/suggestion_item.dart';

part 'teacher.freezed.dart';
part 'teacher.g.dart';

@freezed
class Teacher extends SuggestionItem with _$Teacher {
  const factory Teacher({
    required int id,
    required String name,
    required Grade grade,
  }) = _Teacher;

  factory Teacher.fromJson(Map<String, dynamic> json) =>
      _$TeacherFromJson(json);
}

enum Grade { professor, docent, teacher, srteacher }
