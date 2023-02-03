import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studtime/src/features/home/blocs/timetable_cubit/timetable_cubit.dart';
import 'package:studtime/src/features/home/pages/home_page/elements/schedule_list_tile.dart';

class TimetableList extends StatelessWidget {
  final int weekdayIndex;
  const TimetableList({super.key, required this.weekdayIndex});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimetableCubit, TimetableState>(
      builder: (context, state) {
        return state.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (list) {
            return ListView.builder(
              itemCount: 5,
              padding: const EdgeInsets.all(16.0),
              itemBuilder: (context, index) => ScheduleListTile(
                schedule: list[index],
              ),
            );
          },
          error: (error) => Center(child: Text(error)),
        );
      },
    );
  }
}
