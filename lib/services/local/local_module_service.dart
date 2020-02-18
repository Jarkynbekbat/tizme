import 'package:shared_preferences/shared_preferences.dart';

class LocalModuleService {
  static Future<bool> setModule(String module) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('module', module);
  }

  static getModule() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String module = prefs.getString('module');
    return module;
  }

  static Future<bool> deleteModule() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('module');
  }
}
