import 'package:studtime/src/shared/data/models/chat/chat_message.dart';

class ChatImage extends ChatMessage {
  final String path;

  const ChatImage(
    this.path, {
    required super.createdAt,
    required super.subjectId,
  });

  static ChatImage fromJson(Map<String, dynamic> json) {
    return ChatImage(
      json['path'] as String,
      createdAt: DateTime.parse(json['created_at']),
      subjectId: json['subject_id'] as int,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'path': path,
      'created_at': createdAt.toString(),
      'subject_id': subjectId,
      'type': 'image',
    };
  }

  @override
  List<Object?> get props => [path, createdAt];

  ChatImage copyWith({
    String? path,
    DateTime? createdAt,
    int? subjectId,
  }) {
    return ChatImage(
      path ?? this.path,
      createdAt: createdAt ?? this.createdAt,
      subjectId: subjectId ?? this.subjectId,
    );
  }
}
