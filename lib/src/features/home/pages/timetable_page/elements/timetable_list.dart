import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studtime/src/features/home/blocs/timetable_cubit/timetable_cubit.dart';
import 'package:studtime/src/features/home/pages/timetable_page/elements/schedule_list_tile.dart';
import 'package:studtime/src/shared/assets/assets.gen.dart';
import 'package:studtime/src/shared/data/models/schedule/schedule.dart';
import 'package:studtime/src/shared/styles/app_colors.dart';

class TimetableList extends StatelessWidget {
  final Weekday weekday;
  const TimetableList({super.key, required this.weekday});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimetableCubit, TimetableState>(
      builder: (context, state) {
        return state.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (items, isTeacher) {
            final filtered = items.where((el) => el.day == weekday).toList()
              ..sort((a, b) => a.time.order - b.time.order);

            if (filtered.isEmpty) {
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
              itemCount: filtered.length,
              padding: const EdgeInsets.all(16.0),
              itemBuilder: (context, index) {
                final schedule = filtered[index];
                final isCurrentWeek = schedule.isCurrentWeek;
                final isEven = schedule.week == WeekType.even;
                final isOdd = schedule.week == WeekType.odd;

                final hasReplacement = filtered
                    .any((el) => el.time == schedule.time && el != schedule);

                final isDisabled = (isOdd && !isCurrentWeek) ||
                    (isEven && !isCurrentWeek && hasReplacement);

                return ScheduleListTile(
                  key: ValueKey('ScheduleListTile__${schedule.id}'),
                  schedule: schedule,
                  isDisabled: isDisabled,
                  showWeekType: hasReplacement || isDisabled,
                  isTeacher: isTeacher,
                );
              },
            );
          },
          error: (error) => Center(child: Text(error)),
        );
      },
    );
  }
}
