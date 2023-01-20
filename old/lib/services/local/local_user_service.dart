import 'package:shared_preferences/shared_preferences.dart';

class LocalUserService {
  static Future<bool> setUser(user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('user', user);
  }

  static Future<String> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user = prefs.getString('user');
    return user;
  }

  static Future<bool> deleteUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('user');
  }
}
