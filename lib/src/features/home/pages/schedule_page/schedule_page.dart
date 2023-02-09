import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studtime/src/features/home/pages/schedule_page/blocs/is_typing_cubit.dart';
import 'package:studtime/src/features/home/pages/schedule_page/elements/schedule_app_bar.dart';
import 'package:studtime/src/features/home/pages/schedule_page/elements/schedule_content.dart';
import 'package:studtime/src/features/home/pages/schedule_page/elements/schedule_input.dart';
import 'package:studtime/src/shared/data/models/schedule/schedule.dart';

class SchedulePage extends StatelessWidget {
  final Schedule schedule;
  const SchedulePage({Key? key, required this.schedule}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => IsTypingCubit()),
      ],
      child: Scaffold(
        appBar: ScheduleAppBar(schedule: schedule),
        body: Column(
          children: const [
            ScheduleContent(),
            ScheduleInput(),
          ],
        ),
      ),
    );
  }
}
