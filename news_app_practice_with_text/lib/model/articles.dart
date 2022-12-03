import 'package:news_app_practice_with_text/model/source.dart';

class Articles {
  const Articles(
      {required this.source,
      this.author,
      required this.title,
      required this.description,
      required this.url,
      this.urlToImage,
      required this.publishedAt,
      this.content});

  final Source source;
  final String? author;
  final String title;
  final String description;
  final String url;
  final String? urlToImage;
  final String publishedAt;
  final String? content;
}
