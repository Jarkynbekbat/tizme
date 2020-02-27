import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:new_rasp_app/pages/navigation_drawer_pages/views/module_item_view.dart';
import 'package:new_rasp_app/services/local/local_module_service.dart';

ModuleItem moduleItemFromJson(String str) =>
    ModuleItem.fromJson(json.decode(str));

String moduleItemToJson(ModuleItem data) => json.encode(data.toJson());

class ModuleItem {
  String modId;
  String subjectName;
  String classroomName;
  String timeFrom;
  String timeTo;
  DateTime dateStart;

  ModuleItem({
    this.modId,
    this.subjectName,
    this.classroomName,
    this.timeFrom,
    this.timeTo,
    this.dateStart,
  });

  factory ModuleItem.fromJson(Map<String, dynamic> json) => ModuleItem(
        modId: json["modId"],
        subjectName: json["subjectName"],
        classroomName: json["classroomName"],
        timeFrom: json["timeFrom"],
        timeTo: json["timeTo"],
        dateStart: DateTime.parse(json["dateStart"]),
      );

  Map<String, dynamic> toJson() => {
        "modId": modId,
        "subjectName": subjectName,
        "classroomName": classroomName,
        "timeFrom": timeFrom,
        "timeTo": timeTo,
        "dateStart":
            "${dateStart.year.toString().padLeft(4, '0')}-${dateStart.month.toString().padLeft(2, '0')}-${dateStart.day.toString().padLeft(2, '0')}",
      };
}

class ModuleModel extends ChangeNotifier {
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

  ModuleModel() {
    onSelectDate(0);
  }

  onSelectDate(index) async {
    moduleViews.clear();
    dates.clear();
    weekDays.clear();

    try {
      String modules = await LocalModuleService.getModule();
      Map<String, dynamic> modulesJson = json.decode(modules);

      List<dynamic> moduleModels = modulesJson[modulesJson.keys.first]
          .map((el) => ModuleItem.fromJson(el))
          .toList();

      weekDays = moduleModels
          .map((el) => weekDaysStatic[el.dateStart.weekday - 1])
          .toList();

      dates = moduleModels
          .map((el) => int.parse(el.dateStart.day.toString()))
          .toList();
      month = moduleModels.map((el) => months[el.dateStart.month - 1]).first;

      moduleModels.forEach((el) {
        if (el.dateStart.day == dates[index])
          moduleViews
              .addAll([ModuleItemView(moduleItem: el), SizedBox(height: 20.0)]);
      });
      selected = index;
    } catch (ex) {
      ex;
      moduleViews = [];
    }
    notifyListeners();
  }
}
