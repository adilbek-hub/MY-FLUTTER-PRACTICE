import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_with_bloc2/bloc/news_bloc.dart';
import 'package:news_app_with_bloc2/components/loading_widget.dart';
import 'package:news_app_with_bloc2/models/news_model.dart';
import 'package:news_app_with_bloc2/repo/news_sevice.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc(newsService)..add(const NewsFetchEvent()),
      child: NewsView(),
    );
  }
}

class NewsView extends StatelessWidget {
  const NewsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('News Page'),
        actions: [
          PopupMenuButton<String>(onSelected: (String item) {
            context.read<NewsBloc>().add(NewsFetchEvent(item));
          }, itemBuilder: (context) {
            return <String>['us', 'ru', 'fr', 'tr', 'ar', 'kr', 'uk']
                .map((e) => PopupMenuItem<String>(value: e, child: Text(e)))
                .toList();
          })
        ],
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading) {
            return const LoadingWidget();
          } else if (state is NewsSuccess) {
            return NewsSuccessWidget(state.news);
          } else if (state is NewsError) {
            return ErrorWidget(state.text);
          } else {
            return const Text('Kata');
          }
        },
      ),
    );
  }
}

class NewsSuccessWidget extends StatelessWidget {
  const NewsSuccessWidget(
    this.news, {
    super.key,
  });
  final List<News> news;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: news.length,
        itemBuilder: ((context, index) {
          final newsItem = news[index];
          return Card(
            child: ListTile(
              title: Text(newsItem.title),
            ),
          );
        }));
  }
}
