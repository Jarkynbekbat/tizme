import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:new_rasp_app/services/local/local_notification_service.dart';

class FcmModel extends ChangeNotifier {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  List<Map<String, dynamic>> allNotifications = [];

  FcmModel() {
    configure();
    initData();
  }

  void initData() async {
    this.allNotifications =
        (await LocalNotificationsService.getNotificattions())
            .map((el) => json.decode(el));
    notifyListeners();
  }

  void deleteNotification() {}

  void configure() {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        String body = message['notification']['body'];
        String title = message['notification']['title'];
        print("on message: $message");
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
