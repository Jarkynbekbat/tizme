import 'package:freezed_annotation/freezed_annotation.dart';

part 'way.freezed.dart';
part 'way.g.dart';

@freezed
abstract class Way with _$Way {
  const factory Way({
    required int id,
    required String name,
    required int facultyId,
  }) = _Way;

  factory Way.fromJson(Map<String, dynamic> json) => _$WayFromJson(json);
}
