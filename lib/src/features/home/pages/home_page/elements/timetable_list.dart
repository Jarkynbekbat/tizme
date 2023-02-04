import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studtime/src/features/home/blocs/day_timetable_cubit.dart';
import 'package:studtime/src/features/home/blocs/timetable_cubit/timetable_cubit.dart';
import 'package:studtime/src/features/home/pages/home_page/elements/schedule_list_tile.dart';
import 'package:studtime/src/shared/assets/assets.gen.dart';
import 'package:studtime/src/shared/data/models/schedule/schedule.dart';
import 'package:studtime/src/shared/styles/app_colors.dart';

class TimetableList extends StatelessWidget {
  final Weekday weekday;
  const TimetableList({super.key, required this.weekday});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DayTimetableCubit(context.read<TimetableCubit>(), weekday),
      child: Builder(builder: (context) {
        return BlocBuilder<DayTimetableCubit, TimetableState>(
          builder: (context, state) {
            return state.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (list) {
                if (list.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Assets.shared.noData.svg(
                          width: 80.0,
                          height: 80.0,
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          "Нет занятий",
                          style: TextStyle(
                            color: AppColors.primaryColor.withOpacity(0.66),
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: list.length,
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
      }),
    );
  }
}
