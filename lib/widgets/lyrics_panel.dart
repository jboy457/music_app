import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../constants/colors.dart';
import '../constants/fonts.dart';
import '../constants/icons.dart';

class LyricsPanel extends StatelessWidget {
  const LyricsPanel({
    Key? key,
    this.sigmaX,
    this.sigmaY,
    this.height,
    this.width,
  }) : super(key: key);

  final double? sigmaX;
  final double? sigmaY;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(26.0),
          topRight: Radius.circular(26.0),
        ),
        boxShadow: [
          BoxShadow(
              blurRadius: 8.0,
              offset: const Offset(2, -7),
              color: const Color.fromRGBO(0, 0, 0, 0.25).withOpacity(0.1)),
        ],
        maxHeight: height! * 0.6,
        minHeight: width! > 450 ? height! * 0.10 : height! * 0.1,
        color: Colors.transparent,
        // panel: Container(),
        panel: Container(
          color: Colors.white.withOpacity(0.8),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: sigmaX!,
                sigmaY: sigmaY!,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: width! * 0.05,
                  vertical: height! * 0.02,
                ),
                decoration: BoxDecoration(
                  color: AppColors.lightgrey.withOpacity(0.05),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(26.0),
                    topRight: Radius.circular(26.0),
                  ),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            WidgetSpan(
                                child: Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: SvgPicture.asset(
                                AppIcons.lyrics,
                              ),
                            )),
                            TextSpan(
                                text: 'Lyrics',
                                style: AppFonts.fontStyle(
                                  color: AppColors.grey,
                                  weight: FontWeight.w700,
                                  size: 19,
                                ))
                          ])),
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.white,
                            child: SvgPicture.asset(
                              AppIcons.up,
                              width: 15,
                            ),
                          )
                        ]),
                    SizedBox(
                      height: height! * 0.47,
                      child: SingleChildScrollView(
                        child: RichText(
                          text: TextSpan(
                              style: AppFonts.fontStyle(
                                  color: AppColors.lightgrey,
                                  size: width! > 450 ? 40 : 23,
                                  lineHeight: 2),
                              children: [
                                TextSpan(
                                    text:
                                        'Lately, I think of you lots \'Cause my mind\'s in circles for you \nPlease ',
                                    style: AppFonts.fontStyle(
                                        color: AppColors.grey,
                                        weight: FontWeight.w800,
                                        lineHeight: 2)),
                                TextSpan(
                                  style: AppFonts.fontStyle(
                                      color: AppColors.lightgrey,
                                      weight: FontWeight.w700,
                                      lineHeight: 2),
                                  text:
                                      'connect the dots And bring me, bring me to you \'Cause you bring out the freak in meIt\'s only for you',
                                )
                              ]),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
