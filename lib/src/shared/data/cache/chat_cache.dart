import 'dart:convert';

import 'package:studtime/src/shared/data/cache/app_cache.dart';
import 'package:studtime/src/shared/data/models/chat/chat_message.dart';

class ChatCache extends AppCache<List<ChatMessage>> {
  ChatCache(super.prefs, super.key);

  @override
  Future<void> set(List<ChatMessage> value) async {
    final jsonMessages = value.map((e) => e.toJson()).toList();
    final strMessages = jsonMessages.map((e) => jsonEncode(e)).toList();
    await prefs.setStringList(key, strMessages);
  }

  @override
  List<ChatMessage> get() {
    final jsonMessages = prefs.getStringList(key) ?? [];
    final mapMessages = jsonMessages.map((e) => jsonDecode(e)).toList();
    final messages = mapMessages.map((e) => ChatMessage.fromJson(e)).toList();
    return messages;
  }

  Future<bool> add(ChatMessage message) async {
    try {
      final messages = get();
      messages.add(message);
      await set(messages);
      return true;
    } on Exception {
      return false;
    }
  }

  Future<bool> removeOne(ChatMessage message) async {
    try {
      final messages = get();
      messages.remove(message);
      await set(messages);
      return true;
    } on Exception {
      return false;
    }
  }

  Future<bool> edit(ChatMessage message) async {
    try {
      final messages = get();
      final index =
          messages.indexWhere((e) => e.createdAt == message.createdAt);
      messages[index] = message;
      await set(messages);

      return true;
    } on Exception {
      return false;
    }
  }
}
