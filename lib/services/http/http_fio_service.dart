import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:new_rasp_app/services/local/local_fio_service.dart';

class HttpFioService {
  static getFio(url) async {
    String url2 = 'https://rasp.homestroy.kg/api/cypher.php?log=$url';
    Response response = await http.get(url2);
    Map<String, dynamic> mapFio = json.decode(utf8.decode(response.bodyBytes));
    String fio = mapFio['stud'][0]['studNm'];
    //сохраняю ФИО локально
    await LocalFioService.setFio(fio);
    return fio;
  }
}
