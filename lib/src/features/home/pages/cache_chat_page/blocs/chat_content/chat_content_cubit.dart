import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studtime/src/shared/data/cache/chat_cache.dart';
import 'package:studtime/src/shared/data/models/chat/chat_message.dart';
import 'package:studtime/src/shared/data/models/chat/chat_text.dart';

part 'chat_content_state.dart';
part 'chat_content_cubit.freezed.dart';

class ChatContentCubit extends Cubit<ChatContentState> {
  final ChatCache chatCache;
  final String subjectId;

  ChatContentCubit(this.chatCache, this.subjectId)
      : super(const ChatContentState.loading());

  void loadMessages() {
    try {
      final messages =
          chatCache.get().where((e) => e.subjectId == subjectId).toList();

      emit(ChatContentState.loaded(messages));
    } catch (e) {
      emit(ChatContentState.error(e.toString()));
      return;
    }
  }

  Future<void> addChatText(String text) async {
    try {
      await chatCache.add(
        ChatText(
          text,
          subjectId: subjectId,
          createdAt: DateTime.now(),
        ),
      );
      loadMessages();
    } on Exception catch (e) {
      Future.error(e);
    }
  }

  Future<void> deleteMessage(ChatMessage message) async {
    try {
      await chatCache.removeOne(message);
      loadMessages();
    } catch (e) {
      Future.error(e);
    }
  }

  Future<void> editMessage(ChatMessage message) async {
    try {
      await chatCache.edit(message);
      loadMessages();
    } catch (e) {
      Future.error(e);
    }
  }
}
