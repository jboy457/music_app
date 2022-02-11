import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:music_app/constants/fonts.dart';
import 'package:music_app/modules/home/models/song.dart';

class SongCard extends StatelessWidget {
  const SongCard(
      {Key? key,
      required this.song,
      required this.width,
      required this.height,
      this.onPressed})
      : super(key: key);

  final Song song;
  final double height;
  final double width;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    double _sigmaX = 10;
    double _sigmaY = 10;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        margin: const EdgeInsets.only(
          right: 20,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(song.thumbnail!)),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.white.withOpacity(0.3),
                    height: 50,
                    width: width - 20,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: _sigmaX,
                        sigmaY: _sigmaY,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            song.name!,
                            style: AppFonts.fontStyle(
                              weight: FontWeight.w600,
                              color: Colors.white,
                              size: 13,
                            ),
                          ),
                          Text(
                            song.genre!,
                            style: AppFonts.fontStyle(
                              weight: FontWeight.w400,
                              color: Colors.white.withOpacity(0.62),
                              size: 10,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
