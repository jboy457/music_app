import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_app/constants/icons.dart';
import 'package:music_app/constants/images.dart';

class PlayAction extends StatelessWidget {
  const PlayAction({
    Key? key,
    this.width,
  }) : super(key: key);

  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.only(
        bottom: 15.0,
        left: 15.0,
        right: 15.0,
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppIcons.skipPrevios,
            ),
            CircleAvatar(
                radius: 35,
                backgroundColor: Colors.white,
                backgroundImage: const AssetImage(AppImages.play),
                child: SvgPicture.asset(
                  AppIcons.start,
                  width: 30,
                )),
            SvgPicture.asset(
              AppIcons.skipNext,
            ),
          ]),
    );
  }
}
