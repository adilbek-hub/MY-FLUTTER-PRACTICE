import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_practice_with_text/constants/api_const.dart';
import 'package:news_app_practice_with_text/model/top_news.dart';

class TopNewsRepo {
  final http.Client client = http.Client();

  Future<TopNews?> fetchData() async {
    final Uri url = Uri.parse(ApiConst.newsAPI);
    final http.Response response = await client.get(url);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      final topNews = TopNews.FromJson(data);
      return topNews;
    }
  }
}
