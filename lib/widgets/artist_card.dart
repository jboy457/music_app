import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/constants/icons.dart';

import '../constants/colors.dart';
import '../constants/fonts.dart';
import '../constants/images.dart';
import '../modules/home/models/artist.dart';

class ArtistCard extends StatelessWidget {
  const ArtistCard({
    Key? key,
    required this.width,
    required this.color,
    required this.artist,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;
  final Color color;
  final Artist artist;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15)),
          margin: const EdgeInsets.only(
            right: 20,
          ),
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(artist.imageUrl!),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    artist.name!,
                    style: AppFonts.fontStyle(
                      size: 16,
                      weight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                      text: TextSpan(
                    children: [
                      WidgetSpan(
                          child: Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Image.asset(
                          AppImages.song,
                          width: 14,
                          height: 18,
                        ),
                      )),
                      TextSpan(
                        text: artist.song!,
                        style: AppFonts.fontStyle(
                          size: 14,
                          weight: FontWeight.normal,
                          color: AppColors.lightgrey,
                        ),
                      ),
                    ],
                  ))
                ],
              )
            ],
          ),
        ),
        Positioned(
          right: 5,
          bottom: -3,
          child: Container(
            width: 30,
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Container(
              width: 25,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.grey,
              ),
              padding: const EdgeInsets.all(6),
              child: SvgPicture.asset(
                AppIcons.start,
                width: 20,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
