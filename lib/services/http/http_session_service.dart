import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:new_rasp_app/services/local/local_session_service.dart';

class HttpSessionService {
  static getSession(cypher) async {
    String url = 'https://rasp.homestroy.kg/api/search.php?session=$cypher';
    Response response = await http.get(url);
    Map<String, dynamic> mapObj = json.decode(utf8.decode(response.bodyBytes));

    await LocalSessionService.setSession(utf8.decode(response.bodyBytes));
    return mapObj;
  }
}
