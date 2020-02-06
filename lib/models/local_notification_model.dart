import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationModel extends ChangeNotifier {
  FlutterLocalNotificationsPlugin plagin;
  AndroidInitializationSettings androidSettings;
  IOSInitializationSettings iosSettings;
  InitializationSettings settings;

  var time = Time(11, 11, 0);

  LocalNotificationModel() {
    plagin = FlutterLocalNotificationsPlugin();
    androidSettings = AndroidInitializationSettings('app_icon');
    iosSettings = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) =>
            onSelectNotification(payload));
    settings = InitializationSettings(androidSettings, iosSettings);
    plagin.initialize(settings, onSelectNotification: onSelectNotification);
  }

  Future setDailyNotification({int id, String title, String body, Time time}) =>
      plagin.showDailyAtTime(id, title, body, time, _ongoing);

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
    // await Navigator.push(
    //   context,
    //   new MaterialPageRoute(builder: (context) => new SecondScreen(payload)),
    // );
  }

  Future cancelAll() => plagin.cancelAll();

  Future showOngoingNotification(
    FlutterLocalNotificationsPlugin plagin, {
    String title,
    String body,
    int id = 0,
  }) =>
      showNotification(
        plagin,
        title: title,
        body: body,
        type: _ongoing,
      );

  Future showNotification(
    FlutterLocalNotificationsPlugin plagin, {
    String title,
    String body,
    NotificationDetails type,
    int id = 0,
  }) =>
      plagin.show(id, title, body, type);

// TODO----------------------------------Show a daily notification at a specific time----------------------------

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
