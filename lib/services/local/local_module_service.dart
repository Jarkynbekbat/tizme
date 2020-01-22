import 'package:shared_preferences/shared_preferences.dart';

class LocalModuleService {
  static Future<bool> setModule(module) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('module', module);
  }

  static getModule() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var module = prefs.getString('module');
    return module;
  }

  static Future<bool> deleteModule() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('module');
  }
}
