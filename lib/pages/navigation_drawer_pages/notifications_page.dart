import 'package:flutter/material.dart';
import 'package:new_rasp_app/models/fcm_models.dart';
import 'package:provider/provider.dart';

import '../../components/my_app_bar.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Уведомления', 'default', 'default', 'default'),
      body: SingleChildScrollView(
        child: Consumer<FcmModel>(builder: (context, fcmModel, _) {
          return Column(
            children: List.generate(fcmModel.allNotifications.length, (index) {
              return Container(
                color: Theme.of(context).appBarTheme.color,
                margin: EdgeInsets.all(8),
                child: ExpansionTile(
                  leading: Icon(Icons.mail_outline,
                      color: Theme.of(context).iconTheme.color),
                  title: Text(
                    fcmModel.allNotifications[index]['title'],
                    style: TextStyle(color: Theme.of(context).iconTheme.color),
                  ),
                  subtitle: Text(
                    fcmModel.allNotifications[index]['date'],
                    style: TextStyle(color: Theme.of(context).iconTheme.color),
                  ),
                  children: [
                    Text(fcmModel.allNotifications[index]['body']),
                  ],
                ),
              );
            }),
          );
        }),
      ),
    );
  }
}
