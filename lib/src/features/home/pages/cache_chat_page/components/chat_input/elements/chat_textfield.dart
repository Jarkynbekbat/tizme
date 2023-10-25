import 'package:flutter/material.dart';

class ChatTextfield extends StatelessWidget {
  const ChatTextfield({
    super.key,
    required this.textController,
    required this.focusNode,
  });

  final TextEditingController textController;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return TextField(
      controller: textController,
      focusNode: focusNode,
      keyboardType: TextInputType.multiline,
      maxLines: 5,
      minLines: 1,
      decoration: InputDecoration(
        hintText: 'Введите заметку',
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: colorScheme.onSurface.withOpacity(0.6),
        ),
      ),
    );
  }
}
