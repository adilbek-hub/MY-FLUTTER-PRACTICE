import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_app_practice/fetch_service.dart';
import 'package:news_app_practice/model/Source_api.dart';
import 'package:news_app_practice/model/article.dart';
import 'package:news_app_practice/model/top_news.dart';
import 'package:news_app_practice/constants/constant_api.dart';
import 'package:news_app_practice/app/app.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TopNews? topNews;

  Future<void> fetchNews() async {
    topNews = await TopNewsRepo().fetchTopNews();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Practice',
            style: TextStyle(color: Colors.red, fontSize: 20),
          ),
        ),
        body: topNews == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: topNews!.articles.length,
                itemBuilder: (contex, index) {
                  final news = topNews!.articles[index];
                  return Card(
                    child: Row(
                      children: [
                        Expanded(
                            child: Image.network(news.urlToImage ??
                                ApiConstants.errorNewsImages))
                      ],
                    ),
                  );
                }));
  }
}
