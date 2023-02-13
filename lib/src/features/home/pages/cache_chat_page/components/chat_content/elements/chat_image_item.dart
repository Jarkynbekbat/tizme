import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:studtime/src/features/home/pages/cache_chat_page/blocs/chat_content/chat_content_cubit.dart';
import 'package:studtime/src/shared/data/models/chat/chat_image.dart';
import 'package:studtime/src/shared/extensions/on_datetime.dart';
import 'package:studtime/src/shared/styles/app_paddings.dart';

class ChatImageItem extends StatelessWidget {
  const ChatImageItem({
    super.key,
    required this.chatImage,
  });

  final ChatImage chatImage;

  @override
  Widget build(BuildContext context) {
    return SwipeActionCell(
      key: ObjectKey(chatImage),
      trailingActions: <SwipeAction>[
        SwipeAction(
          onTap: (CompletionHandler handler) {
            context
                .read<ChatContentCubit>()
                .deleteMessage(chatImage)
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
              Icons.delete,
              color: Colors.red,
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
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.6,
                  maxHeight: MediaQuery.of(context).size.height * 0.4,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.file(
                    File(chatImage.path),
                    frameBuilder:
                        (context, child, frame, wasSynchronouslyLoaded) {
                      if (wasSynchronouslyLoaded) {
                        return child;
                      }
                      return AnimatedOpacity(
                        opacity: frame == null ? 0 : 1,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeOut,
                        child: child,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                chatImage.createdAt.toChatDateTime(),
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
