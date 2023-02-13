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
    return TextField(
      controller: textController,
      focusNode: focusNode,
      keyboardType: TextInputType.multiline,
      maxLines: 5,
      minLines: 1,
      decoration: const InputDecoration(
        hintText: 'Введите заметку',
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: Colors.black12,
        ),
      ),
    );
  }
}
