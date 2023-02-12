import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studtime/src/features/home/pages/cache_chat_page/blocs/edit_message_cubit/edit_message_cubit.dart';
import 'package:studtime/src/shared/styles/app_colors.dart';

class ChatInputEditingField extends StatelessWidget {
  const ChatInputEditingField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
      child: BlocBuilder<EditMessageCubit, EditMessageState>(
        builder: (context, state) {
          return state.map(
            notSelected: (_) => const SizedBox.shrink(),
            selected: (state) {
              final chatText = state.textMessage;
              return Container(
                color: AppColors.primaryColor.withOpacity(0.35),
                child: ListTile(
                  leading: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  title: Text(
                    chatText.text,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      context.read<EditMessageCubit>().unselect();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
