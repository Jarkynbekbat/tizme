import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../helpers/screen.dart';
import '../../../models/auth_model.dart';
import '../../../models/rasp_model.dart';
import '../../../services/local/local_cypher_service.dart';
import '../../../services/local/local_fio_service.dart';
import '../../../services/local/local_user_service.dart';

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
      Divider(color: Theme.of(context).iconTheme.color.withOpacity(0.5)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: Screen.heigth(context) * 0.21,
            // height: 300,
            child: DrawerHeader(
              margin: EdgeInsets.only(bottom: 0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start, children: [
                      FutureBuilder(
                          future: LocalUserService.getUser(),
                          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                            if (snapshot.hasData && snapshot.data == 'преподаватель') {
                              return Image.asset(
                                './lib/assets/teacher.png',
                                width: 90,
                                height: 80,
                              );
                            } else {
                              return Image.asset(
                                './lib/assets/student.png',
                                width: 90,
                                height: 80,
                              );
                            }
                          }),

                      // SizedBox(height: 100),
                      Expanded(
                        child: Column(
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
                                  builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                                    String cypher = snapshot.hasData ? snapshot.data : "шифр";
                                    return Text(
                                      cypher,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Theme.of(context).iconTheme.color,
                                      ),
                                    );
                                  }),
                            ]),
                          ],
                        ),
                      ),
                    ]),
                  ]),
              decoration: BoxDecoration(
                color: Theme.of(context).appBarTheme.color,
              ),
            ),
          ),
          Container(
            color: Theme.of(context).appBarTheme.color,
            child: ExpansionTile(
              title: FutureBuilder(
                future: LocalFioService.getFio(),
                builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
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
              children: [
                getOption('Выйти', Icons.exit_to_app, () => Provider.of<AuthModel>(context, listen: false).logOut(context))[0],
              ],
            ),
          ),
          // ...getOption('Уведомления', Icons.notifications,
          //     () => Navigator.pushNamed(context, '/notifications')),
          ...getOption('График сессии', Icons.insert_chart, () => Navigator.pushNamed(context, '/session_graph')),
          ...getOption('График модуля', Icons.table_chart, () => Navigator.pushNamed(context, '/module_graph')),
          ...getOption('О приложении', Icons.question_answer, () => Navigator.pushNamed(context, '/about_app')),
        ],
      ),
    );
  }
}
