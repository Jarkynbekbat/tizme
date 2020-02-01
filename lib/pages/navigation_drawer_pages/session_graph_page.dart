import 'package:flutter/material.dart';
import 'package:new_rasp_app/components/my_app_bar.dart';

class SessionGraphPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('График сессии', 'default', 'default', 'default'),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Card(
          child: Text('''
          Здесь будет информация о сессии
          '''),
        ),
      ),
    );
  }
}
