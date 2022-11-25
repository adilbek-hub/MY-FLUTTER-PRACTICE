import 'dart:convert';

class TodoModel {
  const TodoModel(
      {required this.title,
      this.description,
      required this.isComplated,
      required this.author});

  final String title;
  final String? description;
  final bool isComplated;
  final String author;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'isComplated': isComplated,
      'author': author,
    };
  }
  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'title': title,
  //     'description': description,
  //     'isComplated': isComplated,
  //     'author': author,
  //   };
  // }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      title: map['title'] as String,
      description: map['description'] as String,
      isComplated: map['isComplated'] as bool,
      author: map['author'] as String,
    );
  }
  // factory TodoModel.fromMap(Map<String, dynamic> map) {
  //   return TodoModel(
  //       title: map['title'],
  //       isComplated: map['isComplated'],
  //       author: map['author'],
  //       description: map['description']);
  // }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
