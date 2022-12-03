class Products {
  Products(
      {required this.price,
      required this.id,
      required this.title,
      required this.category,
      required this.image,
      required this.subTitle,
      required this.description});

  final int price;
  final String id, title, category, image, subTitle, description;

  // it create an category from JSON
  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
        price: json['price'],
        id: json['id'],
        title: json['title'],
        category: json['category'],
        image: json['image'],
        subTitle: json['subTitle'],
        description: json['description']);
  }
}

//Our Demo product
Products products = Products(
    price: 1600,
    id: '1',
    title: 'Wood Frame',
    category: 'Chair',
    image: 'assets/images/stol.png',
    subTitle: 'tietor Armchair',
    description: description);

String description =
    'This armchair is an elegant and functional piese of furniture. It is suitable for family';
