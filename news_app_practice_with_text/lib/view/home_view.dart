import 'package:flutter/material.dart';
import 'package:news_app_practice_with_text/constants/api_const.dart';
import 'package:news_app_practice_with_text/model/top_news.dart';
import 'package:news_app_practice_with_text/services/fetch_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TopNews? topNews;

  Future<void> fetchNews() async {
    topNews = await TopNewsRepo().fetchData();
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
          title: Text('data'),
        ),
        body: TopNews == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: topNews!.articles.length,
                itemBuilder: ((context, index) {
                  final news = topNews!.articles[index];
                  return Card(
                    child: ListTile(
                      // leading:
                      //     Image.network(news.urlToImage ?? ApiConst.newsImage),
                      title: Text(news.title),
                    ),
                  );
                })));
  }
}
