import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:to_google_play/models/Products.dart';

import '../models/Categories.dart';

//fetch our products from API
final http.Client client = http.Client();
Future<List<Category>> fetchCategories() async {
  final Uri uri =
      Uri.parse('https://5f210aa42f001666535e.mockapi.io/api/products');
  final response = await http.get(uri);
  if (response.statusCode == 200) {
    List<Category> category =
        (json.decode(response.body)).map((data) => Category.FromJson(data));
    // .toList();
    return category;
  } else {
    // if the server did not return a 200 ok response,
    // then throw an exception
    throw Exception('Filed to load');
  }
}
