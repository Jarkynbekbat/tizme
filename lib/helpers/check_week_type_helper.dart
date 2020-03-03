bool checkWeekType() {
  //текущая дата
  var now = DateTime.now();
  //разница между датами
  final diff = now.difference(new DateTime(now.year - 1, 12, 30));
  // номер недели в  году
  final diffInWeeks = (diff.inDays / 7).floor();
  return diffInWeeks % 2 == 0 ? true : false;
}
