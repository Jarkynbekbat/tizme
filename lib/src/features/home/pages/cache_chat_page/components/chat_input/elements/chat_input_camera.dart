import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studtime/src/features/home/pages/cache_chat_page/blocs/chat_content/chat_content_cubit.dart';
import 'package:studtime/src/shared/styles/app_colors.dart';

class ChatInputCamera extends StatelessWidget {
  const ChatInputCamera({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final contentCubit = context.read<ChatContentCubit>();

    return IconButton(
      onPressed: () async {
        final picker = ImagePicker();
        final photo = await picker.pickImage(source: ImageSource.camera);

        if (photo != null) {
          contentCubit.addChatImage(photo.path);
        }
      },
      icon: Icon(
        Icons.camera_alt_outlined,
        color: AppColors.primaryColor,
      ),
    );
  }
}
