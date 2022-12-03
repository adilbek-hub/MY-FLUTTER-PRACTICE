import 'dart:convert';

class Category {
  Category(
      {required this.id,
      required this.title,
      required this.image,
      required this.numOfProduct});
  final String id, title, image;
  final int numOfProduct;

  //it creates an Category from JSON
  factory Category.FromJson(Map<String, dynamic> json) {
    return Category(
        id: json['id'],
        title: json['title'],
        image: json['image'],
        numOfProduct: json['numOfProduct']);
  }

  
}

// our demo Category
Category category = Category(
    id: '1',
    title: 'armchair',
    image: 'assets/images/stol.png',
    numOfProduct: 100);
