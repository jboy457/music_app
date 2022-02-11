import 'package:flutter/cupertino.dart';

class AppFonts {
  static TextStyle fontStyle(
      {double? size, FontWeight? weight, Color? color, double? lineHeight}) {
    return TextStyle(
      letterSpacing: 0.5,
      fontFamily: 'Metropolis',
      fontSize: size,
      fontWeight: weight,
      color: color,
      height: lineHeight ?? 1,
    );
  }
}
