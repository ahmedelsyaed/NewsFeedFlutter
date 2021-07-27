import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpRequestBase {
  var client = new http.Client();
  String apiUrl = "https://newsapi.org/v1/articles?source=";
  String apiKey = "28a7c52891c64ddea94950ba21ae2e3e";
  late Map<String, String> headers;
  prepareHeader() {
    headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
  }
}
