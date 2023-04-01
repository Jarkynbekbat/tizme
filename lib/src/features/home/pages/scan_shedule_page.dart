import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studtime/src/features/home/pages/timetable_page/elements/schedule_list_tile.dart';
import 'package:studtime/src/features/home/pages/timetable_page/elements/timetable_list.dart';
import 'package:studtime/src/shared/data/models/schedule/schedule.dart';
import 'package:studtime/src/features/home/blocs/timetable_cubit/timetable_cubit.dart';
import 'package:studtime/src/shared/extensions/on_weektype.dart';

import '../../../shared/assets/assets.gen.dart';
import '../../../shared/styles/app_colors.dart';
import '../blocs/setup_cubit.dart';

class ScanShedulePage extends StatelessWidget {
  String? classroom;
  ScanShedulePage({this.classroom, super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text('График расписаний в аудитории'),
    ),
    body: BlocProvider(
      create: (_) => TimetableCubit(
        FirebaseFirestore.instance,
        context.read<SetupCubit>(),
      ),

      child: Builder(
        builder: (context) {
          return BlocBuilder<TimetableCubit, TimetableState>(
            builder: (context, state) {
              return state.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                loaded: (items, isTeacher) {
                  final filtered = items.where((el) => el.classroom.name.contains(classroom.toString())).toList()
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
                      final isCurrentWeek = schedule.weekType.isCurrentWeek;
                      final isEven = schedule.weekType == WeekType.even;
                      final isOdd = schedule.weekType == WeekType.odd;

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
      ),
    ),
    );
  }
}
