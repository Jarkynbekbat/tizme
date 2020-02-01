import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:new_rasp_app/pages/navigation_drawer_pages/components/module_item.dart';
import 'package:new_rasp_app/services/local/local_module_service.dart';

class ModuleGraphPage extends StatefulWidget {
  @override
  _ModuleGraphPageState createState() => _ModuleGraphPageState();
}

class _ModuleGraphPageState extends State<ModuleGraphPage> {
  List<Widget> moduleViews = [];
  int selected = 0;

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
  List<String> weekDaysStatic = ["ПН", "ВТ", "СР", "ЧТ", "ПТ", "СБ"];
  String month = '';
  List<String> weekDays = [];
  List<int> dates = [];

  final TextStyle selectedText = TextStyle(
    color: Colors.deepOrange,
    fontWeight: FontWeight.bold,
  );

  final TextStyle daysText = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.grey.shade800,
  );
  @override
  void initState() {
    onSelectDate(0);
    super.initState();
  }

  onSelectDate(index) {
    moduleViews.clear();
    dates.clear();
    weekDays.clear();

    LocalModuleService.getModule().then(
      (modules) {
        // print(modules);
        Map<String, dynamic> modulesJson = json.decode(modules);
        modulesJson['ПИ-2-16'].forEach(
          (el) {
            weekDays.add(
                weekDaysStatic[DateTime.parse(el['dateStart']).weekday - 1]);
            dates.add(DateTime.parse(el['dateStart']).day);
            month = months[DateTime.parse(el['dateStart']).month - 1];
          },
        );
        modulesJson['ПИ-2-16'].forEach((el) {
          if (DateTime.parse(el['dateStart']).day == dates[index]) {
            moduleViews.add(ModuleItem(
              subject: el['subjectName'],
              timeFrom: el['timeFrom'],
              timeTo: el['timeTo'],
              classroom: el['classroomName'],
            ));
            moduleViews.add(SizedBox(height: 20.0));
          }
        });
        setState(() => selected = index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('График модуля'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: HeaderWidget(
        backColor: Color(0xFF253B4F),
        header: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  month.toUpperCase(),
                  style: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      letterSpacing: 2.0),
                ),
              ),
              Row(
                children: weekDays.map((w) {
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => onSelectDate(weekDays.indexOf(w)),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: weekDays.indexOf(w) == selected
                                ? Colors.orange.shade100
                                : Colors.transparent,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30.0))),
                        padding: const EdgeInsets.only(top: 20, bottom: 8.0),
                        child: Text(
                          w,
                          style: weekDays.indexOf(w) == selected
                              ? selectedText
                              : daysText,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              Row(
                children: dates.map((d) {
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => onSelectDate(dates.indexOf(d)),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: dates.indexOf(d) == selected
                                ? Colors.orange.shade100
                                : Colors.transparent,
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(30.0))),
                        padding: const EdgeInsets.only(top: 8.0, bottom: 20.0),
                        child: Text("$d",
                            style: dates.indexOf(d) == selected
                                ? selectedText
                                : daysText),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: moduleViews,
          ),
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  final Widget body;
  final Widget header;
  final Color headerColor;
  final Color backColor;

  const HeaderWidget(
      {Key key,
      this.body,
      this.header,
      this.headerColor = Colors.white,
      this.backColor = Colors.deepPurple})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Stack _buildBody() {
    return Stack(
      children: <Widget>[
        Positioned(
          right: 0,
          top: 0,
          width: 10,
          height: 200,
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: backColor,
                borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(20.0))),
          ),
        ),
        Positioned(
          right: 0,
          top: 100,
          width: 50,
          bottom: 0,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: backColor,
            ),
          ),
        ),
        Column(
          children: <Widget>[
            if (header != null)
              Container(
                  margin: const EdgeInsets.only(right: 10.0),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(20.0)),
                    color: headerColor,
                  ),
                  child: header),
            if (body != null)
              Expanded(
                child: Material(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(30.0))),
                    elevation: 0,
                    color: backColor,
                    child: body),
              ),
          ],
        ),
      ],
    );
  }
}
