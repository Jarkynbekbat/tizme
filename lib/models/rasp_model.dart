import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:new_rasp_app/services/http/http_rasp_service.dart';
import 'package:new_rasp_app/services/local/local_cypher_service.dart';

RaspItem raspItemFromJson(String str) => RaspItem.fromJson(json.decode(str));
String raspItemToJson(RaspItem data) => json.encode(data.toJson());

class RaspItem {
  String weekName;
  String timeFrom;
  String timeTo;
  int dayId;
  String classroomName;
  String teacherName;
  String subjectName;
  String lestypeName;
  String groupName;

  RaspItem({
    this.weekName,
    this.timeFrom,
    this.timeTo,
    this.dayId,
    this.classroomName,
    this.teacherName,
    this.subjectName,
    this.lestypeName,
    this.groupName,
  });

  factory RaspItem.fromJson(Map<String, dynamic> json) => RaspItem(
        weekName: json["weekName"],
        timeFrom: json["timeFrom"],
        timeTo: json["timeTo"],
        dayId: int.parse(json["dayId"]),
        classroomName: json["classroomName"],
        teacherName: json["teacherName"],
        subjectName: json["subjectName"],
        lestypeName: json["lestypeName"],
        groupName: json["groupName"],
      );

  Map<String, dynamic> toJson() => {
        "weekName": weekName,
        "timeFrom": timeFrom,
        "timeTo": timeTo,
        "dayId": dayId,
        "classroomName": classroomName,
        "teacherName": teacherName,
        "subjectName": subjectName,
        "lestypeName": lestypeName,
        "groupName": groupName,
      };
}

class RaspModel extends ChangeNotifier {
  List<RaspItem> all = [];
  int today = DateTime.now().weekday;
  String group = "группа";

  RaspModel() {
    this._initRasp();
  }

  _initRasp() async {
    String cypher = await LocalCypherService.getCypher();
    Map<String, dynamic> jsonRasps =
        await HttpRaspService.getRaspAndGroupByCypher(cypher);

    jsonRasps[jsonRasps.keys.first]
        .forEach((el) => this.all.add(RaspItem.fromJson(el)));

    group = jsonRasps.keys.first;
    notifyListeners();
  }

  void setCurrent(dayId) {
    this.today = dayId;
    notifyListeners();
  }

  List<RaspItem> getRaspByDayId(int dayId) =>
      this.all.where((el) => el.dayId == dayId).toList();

  //получить расписание по дням недели и типу недели

}
