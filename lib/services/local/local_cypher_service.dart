import 'package:shared_preferences/shared_preferences.dart';

class LocalCypherService {
  static Future<bool> setCypher(cypher) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('cypher', cypher);
  }

  static Future<String> getCypher() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var cypher = prefs.getString('cypher');
    return cypher;
  }

  static Future<bool> deleteCypher() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('cypher');
  }
}
