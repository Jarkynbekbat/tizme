// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Department _$$_DepartmentFromJson(Map<String, dynamic> json) =>
    _$_Department(
      id: json['id'] as String,
      name: json['name'] as String,
      faculty: Faculty.fromJson(json['faculty'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DepartmentToJson(_$_Department instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'faculty': instance.faculty,
    };
