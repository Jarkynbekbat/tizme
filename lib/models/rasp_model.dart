import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:new_rasp_app/helpers/check_connection_helper.dart';
import 'package:new_rasp_app/helpers/check_week_type_helper.dart';
import 'package:new_rasp_app/helpers/show_snackbar.dart';
import 'package:new_rasp_app/services/http/http_module_service.dart';
import 'package:new_rasp_app/services/http/http_quote_service.dart';
import 'package:new_rasp_app/services/http/http_rasp_service.dart';
import 'package:new_rasp_app/services/local/local_cypher_service.dart';
import 'package:new_rasp_app/services/local/local_group_service.dart';
import 'package:new_rasp_app/services/local/local_rasp_service.dart';

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
  String quote = "цитата/цитата";
  String cypher = "шифр";

  RaspModel() {
    this._initRasp();
  }

  _initRasp() async {
    if (await checkConnection()) {
      cypher = await LocalCypherService.getCypher();
      Map<String, dynamic> jsonRasps =
          await HttpRaspService.getRaspAndGroupByCypher(cypher);
      jsonRasps[jsonRasps.keys.first]
          .forEach((el) => this.all.add(RaspItem.fromJson(el)));
      group = jsonRasps.keys.first;
      await LocalGroupService.setGroup(group);
      quote = await HttpQuoteService.getQuote();
      await HttpModuleService.getModule(cypher);
    } else {
      String rasps = await LocalRaspService.getRasp();
      //TODO доделать string to json
    }

    notifyListeners();
  }

  void setCurrent(dayId) {
    this.today = dayId;
    notifyListeners();
  }

  void onRefresh(_scaffoldKey, _refreshController) async {
    this.all.clear();
    //refreshing rasps on pull
    Map<String, dynamic> jsonRasps =
        await HttpRaspService.getRaspAndGroupByCypher(cypher);
    jsonRasps[jsonRasps.keys.first]
        .forEach((el) => this.all.add(RaspItem.fromJson(el)));
    //refreshing modules on pull
    await HttpModuleService.getModule(cypher);
    //refreshing quotes on pull
    this.quote = await HttpQuoteService.getQuote();

    showSnackBar('Данные обновлены!', _scaffoldKey);
    _refreshController.refreshCompleted();
    notifyListeners();
  }

  List<RaspItem> getRaspByDayId(int dayId) {
    String weekName = checkWeekType() ? 'Числитель' : 'Знаменатель';

    if (weekName == 'Числитель')
      return this
          .all
          .where((el) => el.dayId == dayId && el.weekName == weekName)
          .toList();
    else {
      //все пары тек дня
      List<RaspItem> both = this.all.where((el) => el.dayId == dayId).toList();
      //только четные
      List<RaspItem> even =
          both.where((el) => el.weekName == 'Числитель').toList();
      //только не четные
      List<RaspItem> notEven =
          both.where((el) => el.weekName == 'Знаменатель').toList();
      print('sss');
      //удаляю дубликаты из четной недели
      even.forEach((i) {
        notEven.forEach((j) {
          if (i.timeFrom == j.timeFrom)
            both.removeWhere((el) =>
                el.weekName == 'Числитель' && el.timeFrom == i.timeFrom);
        });
      });
      return both;
    }
  }
}
