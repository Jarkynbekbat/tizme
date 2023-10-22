// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Department _$$_DepartmentFromJson(Map<String, dynamic> json) =>
    _$_Department(
      id: json['id'] as int,
      name: json['name'] as String,
      facultyId: json['faculty_id'] as int,
    );

Map<String, dynamic> _$$_DepartmentToJson(_$_Department instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'faculty_id': instance.facultyId,
    };
