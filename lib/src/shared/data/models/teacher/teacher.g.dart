// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Teacher _$$_TeacherFromJson(Map<String, dynamic> json) => _$_Teacher(
      id: json['id'] as int,
      name: json['name'] as String,
      grade: $enumDecode(_$GradeEnumMap, json['grade']),
    );

Map<String, dynamic> _$$_TeacherToJson(_$_Teacher instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'grade': _$GradeEnumMap[instance.grade]!,
    };

const _$GradeEnumMap = {
  Grade.professor: 'professor',
  Grade.docent: 'docent',
  Grade.teacher: 'teacher',
  Grade.srteacher: 'srteacher',
};
