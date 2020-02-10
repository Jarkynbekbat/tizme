import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:new_rasp_app/models/rasp_model.dart';

class LocalNotificationModel extends ChangeNotifier {
  FlutterLocalNotificationsPlugin plagin;
  AndroidInitializationSettings androidSettings;
  IOSInitializationSettings iosSettings;
  InitializationSettings settings;

  LocalNotificationModel() {
    plagin = FlutterLocalNotificationsPlugin();
    androidSettings = AndroidInitializationSettings('app_icon');
    iosSettings = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) =>
            onSelectNotification(payload));
    settings = InitializationSettings(androidSettings, iosSettings);
    plagin.initialize(settings, onSelectNotification: onSelectNotification);
  }

  Future setDailyNotification({
    int id,
    String title,
    String body,
    Time time,
    List<RaspItem> rasps,
  }) =>
      plagin.showDailyAtTime(id, title, body, time, _ongoing(rasps));

  NotificationDetails _ongoing(List<RaspItem> rasps) {
    String bigTextRasps = '';

    if (rasps.length != 0) {
      for (RaspItem el in rasps) {
        bigTextRasps +=
            '<b> ${el.timeFrom}-${el.timeTo} :</b> ${el.subjectName} <br>';
      }
    }

    BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
      bigTextRasps,
      htmlFormatBigText: true,
      contentTitle: 'Расписание на сегодня',
      htmlFormatContentTitle: true,
      summaryText: 'summary <i>text</i>',
      htmlFormatSummaryText: true,
    );

    final androidChannelSpecifics = AndroidNotificationDetails(
      "channelId",
      "channelName",
      "channelDescription",
      importance: Importance.Max,
      priority: Priority.Default,
      style: AndroidNotificationStyle.BigText,
      styleInformation: bigTextStyleInformation,
    );
    final iosChannelSpecifics = IOSNotificationDetails();

    return NotificationDetails(androidChannelSpecifics, iosChannelSpecifics);
  }

  Future onSelectNotification(String payload) async {}

  Future cancelAll() => plagin.cancelAll();
}
