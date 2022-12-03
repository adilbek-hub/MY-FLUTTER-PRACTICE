import 'package:flutter/material.dart';
import 'package:to_google_play/constants/app_colors.dart';
import 'package:to_google_play/constants/text_style.dart';
import 'package:to_google_play/models/categories.dart';
import 'package:to_google_play/screens/home/components/category_card.dart';

import '../../../components/title_text.dart';
import '../../../services/fatch_categories.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    //it enables scrolling => это позволяет прокручивать
    return FutureBuilder(
        future: fetchCategories(),
        builder: (context, snapshot) => snapshot.hasData
            ? Categories(
                categories: [],
              )
            : Center(child: CircularProgressIndicator()));
  }
}

class Categories extends StatelessWidget {
  const Categories({Key? key, required this.category}) : super(key: key);
  final List<Category> category;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: TitleText(
              title: 'Browse by Category',
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                CategoryCard(
                 categories: ,
                ),
                CategoryCard(
                  categories: category,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // static fromJson(data) {}
}
