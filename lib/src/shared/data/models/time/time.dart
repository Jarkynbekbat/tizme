import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'time.freezed.dart';
part 'time.g.dart';

@freezed
class Time with _$Time {
  const factory Time({
    required String id,
    required String from,
    required String to,
    required int order,
  }) = _Time;

  factory Time.fromJson(Map<String, dynamic> json) => _$TimeFromJson(json);

  factory Time.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    try {
      final model = Time.fromJson({'id': doc.id, ...doc.data()!});
      return model;
    } on Exception {
      throw Exception('не удалось получить время');
    }
  }
}
