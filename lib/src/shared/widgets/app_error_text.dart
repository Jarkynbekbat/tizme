import 'package:flutter/material.dart';

class AppErrorText extends StatelessWidget {
  final String message;

  const AppErrorText({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: const TextStyle(
        color: Colors.red,
      ),
    );
  }
}
