import 'package:flutter/material.dart';
import 'package:new_rasp_app/pages/chat_page/screens/home.dart';

class ChatPage extends StatefulWidget {
  static const String route = 'chat_page';

  const ChatPage();

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}
