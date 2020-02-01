import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:new_rasp_app/services/local/local_module_service.dart';

class HttpModuleService {
  static getModule(cypher) async {
    String url = 'https://rasp.homestroy.kg/api/search.php?modul=$cypher';
    Response response = await http.get(url);
    Map<String, dynamic> mapObj = json.decode(utf8.decode(response.bodyBytes));
    String modules = mapObj[mapObj.keys.first].toString();
    await LocalModuleService.setModule(modules);
    return mapObj;
  }
}
