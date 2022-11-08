import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AssetsImage extends StatelessWidget {
  const AssetsImage({super.key});

  @override
  Widget build(BuildContext context) {
    const urlImaige = 'assets/Bambuk.jpg';
    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16),
      children: [
        Center(
          child: Image.asset(
            urlImaige,
            height: 300,
            width: 300,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
