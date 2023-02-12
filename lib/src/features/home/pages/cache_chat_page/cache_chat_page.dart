import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
import 'package:studtime/src/features/home/pages/cache_chat_page/blocs/chat_content/chat_content_cubit.dart';
import 'package:studtime/src/features/home/pages/cache_chat_page/blocs/chat_input_cubit/chat_input_cubit.dart';
import 'package:studtime/src/features/home/pages/cache_chat_page/blocs/edit_message_cubit/edit_message_cubit.dart';
import 'package:studtime/src/features/home/pages/cache_chat_page/components/chat_content/chat_content.dart';
import 'package:studtime/src/features/home/pages/cache_chat_page/components/chat_input/chat_input.dart';
import 'package:studtime/src/features/home/pages/cache_chat_page/elements/schedule_app_bar.dart';
import 'package:studtime/src/shared/data/models/schedule/schedule.dart';
import 'package:studtime/src/shared/data/repos/app_cache_repo.dart';

class CacheChatPage extends StatelessWidget {
  final Schedule schedule;
  const CacheChatPage({Key? key, required this.schedule}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cacheRepo = context.read<AppCacheRepo>();

    final chatContentCubit = ChatContentCubit(
      cacheRepo.chatCache,
      schedule.subject,
    )..loadMessages();

    final editMessageCubit = EditMessageCubit();

    return MultiBlocProvider(
      providers: [
        /// получение и отправка сообщений
        BlocProvider(create: (_) => chatContentCubit),

        /// сообщение, которое редактируется,
        BlocProvider(create: (_) => editMessageCubit),

        /// смена состояния экшна инпута
        BlocProvider(
          create: (_) => ChatInputCubit(chatContentCubit, editMessageCubit),
        ),
      ],
      child: KeyboardSizeProvider(
        child: Scaffold(
          appBar: ScheduleAppBar(schedule: schedule),
          body: Column(
            children: const [
              ChatContent(),
              ChatInput(),
            ],
          ),
        ),
      ),
    );
  }
}
