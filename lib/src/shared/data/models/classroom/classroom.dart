import 'package:freezed_annotation/freezed_annotation.dart';

part 'classroom.freezed.dart';
part 'classroom.g.dart';

@freezed
class Classroom with _$Classroom {
  factory Classroom({
    required String id,
    required String name,
  }) = _Classroom;

  factory Classroom.fromJson(Map<String, dynamic> json) =>
      _$ClassroomFromJson(json);
}
