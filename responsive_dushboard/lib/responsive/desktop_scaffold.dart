import 'package:flutter/material.dart';
import 'package:responsive_dushboard/constants/constants.dart';
import 'package:responsive_dushboard/utils_classtar/myContainerBoxs.dart';
import 'package:responsive_dushboard/utils_classtar/myTile.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({super.key});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myDefaultBackground,
      appBar: myAppBar,
      body: Row(
        children: [
          //open drawer
          myDrawer,
          Expanded(
            flex: 2,
            child: Column(
              children: [
                // 4 box on the top
                AspectRatio(
                  aspectRatio: 1,
                  child: SizedBox(
                    width: double.infinity,
                    child: GridView.builder(
                        itemCount: 4,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
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
          ),
          Expanded(
              child: Column(
            children: [
              Expanded(
                  child: Container(
                color: Colors.yellow[600],
              ))
            ],
          ))
        ],
      ),
    );
  }
}
