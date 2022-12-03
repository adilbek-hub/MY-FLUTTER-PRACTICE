import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AssetsImage extends StatelessWidget {
  const AssetsImage( {super.key});

  @override
  Widget build(BuildContext context) {
    final urlImaige = 'assets/Bambuk.jpg';
    final urlImaige2 = 'assets/Bambuk.jpg';
    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16),
      children: <Widget>[
        Center(
          child: Image.asset(
            urlImaige,
            height: 300,
            width: 300,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
