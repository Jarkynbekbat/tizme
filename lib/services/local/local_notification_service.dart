import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalNotificationsService {
  static Future<bool> addNotification(
      {Map<String, dynamic> notification}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> notificationsList =
        sharedPreferences.getStringList('notifications') != null
            ? sharedPreferences.getStringList('notifications')
            : [];
    notificationsList.add(json.encode(notification));
    return sharedPreferences.setStringList('notifications', notificationsList);
  }

  static Future<List<String>> getNotificattions() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getStringList('notifications') != null
        ? sharedPreferences.getStringList('notifications')
        : [];
  }

  static Future<bool> deleteNotification(String date) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> notificationsList =
        sharedPreferences.getStringList('notifications');
    notificationsList.removeWhere((el) => json.decode(el)['date'] == date);
    return sharedPreferences.setStringList('notifications', notificationsList);
  }

  static Future<bool> clearNotifications() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.remove('notifications');
  }
}
