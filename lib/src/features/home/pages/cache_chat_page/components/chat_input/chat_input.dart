import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:studtime/src/features/home/pages/cache_chat_page/blocs/chat_content/chat_content_cubit.dart';
import 'package:studtime/src/features/home/pages/cache_chat_page/blocs/chat_input_cubit/chat_input_cubit.dart';
import 'package:studtime/src/features/home/pages/cache_chat_page/blocs/edit_message_cubit/edit_message_cubit.dart';
import 'package:studtime/src/features/home/pages/cache_chat_page/components/chat_input/elements/chat_input_camera.dart';
import 'package:studtime/src/features/home/pages/cache_chat_page/components/chat_input/elements/chat_input_container.dart';
import 'package:studtime/src/features/home/pages/cache_chat_page/components/chat_input/elements/chat_input_editing_field.dart';
import 'package:studtime/src/features/home/pages/cache_chat_page/components/chat_input/elements/chat_input_gallery.dart';
import 'package:studtime/src/features/home/pages/cache_chat_page/components/chat_input/elements/chat_send.dart';
import 'package:studtime/src/features/home/pages/cache_chat_page/components/chat_input/elements/chat_textfield.dart';
import 'package:studtime/src/shared/extensions/on_widget.dart';

class ChatInput extends HookWidget {
  const ChatInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final contentCubit = context.read<ChatContentCubit>();
    final inputCubit = context.read<ChatInputCubit>();
    final editCubit = context.read<EditMessageCubit>();

    return Column(
      children: [
        const ChatInputEditingField(),
        ChatInputContainer(
          child: Row(
            children: [
              Expanded(
                child: ChatTextfield(
                  textController: inputCubit.textController,
                  focusNode: inputCubit.focusNode,
                ),
              ),
              BlocBuilder<ChatInputCubit, ChatInputState>(
                builder: (context, inputState) {
                  return inputState.map<Widget>(
                    send: (sendState) {
                      return ChatSend(
                        onPressed: () {
                          editCubit.state.maybeMap(
                            selected: (selectedState) {
                              contentCubit.editMessage(
                                selectedState.textMessage.copyWith(
                                  text: sendState.text,
                                ),
                              );
                            },
                            orElse: () {
                              contentCubit.addChatText(sendState.text);
                            },
                          );
                        },
                      );
                    },
                    sendDisabled: (_) {
                      return const ChatSend();
                    },
                    attachActions: (_) {
                      return Row(
                        children: [
                          const ChatInputCamera().dev(),
                          const ChatInputGallery().dev(),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
