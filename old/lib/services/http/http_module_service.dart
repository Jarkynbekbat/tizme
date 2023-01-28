import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../local/local_module_service.dart';

class HttpModuleService {
  static getModule(cypher) async {
    String url = 'https://stud.unitedyouth.org.kg/api/search.php?modul=$cypher';
    Response response = await http.get(url);
    Map<String, dynamic> mapObj = json.decode(utf8.decode(response.bodyBytes));

    await LocalModuleService.setModule(utf8.decode(response.bodyBytes));
    return mapObj;
  }
}