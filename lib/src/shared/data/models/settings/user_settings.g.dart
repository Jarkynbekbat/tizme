// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserSettings _$$_UserSettingsFromJson(Map<String, dynamic> json) =>
    _$_UserSettings(
      id: json['id'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$UserSettingsTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$_UserSettingsToJson(_$_UserSettings instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$UserSettingsTypeEnumMap[instance.type]!,
    };

const _$UserSettingsTypeEnumMap = {
  UserSettingsType.student: 'student',
  UserSettingsType.teacher: 'teacher',
};
