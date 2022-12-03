import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_google_play/constants/app_colors.dart';
import 'package:to_google_play/constants/text_style.dart';
import 'package:to_google_play/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppBar(),
      body: Body(),
    );
  }

  AppBar BuildAppBar() {
    return AppBar(
      leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: AppColors.menuColor,
          )),
      actions: [
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/scan.svg',
              color: AppColors.scanColor,
            )),
        const Center(
          child: Text(
            'Scan',
            style: AppTextStyle.scanTextStyle,
          ),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }
}
