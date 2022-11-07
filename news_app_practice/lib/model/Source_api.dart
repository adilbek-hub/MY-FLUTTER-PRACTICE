class Source {
  Source({this.id, this.name});
  final String? id;
  final String? name;

  factory Source.FromJson(Map<String, dynamic> json) {
    return Source(id: json['id'], name: json['name']);
  }
}
