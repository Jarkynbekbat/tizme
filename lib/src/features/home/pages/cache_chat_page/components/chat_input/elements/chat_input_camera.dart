import 'package:flutter/material.dart';
import 'package:studtime/src/shared/styles/app_colors.dart';

class ChatInputCamera extends StatelessWidget {
  const ChatInputCamera({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.camera_alt_outlined,
        color: AppColors.primaryColor,
      ),
    );
  }
}
