import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../helpers/check_connection_helper.dart';
import '../helpers/check_week_type_helper.dart';
import '../helpers/show_snackbar.dart';
import '../services/http/http_module_service.dart';
import '../services/http/http_rasp_service.dart';
import '../services/http/http_session_service.dart';
import '../services/local/local_cypher_service.dart';
import '../services/local/local_group_service.dart';
import '../services/local/local_quote_service.dart';
import '../services/local/local_rasp_service.dart';
import '../services/local/local_user_service.dart';

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
        dayId: int.parse(json["dayId"].toString()),
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
  bool isLoaded = false;

  RaspModel() {
    this.initRasp();
  }

  initRasp() async {
    this.all = [];

    String stringRasp = await LocalRaspService.getRasp();
    cypher = await LocalCypherService.getCypher();
    //если есть интернет или нет локального расписания
    //если заходим в первый раз
    //если заходим не в первый раз но есть интернет
    if (await checkConnection() || stringRasp == null) {
      //берем расписание из сервера
      Map<String, dynamic> jsonRasps = await HttpRaspService.getRaspAndGroupByCypher(cypher);
      //берем расписание по группе
      jsonRasps[jsonRasps.keys.first]
          // добавляем в расписание в this
          .forEach((el) => this.all.add(RaspItem.fromJson(el)));
      //берем название группы
      group = jsonRasps.keys.first;
      //сохраняем группу локально
      await LocalGroupService.setGroup(group);
      //берем цитату из сервера
      quote = "await HttpQuoteService.getQuote();";
      await HttpModuleService.getModule(cypher);
      await HttpSessionService.getSession(cypher);
      String who = await LocalUserService.getUser();
      if (who == 'преподаватель') {
        //переименовываю названия групп в названия потоков если это лекция
        this.all.forEach((raspItem) {
          List<RaspItem> test = this
              .all
              .where((raspItem2) => (raspItem.dayId == raspItem2.dayId &&
                  raspItem.classroomName == raspItem2.classroomName &&
                  raspItem.timeFrom == raspItem2.timeFrom &&
                  raspItem.timeTo == raspItem2.timeTo))
              .toList();
          if (test.length > 1) {
            test.forEach((el) {
              List<String> parts = raspItem.teacherName.split('-');
              if (parts.length == 3) el.teacherName = parts[0] + '-' + parts[2];
            });
          }
        });
        //удаляю дубликаты из расписания препадавателей
        List<String> raspStringArray = this.all.map((el) => json.encode(el.toJson())).toList();
        var setArray = Set.from(raspStringArray);
        List<RaspItem> mapArray = setArray.map((el) => RaspItem.fromJson(json.decode(el))).toList();
        this.all = mapArray;
      }
    }
    //если заходим не в первый раз и нет интернета
    else if (!await checkConnection() && stringRasp != null) {
      String stringRasp = await LocalRaspService.getRasp();
      // string to json
      Map<String, dynamic> jsonRasps = jsonDecode(stringRasp);
      jsonRasps[jsonRasps.keys.first].forEach((el) => this.all.add(RaspItem.fromJson(el)));
      group = jsonRasps.keys.first;
      quote = await LocalQuoteService.getQuote();
    }
    isLoaded = true;
    notifyListeners();
  }

  void onRefresh(_scaffoldKey, _refreshController) async {
    if (await checkConnection()) {
      this.all = [];
      cypher = await LocalCypherService.getCypher();

      await this.initRasp();

      // //refreshing rasps on pull
      // Map<String, dynamic> jsonRasps =
      //     await HttpRaspService.getRaspAndGroupByCypher(cypher);
      // jsonRasps[jsonRasps.keys.first]
      //     .forEach((el) => this.all.add(RaspItem.fromJson(el)));
      // //refreshing groupname
      // await LocalGroupService.setGroup(jsonRasps.keys.first);
      // this.group = jsonRasps.keys.first;
      // //refreshing modules on pull
      // await HttpModuleService.getModule(cypher);
      // //refreshing quotes on pull
      // this.quote = await HttpQuoteService.getQuote();

      showSnackBar('Данные обновлены!', _scaffoldKey);
      _refreshController.refreshCompleted();
    } else {
      _refreshController.refreshCompleted();
      showSnackBar('нет подключения к сети...', _scaffoldKey);
    }
    notifyListeners();
  }

  List<RaspItem> getRaspByDayId(int dayId) {
    String weekName = checkWeekType() ? 'Числитель' : 'Знаменатель';
    if (weekName == 'Числитель') {
      return this.all.where((el) => el.dayId == dayId && el.weekName == weekName).toList();
    } else {
      //все пары тек дня
      List<RaspItem> both = this.all.where((el) => el.dayId == dayId).toList();
      //только четные
      List<RaspItem> even = both.where((el) => el.weekName == 'Числитель').toList();
      //только не четные
      List<RaspItem> notEven = both.where((el) => el.weekName == 'Знаменатель').toList();
      //удаляю дубликаты из четной недели
      even.forEach((i) {
        notEven.forEach((j) {
          if (i.timeFrom == j.timeFrom)
            both.removeWhere(
              (el) => el.weekName == 'Числитель' && el.timeFrom == i.timeFrom,
            );
        });
      });
      return both;
    }
  }

  void setCurrent(dayId) {
    this.today = dayId;
    notifyListeners();
  }
}
