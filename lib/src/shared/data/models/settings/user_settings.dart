import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_settings.freezed.dart';
part 'user_settings.g.dart';

enum UserSettingsType {
  @JsonValue('student')
  student,

  @JsonValue('teacher')
  teacher,
}

@freezed
class UserSettings with _$UserSettings {
  factory UserSettings({
    /// student - id группы, teacher - uid преподавателя
    required String id,
    required String name,
    required UserSettingsType type,
  }) = _UserSettings;

  factory UserSettings.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsFromJson(json);
}
