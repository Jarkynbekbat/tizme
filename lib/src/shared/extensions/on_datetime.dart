import 'package:studtime/src/shared/data/models/schedule/schedule.dart';

extension OnDatetime on DateTime {
  WeekType getWeekType() {
    //текущая дата
    var now = this;
    //разница между датами
    final diff = now.difference(DateTime(now.year - 1, 12, 30));
    // номер недели в  году
    final diffInWeeks = (diff.inDays / 7).floor();
    return diffInWeeks % 2 == 0 ? WeekType.even : WeekType.odd;
  }
}
