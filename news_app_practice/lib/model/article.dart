import 'package:news_app_practice/model/Source_api.dart';

class Article {
  Article(
      {this.source,
      this.author,
      required this.title,
      required this.description,
      this.url,
      this.urlToImage,
      required this.publishedAt,
      required this.content});

  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.FromJson(json['source']),
      title: json['title'],
      description: json['description'],
      publishedAt: json['publishedAt'],
      author: json['author'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      content: json['content'],
    );
  }
}
