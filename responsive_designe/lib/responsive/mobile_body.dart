import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyMobileBody extends StatelessWidget {
  const MyMobileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[400],
      appBar: AppBar(
        // backgroundColor: Colors.pinkAccent,
        title: Text(
          'M O B I L E',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
    );
  }
}
