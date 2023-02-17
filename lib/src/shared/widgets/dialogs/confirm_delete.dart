import 'package:flutter/material.dart';

Future<bool?> confirmDelete(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Удаление'),
      content: const Text('Вы уверены, что хотите удалить ?'),
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
