import 'package:flutter/material.dart';

Future<bool?> confirmCloseApp(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Закрыть'),
      content: const Text('Вы уверены, что хотите выйти?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('Да'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Нет'),
        ),
      ],
    ),
  );
}
