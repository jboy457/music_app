import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/images.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
    required this.radius,
    required this.iconWidth,
    required this.iconHeight,
  }) : super(key: key);

  final double radius;
  final double iconWidth;
  final double iconHeight;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: AppColors.brown.withOpacity(0.19),
      child: Image.asset(AppImages.profile,
        width: iconWidth,
        height: iconHeight,
      ),
    );
  }
}
