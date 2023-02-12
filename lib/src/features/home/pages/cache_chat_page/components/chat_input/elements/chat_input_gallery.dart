import 'package:flutter/material.dart';
import 'package:studtime/src/shared/styles/app_colors.dart';

class ChatInputGallery extends StatelessWidget {
  const ChatInputGallery({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.image_outlined,
        color: AppColors.primaryColor,
      ),
    );
  }
}
