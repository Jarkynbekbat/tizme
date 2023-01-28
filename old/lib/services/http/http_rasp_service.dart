import 'dart:convert';

import 'package:http/http.dart' as http;
import '../local/local_rasp_service.dart';

class HttpRaspService {
  static Future<Map<String, dynamic>> getRaspAndGroupByCypher(cypher) async {
    var url = 'https://stud.unitedyouth.org.kg/api/cypher.php?login=$cypher';
    var httpResponse = await http.get(url);
    Map<String, dynamic> jsonResponse = json.decode(utf8.decode(httpResponse.bodyBytes));
    await LocalRaspService.setRasp(utf8.decode(httpResponse.bodyBytes));
    return jsonResponse;
  }
}