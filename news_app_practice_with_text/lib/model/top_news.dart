import 'package:news_app_practice_with_text/model/articles.dart';

class TopNews {
  const TopNews(
      {required this.status,
      required this.totalResults,
      required this.articles});

  final String status;
  final int totalResults;
  final List<Articles> articles;

  factory TopNews.FromJson(Map<String, dynamic> json) {
    return TopNews(
        status: json['status'],
        totalResults: json['totalResults'],
        articles: json['articles']);
  }
}
