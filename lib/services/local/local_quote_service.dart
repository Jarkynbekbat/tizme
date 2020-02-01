import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalQuoteService {
  static Future<bool> setQuote(quote) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var quoteJson = json.decode(utf8.decode(quote.bodyBytes));
    String quoteString =
        ' ${quoteJson['letters'][0]['titles']}/${quoteJson['letters'][0]['detail']}';
    return prefs.setString('quote', quoteString);
  }

  static getQuote() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var quote = prefs.getString('quote');
    return quote;
  }

  static Future<bool> deleteQuote() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('quote');
  }
}
