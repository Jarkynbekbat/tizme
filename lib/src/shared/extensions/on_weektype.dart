import 'package:studtime/src/shared/data/models/schedule/schedule.dart';
import 'package:studtime/src/shared/extensions/on_datetime.dart';

extension OnWeekType on WeekType {
  String get ruTitle {
    switch (this) {
      case WeekType.even:
        return 'Числитель';
      case WeekType.odd:
        return 'Знаменатель';
    }
  }

  bool get isCurrentWeek {
    final currentWeekType = DateTime.now().getWeekType();
    return this == currentWeekType;
  }
}
