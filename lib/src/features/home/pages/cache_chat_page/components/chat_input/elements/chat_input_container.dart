import 'package:flutter/material.dart';
import 'package:studtime/src/shared/styles/app_paddings.dart';

class ChatInputContainer extends StatelessWidget {
  final Widget child;
  const ChatInputContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.defaultPadding,
        vertical: AppPadding.defaultPaddingHalf,
      ),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.01),
            blurRadius: 20,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: child,
    );
  }
}
