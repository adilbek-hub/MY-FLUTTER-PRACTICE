import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyDesktopBody extends StatelessWidget {
  const MyDesktopBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[400],
      appBar: AppBar(
        // backgroundColor: Colors.pinkAccent,
        title: Text(
          'D E S K T O P',
        ),
      ),
      body: Row(
        children: [
          // First column
          Expanded(
            child: Column(
              children: [
                // youTube video
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Container(
                      color: Colors.green,
                    ),
                  ),
                ),
                // commend section recomended videos
                Expanded(
                    child: ListView.builder(
                        itemCount: 8,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              color: Colors.green,
                              height: 120,
                            ),
                          );
                        })))
              ],
            ),
          ),
          // Second column
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 200,
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }
}
