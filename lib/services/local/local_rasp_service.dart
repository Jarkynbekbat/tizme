import 'package:shared_preferences/shared_preferences.dart';

class LocalRaspService {
  static Future<bool> setRasp(rasp) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('rasp', rasp);
  }

  static getRasp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var rasp = prefs.getString('rasp');
    return rasp;
  }

  static Future<bool> deleteRasp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('rasp');
  }
}
