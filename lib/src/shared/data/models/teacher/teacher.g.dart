// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Teacher _$$_TeacherFromJson(Map<String, dynamic> json) => _$_Teacher(
      id: json['id'] as String,
      name: json['name'] as String,
      grade: Grade.fromJson(json['grade'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TeacherToJson(_$_Teacher instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'grade': instance.grade,
    };
