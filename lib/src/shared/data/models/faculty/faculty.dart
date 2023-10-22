import 'package:freezed_annotation/freezed_annotation.dart';

part 'faculty.freezed.dart';
part 'faculty.g.dart';

@freezed
class Faculty with _$Faculty {
  const factory Faculty({
    required int id,
    required String name,
  }) = _Faculty;

  factory Faculty.fromJson(Map<String, dynamic> json) =>
      _$FacultyFromJson(json);
}
