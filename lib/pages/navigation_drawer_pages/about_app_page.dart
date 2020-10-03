import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/my_app_bar.dart';

class AboutAppPage extends StatelessWidget {
  static const String route = '/about_app';
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextStyle titleStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: MyAppBar('О приложении', 'default', 'default', 'default'),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width - 4,
              // height: MediaQuery.of(context).size.height / 4,
              child: Image.asset('./lib/assets/preview.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Stud Time', style: titleStyle),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 10),
              child: Text('''\t\tПорой студентам бывает сложно организовать учебный 
          процесс,задания по дисциплинам,материалы 
    лекций,сроки сдачи лабораторных работ,приложение
              Stud Time предназначено помочь им в этом'''),
            ),
            Text('Мы в социальных сетях', style: titleStyle),
            Container(
              child: Card(
                color: Theme.of(context).appBarTheme.color,
                // margin: EdgeInsets.only(left: 15, right: 15, top: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView(
                    shrinkWrap: true,
                    addAutomaticKeepAlives: true,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () async => await openUrl('https://www.facebook.com/profile.php?id=100008938729370'),
                            child: Image.asset(
                              './lib/assets/face.png',
                              width: 43,
                            ),
                          ),
                          GestureDetector(
                            onTap: () async => await openUrl('https://www.vk.com/omurbek9737'),
                            child: Image.asset(
                              './lib/assets/vk.png',
                              width: 45,
                            ),
                          ),
                          GestureDetector(
                            onTap: () async => await openUrl('https://www.instagram.com/studtime_x/'),
                            child: Image.asset(
                              './lib/assets/insta.png',
                              width: 43,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 18),
              child: OutlineButton(
                color: Colors.white,
                disabledBorderColor: Colors.white,
                textColor: Colors.black,
                onPressed: () => openUrl('https://stud.unitedyouth.org.kg/'),
                child: Text(
                  'Посетите наш сайт',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.body1.color,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 18),
              child: OutlineButton(
                color: Colors.white,
                disabledBorderColor: Colors.white,
                textColor: Colors.black,
                onPressed: () => openUrl('mailto:studtime@webrand.kg'),
                child: Text(
                  'Напишите нам',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.body1.color,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  openUrl(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
