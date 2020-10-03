import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../local/local_quote_service.dart';

class HttpQuoteService {
  static getQuote() async {
    String url = "https://family.homestroy.kg/api/letter.php";
    Response response = await http.get(url);
    await LocalQuoteService.setQuote(response);
    return await LocalQuoteService.getQuote();
  }
}
