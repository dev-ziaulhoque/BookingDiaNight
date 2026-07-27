import 'package:flutter/material.dart';

class CommonGradient {
  static const LinearGradient darkBackgroundGradient = LinearGradient(
    colors: [
      Color(0xFF311D01),
      Color(0xFF070200),
      Color(0xFF1C0F01),
      Color(0xFF311D01),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient lightBackgroundGradient = LinearGradient(
    colors: [
      Color(0xFFFFFFFF),
      Color(0xFFEFDDBD),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient buttonGradient = LinearGradient(
    colors: [
      Color(0xFFE6CA6E),
      Color(0xFF775806),
    ],
    begin: Alignment.topLeft,
    end: Alignment.centerRight,
    stops: [0.0, 1.0],
  );
}
