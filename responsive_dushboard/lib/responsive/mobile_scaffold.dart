import 'package:flutter/material.dart';
import 'package:responsive_dushboard/constants/constants.dart';
import 'package:responsive_dushboard/utils_classtar/myContainerBoxs.dart';
import 'package:responsive_dushboard/utils_classtar/myTile.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({super.key});

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      backgroundColor: myDefaultBackground,
      drawer: myDrawer,
      body: Column(
        children: [
          // 4 box on the top
          AspectRatio(
            aspectRatio: 1,
            child: SizedBox(
              width: double.infinity,
              child: GridView.builder(
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: ((context, index) {
                    return const MyBox();
                  })),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: ((context, index) {
                    return const MyTile();
                  })))
        ],
      ),
    );
  }
}
