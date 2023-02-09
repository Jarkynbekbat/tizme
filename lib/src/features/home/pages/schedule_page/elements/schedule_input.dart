import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studtime/src/features/home/pages/schedule_page/blocs/is_typing_cubit.dart';
import 'package:studtime/src/shared/styles/app_colors.dart';
import 'package:studtime/src/shared/styles/app_paddings.dart';

class ScheduleInput extends StatelessWidget {
  const ScheduleInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.defaultPadding,
        vertical: AppPadding.defaultPaddingHalf,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.01),
            blurRadius: 20,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              minLines: 1,
              autofocus: true,
              onChanged: (value) {
                context.read<IsTypingCubit>().set(value.isNotEmpty);
              },
              decoration: const InputDecoration(
                hintText: 'Введите заметку',
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: Colors.black12,
                ),
              ),
            ),
          ),
          BlocBuilder<IsTypingCubit, bool>(
            builder: (context, isTyping) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: isTyping
                    ? IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.send,
                          color: AppColors.primaryColor,
                        ),
                      )
                    : Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.camera_alt_outlined,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.image_outlined,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}
