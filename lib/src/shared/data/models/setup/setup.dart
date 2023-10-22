import 'package:freezed_annotation/freezed_annotation.dart';

part 'setup.freezed.dart';
part 'setup.g.dart';

enum SetupType {
  @JsonValue('student')
  student,

  @JsonValue('teacher')
  teacher,
}

@freezed
class Setup with _$Setup {
  factory Setup({
    /// student - id группы,
    /// teacher - id преподавателя
    required int id,
    required String name,
    required SetupType type,
  }) = _Setup;

  factory Setup.fromJson(Map<String, dynamic> json) => _$SetupFromJson(json);
}
