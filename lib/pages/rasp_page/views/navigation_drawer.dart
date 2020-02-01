import 'package:flutter/material.dart';
import 'package:new_rasp_app/models/auth_model.dart';
import 'package:new_rasp_app/models/rasp_model.dart';
import 'package:new_rasp_app/services/local/local_cypher_service.dart';
import 'package:new_rasp_app/services/local/local_fio_service.dart';
import 'package:provider/provider.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  List<Widget> getOption(String title, IconData iconData, Function onTab) {
    return [
      ListTile(
        leading: Icon(
          iconData,
          color: Theme.of(context).iconTheme.color,
        ),
        title: Text(
          '$title',
          style: TextStyle(
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        onTap: onTab,
      ),
      Divider(
        color: Theme.of(context).iconTheme.color.withOpacity(0.5),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          './lib/assets/student.png',
                          width: 90,
                          height: 80,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(children: [
                              Padding(
                                padding: EdgeInsets.only(right: 10, left: 20),
                                child: Icon(
                                  Icons.group,
                                  color: Theme.of(context).iconTheme.color,
                                ),
                              ),
                              Text(
                                Provider.of<RaspModel>(context).group,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).iconTheme.color,
                                ),
                              ),
                            ]),
                            Row(children: [
                              Padding(
                                padding: EdgeInsets.only(right: 10, left: 20),
                                child: Icon(
                                  Icons.vpn_key,
                                  color: Theme.of(context).iconTheme.color,
                                ),
                              ),
                              FutureBuilder(
                                  future: LocalCypherService.getCypher(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<String> snapshot) {
                                    String cypher = snapshot.hasData
                                        ? snapshot.data
                                        : "шифр";
                                    return Text(
                                      cypher,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color:
                                            Theme.of(context).iconTheme.color,
                                      ),
                                    );
                                  }),
                            ]),
                          ],
                        ),
                      ]),
                  FutureBuilder(
                    future: LocalFioService.getFio(),
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      String fio = snapshot.hasData ? snapshot.data : "ФИО";
                      return Text(
                        fio,
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).textTheme.body1.color,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ]),
            decoration: BoxDecoration(
              color: Theme.of(context).appBarTheme.color,
              // color: Color(0xFFF4F5F9),
            ),
          ),
          ...getOption('График сессии', Icons.insert_chart,
              () => Navigator.pushNamed(context, '/session_graph')),
          ...getOption('График модуля', Icons.table_chart,
              () => Navigator.pushNamed(context, '/module_graph')),
          ...getOption('О приложении', Icons.question_answer,
              () => Navigator.pushNamed(context, '/about_app')),
          ...getOption(
              'Выйти',
              Icons.exit_to_app,
              () => Provider.of<AuthModel>(context, listen: false)
                  .logOut(context)),
        ],
      ),
    );
  }
}
