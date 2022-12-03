import 'package:flutter/material.dart';
import 'package:to_google_play/models/categories.dart';

import '../../../components/title_text.dart';
import '../../../constants/app_colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, required this.categories}) : super(key: key);
  final Category categories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        width: 205,
        child: AspectRatio(
          aspectRatio: 0.83,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              // this is custom shape
              ClipPath(
                clipper: CategoryCustomShape(),
                child: AspectRatio(
                  aspectRatio: 1.025,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    color: AppColors.secondaryColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TitleText(title: category.title),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          '${category.numOfProduct} + Products',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 250, 18, 1)
                                  .withOpacity(0.6)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: AspectRatio(
                    aspectRatio: 1.15,
                    child: FadeInImage.assetNetwork(
                        placeholder: 'assets/spinner.gif',
                        image:
                            'assets/images/pintsetydlyanarashchivaniyaresnitslashmakeripintsety.png'),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryCustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double height = size.height;
    double width = size.width;
    double cornerSize = 30;
    path.lineTo(0, height - cornerSize);
    path.quadraticBezierTo(0, height, cornerSize, height);
    path.lineTo(width - cornerSize, height);
    path.quadraticBezierTo(width, height, width, height - cornerSize);
    path.lineTo(width, cornerSize);
    path.quadraticBezierTo(width, 0, width - cornerSize, 0);
    path.lineTo(cornerSize, cornerSize * 0.75);
    path.quadraticBezierTo(0, cornerSize, 0, cornerSize * 2);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
