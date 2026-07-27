import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../app_colors/App_Colors.dart';

enum LoaderType {
  threeArchedCircle,
  dotsTriangle,
  waveDots,
  staggeredDots,
  inkDrop,
}

class CustomAnimationLoader extends StatelessWidget {
  final LoaderType type;
  final double size;
  final Color color;

  const CustomAnimationLoader({
    super.key,
    this.type = LoaderType.threeArchedCircle,
    this.size = 45,
    this.color = AppColors.mainColor,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case LoaderType.dotsTriangle:
        return LoadingAnimationWidget.dotsTriangle(
          color: color,
          size: size,
        );

      case LoaderType.waveDots:
        return LoadingAnimationWidget.waveDots(
          color: color,
          size: size,
        );

      case LoaderType.staggeredDots:
        return LoadingAnimationWidget.staggeredDotsWave(
          color: color,
          size: size,
        );

      case LoaderType.inkDrop:
        return LoadingAnimationWidget.inkDrop(
          color: color,
          size: size,
        );

      case LoaderType.threeArchedCircle:
      default:
        return LoadingAnimationWidget.threeArchedCircle(
          color: color,
          size: size,
        );
    }
  }
}