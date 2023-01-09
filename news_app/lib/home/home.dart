import 'package:flutter/material.dart';
import 'package:news_app/theme/app_colors.dart';
import 'package:news_app/theme/app_text_style.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text('Жаңылыктар', style: AppTextStyle.fortextStyle),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: AppColors.forAppColorGreen,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: AppColors.forAppColorGreen,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: AppColors.forAppColorGreen,
              ),
            ),
          ],
          elevation: 1,
        ),
        body: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              Material(
                child: Container(
                  height: 55,
                  color: AppColors.forAppColorWhite,
                  child: const TabBar(
                    labelStyle: AppTextStyle.textLabelStyle,
                    physics: ClampingScrollPhysics(),
                    padding: EdgeInsets.all(10),
                    labelColor: AppColors.labelColor,
                    unselectedLabelColor: Colors.grey,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.green,
                    tabs: [
                      Tab(
                        text: 'АКТУАЛДУУ',
                      ),
                      Tab(text: 'ВИДЕО'),
                      Tab(text: 'ПАЙДАЛУУ')
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: TabBarView(children: [
                ListView.builder(
                  padding: const EdgeInsets.all(0),
                  itemCount: 20,
                  itemBuilder: ((context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.grey))),
                      child: ListTile(
                        onTap: (() {}),
                        leading: const Image(
                            image: AssetImage('assets/images/ITImage.jpg')),
                        title: Text(
                            'Айтишниктер чачтан көп бирок Айти компанияларга бул жетишсиз $index'),
                        subtitle: const Text('17.12.2022 | көрүүчү:8600'),
                      ),
                    );
                  }),
                ),
                ListView.builder(
                  padding: const EdgeInsets.all(15),
                  itemCount: 20,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      onTap: (() {}),
                      leading: const Image(
                          image: AssetImage('assets/images/googleImage.jpg')),
                      title: Text(
                          'Google корпорациясы дүйнөдө болуп көрбөгөндөй технология чыгарды $index'),
                      subtitle: const Text('17.12.2022 | көрүүчү:1950'),
                    );
                  }),
                ),
                ListView.builder(
                  padding: const EdgeInsets.all(15),
                  itemCount: 20,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      onTap: (() {}),
                      leading: const Image(
                          image: AssetImage(
                              'assets/images/ITTechnologyImage.jpg')),
                      title: Text(
                          'Кыргызстанда Айти окуу активдүү орун алууда $index'),
                      subtitle: const Text('17.12.2022 | көрүүчү:12000'),
                    );
                  }),
                ),
              ]))
            ],
          ),
        ));
  }
}
