import 'dart:ui';
import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/fonts.dart';
import '../constants/images.dart';

import 'action.dart';

class SongMiniPreview extends StatelessWidget {
  const SongMiniPreview({
    Key? key,
    this.sigmaX,
    this.sigmaY,
    this.height,
    this.width,
  }) : super(key: key);

  final double? sigmaX;
  final double? sigmaY;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(26.0),
          topRight: Radius.circular(26.0),
        ),
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
      ),
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
            color: Colors.white.withOpacity(0.6),
            child: Column(children: [
              Container(
                height: height! * 0.1,
                padding: EdgeInsets.only(
                  top: width! * 0.06,
                  left: height! * 0.03,
                  right: height! * 0.03,
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              AppImages.thumbnail3,
                              width: 46,
                              height: 46,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Amused City',
                                style: AppFonts.fontStyle(
                                  weight: FontWeight.w700,
                                  size: 16,
                                  color: AppColors.grey,
                                ),
                              ),
                              Text(
                                'Vanel Ghart',
                                style: AppFonts.fontStyle(
                                  weight: FontWeight.w400,
                                  size: 12,
                                  color: AppColors.lightgrey,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      const Icon(Icons.favorite),
                    ]),
              ),
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationX(math.pi),
                child: CustomPaint(
                  painter: ShapesPainter(),
                  child: SizedBox(
                    width: width!,
                    height: height! * 0.16,
                    child: PlayAction(
                      width: width! * 0.6,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

const double _kCurveHeight = 35;

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Path();
    p.lineTo(0, size.height - _kCurveHeight);
    p.relativeQuadraticBezierTo(
        size.width / 2, 1 * _kCurveHeight, size.width, 1);
    p.lineTo(size.width, -5);
    p.lineTo(-5, -5);
    p.close();

    canvas.drawPath(p, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
