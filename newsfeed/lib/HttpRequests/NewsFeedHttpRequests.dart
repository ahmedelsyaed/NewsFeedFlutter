import 'package:newsfeed/Model/NewsFeed.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'HttpRequestBase.dart';

class NewsFeedHttpRequests extends HttpRequestBase {
  static NewsFeedHttpRequests? _instance;
  NewsFeedHttpRequests._(); // named constructor

  static NewsFeedHttpRequests get getInstance =>
      _instance = _instance ?? NewsFeedHttpRequests._();

  Future<NewsFeed> fetchNews(String source) async {
    prepareHeader();
    var url = apiUrl + source + "&apiKey=" + apiKey;

    var uri = Uri.parse(url);
    print(url);
    final response = await client.get(uri, headers: headers);
    if (response.statusCode == 200) {
      return NewsFeed.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed');
    }
  }
}
