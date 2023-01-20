import 'package:flutter/material.dart';
import 'package:new_rasp_app/components/my_app_bar.dart';
import 'package:new_rasp_app/pages/chat_page/widgets/category_selector.dart';
import 'package:new_rasp_app/pages/chat_page/widgets/recent_chats.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Сообщения', 'default', 'default', 'default'),
      body: Column(
        children: <Widget>[
          CategorySelector(),
          Expanded(
            child: Container(
              height: 500.0,
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))),
              child: Column(
                children: <Widget>[
                  // FavoriteContacts(),
                  RecentChats(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
