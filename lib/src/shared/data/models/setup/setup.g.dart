// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Setup _$$_SetupFromJson(Map<String, dynamic> json) => _$_Setup(
      id: json['id'] as int,
      name: json['name'] as String,
      type: $enumDecode(_$SetupTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$_SetupToJson(_$_Setup instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$SetupTypeEnumMap[instance.type]!,
    };

const _$SetupTypeEnumMap = {
  SetupType.student: 'student',
  SetupType.teacher: 'teacher',
};
