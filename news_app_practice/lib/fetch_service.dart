import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_practice/constants/constant_api.dart';
import 'package:news_app_practice/model/top_news.dart';

class TopNewsRepo {
  //http paketindegi baardyk nerselerdi koldonom
  final http.Client client = http.Client();
  //npoint aluuga future menen ishteybiz / Future TopNews kaytarat
  Future<TopNews?> fetchTopNews() async {
    //get ichine Uri alat anda biz uri tuzolu jana uri .parse String alat/ urini get ke berip koyobuz
    final uri = Uri.parse(ApiConstants.topNews);
    final http.Response response = await client.get(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      // print(data);
      final topNews = TopNews.fromJson(data);
      // print(topNews);
      // print(topNews.runtimeType);
      return topNews;
    }
  }
}
