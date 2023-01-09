class News {
  News(
      {this.author,
      required this.title,
      required this.description,
      this.urlToImage,
      this.content});
  final String? author;
  final String title;
  final String? description;
  final String? urlToImage;

  final String? content;

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      author: json['author'] != null ? json['author'] as String : null,
      title: json['title'] as String,
      description:
          json['description'] != null ? json['description'] as String : null,
      urlToImage:
          json['urlToImage'] != null ? json['urlToImage'] as String : null,
      content: json['content'] != null ? json['content'] as String : null,
    );
  }
}
