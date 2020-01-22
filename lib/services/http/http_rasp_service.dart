import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpRaspService {
  static getRaspAndGroupByCypher(cypher) async {
    var url = 'https://rasp.homestroy.kg/api/cypher.php?login=$cypher';
    var httpResponse = await http.get(url);
    //response.bodyBytes to json
    Map<String, dynamic> jsonResponse =
        json.decode(utf8.decode(httpResponse.bodyBytes));
    return jsonResponse;
  }
}
