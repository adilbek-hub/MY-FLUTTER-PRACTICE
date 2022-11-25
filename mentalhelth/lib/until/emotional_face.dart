// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:mentalhelth/constants/app_colors.dart';

class EmotionalFace extends StatelessWidget {
  final IconData icon;
  const EmotionalFace({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.containerColor,
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(10),
      child: Icon(
        icon,
        color: Colors.orange,
      ),
    );
  }
}
