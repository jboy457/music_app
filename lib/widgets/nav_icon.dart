import 'package:flutter/material.dart';

import '../constants/colors.dart';

class NavIcon extends StatelessWidget {
  const NavIcon({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final Widget icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: CircleAvatar(
          backgroundColor: AppColors.purple.withOpacity(0.19),
          radius: 23,
          child: icon),
    );
  }
}
