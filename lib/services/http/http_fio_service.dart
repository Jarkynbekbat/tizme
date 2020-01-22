import 'package:http/http.dart' as http;

class HttpFioService {
  static getFio(url) async {
    var url2 = 'https://rasp.homestroy.kg/api/cypher.php?log=$url';
    return await http.get(url2);
  }
}
