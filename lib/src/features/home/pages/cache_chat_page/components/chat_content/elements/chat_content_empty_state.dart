import 'package:flutter/material.dart';

class ChatContentEmptyState extends StatelessWidget {
  const ChatContentEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.chat_bubble_outline,
            color: Colors.grey[300],
          ),
          const SizedBox(height: 8.0),
          Text(
            "Нет записей",
            style: TextStyle(
              color: Colors.grey[300],
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
