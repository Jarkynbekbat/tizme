import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:studtime/src/features/home/pages/cache_chat_page/blocs/chat_content/chat_content_cubit.dart';
import 'package:studtime/src/features/home/pages/cache_chat_page/blocs/edit_message_cubit/edit_message_cubit.dart';
import 'package:studtime/src/shared/data/models/chat/chat_text.dart';
import 'package:studtime/src/shared/extensions/on_datetime.dart';
import 'package:studtime/src/shared/styles/app_paddings.dart';

class ChatTextItem extends StatelessWidget {
  const ChatTextItem({
    super.key,
    required this.message,
  });

  final ChatText message;

  @override
  Widget build(BuildContext context) {
    return SwipeActionCell(
      key: ObjectKey(message),
      trailingActions: <SwipeAction>[
        SwipeAction(
          onTap: (CompletionHandler handler) {
            context
                .read<ChatContentCubit>()
                .deleteMessage(message)
                .then((value) => handler(true))
                .onError(
              (error, __) {
                EasyLoading.showError(error.toString());
                handler(false);
              },
            );
          },
          widthSpace: 70.0,
          icon: Container(
            padding: const EdgeInsets.all(12.0),
            margin: const EdgeInsets.only(
              right: AppPadding.defaultPadding,
            ),
            decoration: BoxDecoration(
              color: Colors.red[100],
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: const Icon(
              Icons.delete_outlined,
              color: Colors.red,
            ),
          ),
          color: Colors.transparent,
        ),
        SwipeAction(
          widthSpace: 55.0,
          onTap: (CompletionHandler handler) async {
            context.read<EditMessageCubit>().select(message);
            handler(false);
          },
          icon: Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.orange[100],
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: const Icon(
              Icons.edit_outlined,
              color: Colors.orange,
            ),
          ),
          color: Colors.transparent,
        ),
      ],
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          margin: const EdgeInsets.only(
            left: AppPadding.defaultPadding,
            right: AppPadding.defaultPadding,
          ),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(message.text),
              Text(
                message.createdAt.toChatDateTime(),
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
