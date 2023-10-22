import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:studtime/src/shared/data/cache/app_cache.dart';
import 'package:studtime/src/shared/data/models/chat/chat_message.dart';
import 'package:studtime/src/shared/extensions/on_string.dart';
import 'package:uuid/uuid.dart';

class ChatCache extends AppCache<List<ChatMessage>> {
  ChatCache(
    super.prefs,
    super.key,
  );

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
      await message.map(
        text: (textMessage) async {
          final messages = get();
          messages.add(message);
          await set(messages);
        },

        /// если сообщение хранит файл, то копируем его в папку для файлов приложения
        image: (imageMessage) async {
          /// получаем путь к файлу и его имя
          final tempFile = File(imageMessage.path);
          final imageName = imageMessage.path.split('/').last;

          /// копируем файл в папку приложения
          final directory = await getApplicationDocumentsDirectory();
          final path = directory.path;

          final uuid = const Uuid().v1().toValidPath;
          final newFilePath = '$path/$uuid$imageName';
          await tempFile.copy(newFilePath);

          /// создаем новое сообщение с новым путем к файлу
          final messages = get();
          messages.add(imageMessage.copyWith(path: newFilePath));
          await set(messages);

          /// удаляем старый файл из временного хранилища
          await tempFile.delete();
        },
        file: (fileMessage) async {
          /// получаем путь к файлу и его имя
          final tempFile = File(fileMessage.path);
          final imageName = fileMessage.path.split('/').last;

          /// копируем файл в папку приложения
          final directory = await getApplicationDocumentsDirectory();
          final path = directory.path;
          final uuid = const Uuid().v1().toValidPath;
          final newFilePath = '$path/$uuid$imageName';
          await tempFile.copy(newFilePath);

          /// создаем новое сообщение с новым путем к файлу
          final messages = get();
          messages.add(fileMessage.copyWith(path: newFilePath));
          await set(messages);
        },
      );

      return true;
    } on Exception {
      return false;
    }
  }

  Future<bool> removeOne(ChatMessage message) async {
    try {
      await message.map(
        text: (textMessage) {},

        /// если сообщение хранит файл, то удаляем и файл
        image: (imageMessage) async {
          final path = imageMessage.path;
          final file = File(path);
          await file.delete();
        },
        file: (fileMessage) async {
          final path = fileMessage.path;
          final file = File(path);
          await file.delete();
        },
      );

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
