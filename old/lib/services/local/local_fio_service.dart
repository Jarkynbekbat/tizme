import 'package:shared_preferences/shared_preferences.dart';

class LocalFioService {
  static Future<bool> setFio(fio) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('fio', fio);
  }

  static Future<String> getFio() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var fio = prefs.getString('fio');
    return fio;
  }

  static Future<bool> deleteFio() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('fio');
  }
}
