import 'package:shared_preferences/shared_preferences.dart';

class LocalSessionService {
  static Future<bool> setSession(String session) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('session', session);
  }

  static getSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var session = prefs.getString('session');
    return session;
  }

  static Future<bool> deletesession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('session');
  }
}
