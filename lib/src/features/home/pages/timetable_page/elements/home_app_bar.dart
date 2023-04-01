import 'package:flutter/material.dart';
import 'package:studtime/src/features/home/pages/timetable_page/elements/scan_q_r.dart';

import 'home_current_target.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({
    super.key,
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
        actions: const [ScanQR()],
        title: const HomeCurrentTarget(),
      ),
    );
  }
}
