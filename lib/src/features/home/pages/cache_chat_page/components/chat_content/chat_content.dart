import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
import 'package:studtime/src/features/home/pages/cache_chat_page/blocs/chat_content/chat_content_cubit.dart';
import 'package:studtime/src/features/home/pages/cache_chat_page/components/chat_content/elements/chat_content_empty_state.dart';
import 'package:studtime/src/features/home/pages/cache_chat_page/components/chat_content/elements/chat_image_item.dart';
import 'package:studtime/src/features/home/pages/cache_chat_page/components/chat_content/elements/chat_text_item.dart';
import 'package:studtime/src/shared/data/models/chat/chat_message.dart';
import 'package:studtime/src/shared/styles/app_paddings.dart';
import 'package:studtime/src/shared/widgets/app_error_text.dart';
import 'package:studtime/src/shared/widgets/app_loading.dart';

class ChatContent extends HookWidget {
  const ChatContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    return Expanded(
      child: Stack(
        fit: StackFit.expand,
        children: [
          /// сколл вниз если написали новое сообщение
          BlocListener<ChatContentCubit, ChatContentState>(
            listenWhen: (prev, curr) {
              return prev.maybeWhen<bool>(
                loaded: (prevMessages) {
                  return curr.maybeWhen<bool>(
                    loaded: (newMessages) {
                      return newMessages.length > prevMessages.length;
                    },
                    orElse: () => false,
                  );
                },
                orElse: () => false,
              );
            },
            listener: (context, state) async {
              await Future.delayed(const Duration(milliseconds: 100));
              scrollController.animateTo(
                scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeOut,
              );
            },
            child: const SizedBox.shrink(),
          ),

          /// сколл вниз если клавиатура открыта
          Consumer<ScreenHeight>(
            builder: (context, res, child) {
              if (res.isOpen) {
                if (scrollController.hasClients) {
                  scrollController.animateTo(
                    scrollController.position.maxScrollExtent,
                    duration: const Duration(milliseconds: 220),
                    curve: Curves.easeOut,
                  );
                }
              }
              return const SizedBox.shrink();
            },
          ),
          BlocBuilder<ChatContentCubit, ChatContentState>(
            builder: (context, state) {
              return state.map(
                loading: (_) => const AppLoading(),
                error: (message) => AppErrorText(message: message.message),
                loaded: (loaded) {
                  final messages = loaded.messages;
                  if (messages.isEmpty) return const ChatContentEmptyState();

                  return ListView.separated(
                    controller: scrollController,
                    padding: const EdgeInsets.symmetric(
                      vertical: AppPadding.defaultPadding,
                    ),
                    itemCount: messages.length,
                    separatorBuilder: (_, __) => const SizedBox(
                      height: AppPadding.defaultPaddingHalf,
                    ),
                    itemBuilder: (context, index) {
                      final message = messages[index];

                      return message.map(
                        text: (textMessage) {
                          return ChatTextItem(message: textMessage);
                        },
                        image: (chatImage) {
                          return ChatImageItem(chatImage: chatImage);
                        },
                      );
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
