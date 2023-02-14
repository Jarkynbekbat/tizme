import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studtime/src/features/home/pages/cache_chat_page/blocs/chat_content/chat_content_cubit.dart';
import 'package:studtime/src/shared/styles/app_colors.dart';

class ChatInputFile extends StatelessWidget {
  const ChatInputFile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final contentCubit = context.read<ChatContentCubit>();

    return IconButton(
      onPressed: () async {
        final result = await FilePicker.platform.pickFiles();

        if (result != null) {
          if (result.files.single.path != null) {
            final file = File(result.files.single.path!);
            contentCubit.addChatFile(file.path);
          }
        }
      },
      icon: const Icon(
        Icons.attach_file,
        color: AppColors.primaryColor,
      ),
    );
  }
}
