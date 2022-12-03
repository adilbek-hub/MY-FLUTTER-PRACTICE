import 'package:flutter/material.dart';

import '../constants/text_style.dart';

class TitleText extends StatelessWidget {
  const TitleText({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyle.appTextStyle,
    );
  }
}
