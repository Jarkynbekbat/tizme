import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/my_app_bar.dart';
import '../../models/fcm_models.dart';

class NotificationsPage extends StatefulWidget {
  static const String route = '/notifications';
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
                child: Dismissible(
                  key: ValueKey(fcmModel.allNotifications[index].toString()),
                  background: Container(
                    color: Colors.red,
                    child: Icon(
                      Icons.delete_outline,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  onDismissed: (DismissDirection key) async {
                    fcmModel.deleteNotification(fcmModel.allNotifications[index]['date']);
                  },
                  child: ExpansionTile(
                    leading: Icon(Icons.mail_outline, color: Theme.of(context).iconTheme.color),
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
                ),
              );
            }),
          );
        }),
      ),
    );
  }
}
