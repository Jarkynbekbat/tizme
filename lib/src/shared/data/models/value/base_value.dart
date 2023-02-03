import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_value.freezed.dart';
part 'base_value.g.dart';

@freezed
abstract class BaseValue with _$BaseValue {
  const factory BaseValue({
    required String id,
    required String name,
  }) = _BaseValue;

  factory BaseValue.fromJson(Map<String, dynamic> json) =>
      _$BaseValueFromJson(json);
}
