import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:open_filex/open_filex.dart';
import 'package:share_plus/share_plus.dart';
import 'package:studtime/src/features/home/pages/cache_chat_page/blocs/chat_content/chat_content_cubit.dart';
import 'package:studtime/src/shared/data/models/chat/chat_file.dart';
import 'package:studtime/src/shared/extensions/on_datetime.dart';
import 'package:studtime/src/shared/styles/app_paddings.dart';
import 'package:studtime/src/shared/widgets/app_file_size.dart';
import 'package:studtime/src/shared/widgets/dialogs/confirm_delete.dart';

class ChatFileItem extends StatelessWidget {
  const ChatFileItem({
    super.key,
    required this.chatFile,
  });

  final ChatFile chatFile;

  @override
  Widget build(BuildContext context) {
    final chatContentCubit = context.read<ChatContentCubit>();

    return CupertinoButton(
      padding: const EdgeInsets.all(0.0),
      onPressed: () => OpenFilex.open(chatFile.path),
      child: SwipeActionCell(
        key: ObjectKey(chatFile),
        trailingActions: <SwipeAction>[
          SwipeAction(
            onTap: (CompletionHandler handler) async {
              final isConfirmed = await confirmDelete(context);
              if (isConfirmed != true) return;

              chatContentCubit
                  .deleteMessage(chatFile)
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
                Icons.delete_outline,
                color: Colors.red,
              ),
            ),
            color: Colors.transparent,
          ),
          SwipeAction(
            onTap: (CompletionHandler handler) {
              Share.shareXFiles([XFile(chatFile.path)]);
            },
            widthSpace: 55.0,
            icon: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.orange[100],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const Icon(
                Icons.share_outlined,
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
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(12.0),
                  margin: const EdgeInsets.only(right: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Text(
                    chatFile.fileExtension,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chatFile.fileName,
                        maxLines: 10,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: AppFileSize(chatFile.path),
                          ),
                          Text(
                            chatFile.createdAt.toChatDateTime(),
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
