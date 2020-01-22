import 'package:shared_preferences/shared_preferences.dart';

class LocalGroupService {
  static Future<bool> setGroup(group) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('group', group);
  }

  static getGroup() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var group = prefs.getString('group');
    return group;
  }

  static Future<bool> deleteGroup() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('group');
  }
}
