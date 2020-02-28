import 'package:flutter/material.dart';

// To parse this JSON data, do
//     final SessionItem = sessionItemFromJson(jsonString);

import 'dart:convert';

import 'package:new_rasp_app/pages/navigation_drawer_pages/views/session_item_view.dart';
import 'package:new_rasp_app/services/local/local_session_service.dart';

SessionItem sessionItemFromJson(String str) =>
    SessionItem.fromJson(json.decode(str));

String sessionItemToJson(SessionItem data) => json.encode(data.toJson());

class SessionItem {
  String sessId;
  String timeFrom;
  String timeTo;
  DateTime dateStart;
  String watcher;
  String classroomName;
  String subjectName;

  SessionItem({
    this.sessId,
    this.timeFrom,
    this.timeTo,
    this.dateStart,
    this.watcher,
    this.classroomName,
    this.subjectName,
  });

  factory SessionItem.fromJson(Map<String, dynamic> json) => SessionItem(
        sessId: json["sessId"],
        timeFrom: json["timeFrom"],
        timeTo: json["timeTo"],
        dateStart: DateTime.parse(json["dateStart"]),
        watcher: json["watcher"],
        classroomName: json["classroomName"],
        subjectName: json["subjectName"],
      );

  Map<String, dynamic> toJson() => {
        "sessId": sessId,
        "timeFrom": timeFrom,
        "timeTo": timeTo,
        "dateStart":
            "${dateStart.year.toString().padLeft(4, '0')}-${dateStart.month.toString().padLeft(2, '0')}-${dateStart.day.toString().padLeft(2, '0')}",
        "watcher": watcher,
        "classroomName": classroomName,
        "subjectName": subjectName,
      };
}

class SessionModel extends ChangeNotifier {
  final List<String> months = [
    'январь',
    'февраль',
    'март',
    'апрель',
    'май',
    'июнь',
    'июль',
    'август',
    'сентябрь',
    'октябрь',
    'ноябрь',
    'декабрь'
  ];
  List<String> weekDaysStatic = ["ПН", "ВТ", "СР", "ЧТ", "ПТ", "СБ", "ВС"];

  List<Widget> moduleViews = [];
  int selected = 0;
  String month = '';
  List<String> weekDays = [];
  List<int> dates = [];

  SessionModel() {
    onSelectDate(0);
  }

  onSelectDate(index) async {
    moduleViews.clear();
    dates.clear();
    weekDays.clear();

    try {
      String modules = await LocalSessionService.getSession();
      Map<String, dynamic> modulesJson = json.decode(modules);

      List<dynamic> sessionModels = modulesJson[modulesJson.keys.first]
          .map((el) => SessionItem.fromJson(el))
          .toList();

      weekDays = sessionModels
          .map((el) => weekDaysStatic[el.dateStart.weekday - 1])
          .toList();
      dates = sessionModels
          .map((el) => int.parse(el.dateStart.day.toString()))
          .toList();
      month = sessionModels.map((el) => months[el.dateStart.month - 1]).first;

      sessionModels.forEach((el) {
        if (el.dateStart.day == dates[index])
          moduleViews.addAll(
              [SessionItemView(sessionItem: el), SizedBox(height: 20.0)]);
      });
      selected = index;
    } catch (ex) {
      moduleViews = [];
    }
    notifyListeners();
  }
}
