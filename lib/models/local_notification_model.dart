import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationModel extends ChangeNotifier {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  AndroidInitializationSettings initializationSettingsAndroid;
  IOSInitializationSettings initializationSettingsIOS;
  InitializationSettings initializationSettings;

  LocalNotificationModel() {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
    initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) =>
            onSelectNotification(payload));

    initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  NotificationDetails get _ongoing {
    final androidChannelSpecifics = AndroidNotificationDetails(
      "channelId",
      "channelName",
      "channelDescription",
      importance: Importance.Max,
      priority: Priority.High,
      ongoing: true,
      autoCancel: false,
      playSound: true,
    );
    final iosChannelSpecifics = IOSNotificationDetails();
    return NotificationDetails(androidChannelSpecifics, iosChannelSpecifics);
  }

  Future onSelectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
    print('you selected the notification!');
    // await Navigator.push(
    //   context,
    //   new MaterialPageRoute(builder: (context) => new SecondScreen(payload)),
    // );
  }

  Future showOngoingNotification(
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin, {
    String title,
    String body,
    int id = 0,
  }) =>
      showNotification(
        flutterLocalNotificationsPlugin,
        title: title,
        body: body,
        type: _ongoing,
      );

  Future showNotification(
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin, {
    String title,
    String body,
    NotificationDetails type,
    int id = 0,
  }) =>
      flutterLocalNotificationsPlugin.show(id, title, body, type);

// TODO----------------------------------Show a daily notification at a specific time----------------------------
//       var time = new Time(10, 0, 0);
// var androidPlatformChannelSpecifics =
//     new AndroidNotificationDetails('repeatDailyAtTime channel id',
//         'repeatDailyAtTime channel name', 'repeatDailyAtTime description');
// var iOSPlatformChannelSpecifics =
//     new IOSNotificationDetails();
// var platformChannelSpecifics = new NotificationDetails(
//     androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
// await flutterLocalNotificationsPlugin.showDailyAtTime(
//     0,
//     'show daily title',
//     'Daily notification shown at approximately ${_toTwoDigitString(time.hour)}:${_toTwoDigitString(time.minute)}:${_toTwoDigitString(time.second)}',
//     time,
//     platformChannelSpecifics);
}
