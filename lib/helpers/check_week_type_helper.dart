bool checkWeekType() {
  var now = DateTime.now();
  // var now = DateTime(2020, 1, 27);
  final diff = now.difference(new DateTime(now.year - 1, 12, 30));
  // номер недели в  году
  final diffInWeeks = (diff.inDays / 7).floor();

  // return diffInWeeks % 2 == 0 ? false : true;
  return diffInWeeks % 2 == 0 ? true : false;
}
