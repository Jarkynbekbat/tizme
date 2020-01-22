import 'package:http/http.dart' as http;

class HttpQuoteService {
  static getQuote() async {
    String url = "https://family.homestroy.kg/api/letter.php";
    return await http.get(url);
  }
}
