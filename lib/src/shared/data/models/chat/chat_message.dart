import 'package:equatable/equatable.dart';
import 'package:studtime/src/shared/data/models/chat/chat_image.dart';
import 'package:studtime/src/shared/data/models/chat/chat_text.dart';

/// базовый класс для сообщений в экране элемента расписания
abstract class ChatMessage extends Equatable {
  /// дата и время создания сообщения
  final DateTime createdAt;

  /// id дисциплины, к которой относится сообщение
  final String subjectId;

  const ChatMessage({
    required this.createdAt,
    required this.subjectId,
  });

  /// преобразует сообщение в json
  Map<String, dynamic> toJson();

  /// преобразует json в сообщение
  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    final type = json['type'] as String;

    switch (type) {
      case 'text':
        return ChatText.fromJson(json);
      case 'image':
        return ChatImage.fromJson(json);
      default:
        throw Exception('Unknown message type: $type');
    }
  }
}

extension ChatMessageX on ChatMessage {
  T map<T>({
    required T Function(ChatText) text,
    required T Function(ChatImage) image,
  }) {
    if (this is ChatText) {
      return text(this as ChatText);
    }

    if (this is ChatImage) {
      return image(this as ChatImage);
    } else {
      throw Exception('Unknown message type: $this');
    }
  }
}
