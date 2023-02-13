import 'package:flutter/material.dart';

class AppDrawerMenuItem extends StatelessWidget {
  final void Function()? onTap;
  final Widget? leading;
  final String title;

  final bool isLast;

  const AppDrawerMenuItem({
    super.key,
    this.onTap,
    this.leading,
    required this.title,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey.withOpacity(0.33),
            width: 0.5,
          ),
          bottom: isLast
              ? BorderSide(
                  color: Colors.grey.withOpacity(0.33),
                  width: 0.5,
                )
              : BorderSide.none,
        ),
      ),
      child: ListTile(
        onTap: onTap,
        leading: leading,
        title: Text(title),
      ),
    );
  }
}
