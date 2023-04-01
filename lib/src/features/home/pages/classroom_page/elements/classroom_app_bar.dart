import 'package:flutter/material.dart';

import '../../../../../shared/data/models/classroom/classroom.dart';

class ClassroomAppBar extends StatelessWidget with PreferredSizeWidget {
  final Classroom classroom;
  const ClassroomAppBar({
    super.key,
    required this.classroom,
  });

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: AppBar(
        centerTitle: true,
        title: Text('Аудитория ${classroom.name}'),
      ),
    );
  }
}
