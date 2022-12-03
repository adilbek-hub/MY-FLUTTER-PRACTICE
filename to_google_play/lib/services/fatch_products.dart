import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:to_google_play/models/Products.dart';

//fetch our products from API
final http.Client client = http.Client();
Future<List<Products>> fatchProducts() async {
  final Uri uri =
      Uri.parse('https://5f210aa42f001666535e.mockapi.io/api/products');
  final response = await http.get(uri);
  if (response.statusCode == 200) {
    List<Products> product = (json.decode(response.body) as List)
        .map((data) => Products.fromJson(data))
        .toList();
    return product;
  } else {
    // if the server did not return a 200 ok response,
    // then throw an exception
    throw Exception('Filed to load');
  }
}
