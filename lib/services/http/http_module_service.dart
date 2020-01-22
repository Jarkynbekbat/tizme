import 'package:http/http.dart' as http;

class HttpModuleService {
  static getModule() async {
    String url = 'https://rasp.homestroy.kg/api/search.php?modul=16/3002';
    return http.get(url);
  }
}
