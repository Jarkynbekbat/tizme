import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:new_rasp_app/services/local/local_notification_service.dart';

class FcmModel extends ChangeNotifier {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  List<dynamic> allNotifications = [];

  FcmModel() {
    configure();
    // initData();
  }

  void initData() async {
    this.allNotifications =
        (await LocalNotificationsService.getNotificattions())
            .map((el) => json.decode(el))
            .toList();

    notifyListeners();
  }

  void deleteNotification(String date) async {
    LocalNotificationsService.deleteNotification(date);
    this.allNotifications.removeWhere((el) => el['date'] == date);
  }

  void configure() {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        //TODO: Доделать , не сохраняет уводемнение в фоновом режиме
        // Map<String, dynamic> object = {};
        // object['title'] = message['notification']['title'];
        // object['body'] = message['notification']['body'];
        // object['date'] = DateTime.now().toString();
        // await LocalNotificationsService.addNotification(notification: object);
        initData();
      },
      onResume: (Map<String, dynamic> message) async {},
      onLaunch: (Map<String, dynamic> message) async {},
    );
    // request push notification permission
    _firebaseMessaging.requestNotificationPermissions(
      const IosNotificationSettings(sound: true, badge: true, alert: true),
    );
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) => null);
  }
}
