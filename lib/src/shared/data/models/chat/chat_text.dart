import 'package:studtime/src/shared/data/models/chat/chat_message.dart';

class ChatText extends ChatMessage {
  final String text;

  const ChatText(
    this.text, {
    required super.createdAt,
    required super.subjectId,
  });

  static ChatText fromJson(Map<String, dynamic> json) {
    return ChatText(
      json['text'] as String,
      createdAt: DateTime.parse(json['created_at']),
      subjectId: json['subject_id'] as int,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'created_at': createdAt.toString(),
      'subject_id': subjectId,
      'type': 'text',
    };
  }

  @override
  List<Object?> get props => [text, createdAt];

  ChatText copyWith({
    String? text,
    DateTime? createdAt,
    int? subjectId,
  }) {
    return ChatText(
      text ?? this.text,
      createdAt: createdAt ?? this.createdAt,
      subjectId: subjectId ?? this.subjectId,
    );
  }
}
