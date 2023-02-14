import 'package:studtime/src/shared/data/models/chat/chat_message.dart';

class ChatFile extends ChatMessage {
  final String path;

  const ChatFile(
    this.path, {
    required super.createdAt,
    required super.subjectId,
  });

  String get fileName => path.split('/').last;
  String get fileExtension => fileName.split('.').last.toUpperCase();

  static ChatFile fromJson(Map<String, dynamic> json) {
    return ChatFile(
      json['path'] as String,
      createdAt: DateTime.parse(json['created_at']),
      subjectId: json['subject_id'] as String,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'path': path,
      'created_at': createdAt.toString(),
      'subject_id': subjectId,
      'type': 'file',
    };
  }

  @override
  List<Object?> get props => [path, createdAt];

  ChatFile copyWith({
    String? path,
    DateTime? createdAt,
    String? subjectId,
  }) {
    return ChatFile(
      path ?? this.path,
      createdAt: createdAt ?? this.createdAt,
      subjectId: subjectId ?? this.subjectId,
    );
  }
}
