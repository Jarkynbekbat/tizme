import 'package:flutter/material.dart';
import 'package:new_rasp_app/models/module_model.dart';
import 'package:provider/provider.dart';

class ModuleGraphPage extends StatefulWidget {
  @override
  _ModuleGraphPageState createState() => _ModuleGraphPageState();
}

class _ModuleGraphPageState extends State<ModuleGraphPage> {
  final TextStyle selectedText = TextStyle(
    color: Colors.deepOrange,
    fontWeight: FontWeight.bold,
  );

  final TextStyle daysText = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.grey.shade800,
  );

  @override
  void initState() => super.initState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.grey.shade700),
        title: Text(
          'График модуля',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Consumer<ModuleModel>(builder: (context, moduleModel, _) {
        return moduleModel.moduleViews.length == 0
            ? Center(child: Text('Пока нет данных ...'))
            : HeaderWidget(
                backColor: Color(0xFF253B4F),
                header: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          moduleModel.month.toUpperCase(),
                          style: TextStyle(
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              letterSpacing: 2.0),
                        ),
                      ),
                      Row(
                        children: moduleModel.weekDays.map((w) {
                          return Expanded(
                            child: GestureDetector(
                              onTap: () => moduleModel.onSelectDate(
                                  moduleModel.weekDays.indexOf(w)),
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: moduleModel.weekDays.indexOf(w) ==
                                            moduleModel.selected
                                        ? Colors.orange.shade100
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(30.0))),
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 8.0),
                                child: Text(
                                  w,
                                  style: moduleModel.weekDays.indexOf(w) ==
                                          moduleModel.selected
                                      ? selectedText
                                      : daysText,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      Row(
                        children: moduleModel.dates.map((d) {
                          return Expanded(
                            child: GestureDetector(
                              onTap: () => moduleModel
                                  .onSelectDate(moduleModel.dates.indexOf(d)),
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: moduleModel.dates.indexOf(d) ==
                                            moduleModel.selected
                                        ? Colors.orange.shade100
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(30.0))),
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 20.0),
                                child: Text("$d",
                                    style: moduleModel.dates.indexOf(d) ==
                                            moduleModel.selected
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
                    children: moduleModel.moduleViews,
                  ),
                ),
              );
      }),
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
