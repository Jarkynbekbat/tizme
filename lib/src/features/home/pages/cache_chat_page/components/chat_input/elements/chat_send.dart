import 'package:flutter/material.dart';
import 'package:studtime/src/shared/styles/app_colors.dart';

class ChatSend extends StatelessWidget {
  const ChatSend({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: onPressed == null ? 0.33 : 1,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          Icons.send,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
