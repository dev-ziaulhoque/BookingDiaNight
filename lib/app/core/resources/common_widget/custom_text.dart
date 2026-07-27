// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bookdianight_app/app/core/extentions/theme_extention.dart';


class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final FontWeight fontWeight;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final double? decorationThickness;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLine;
  final double? height;
  final TextStyle? style;
  final double? letterSpacing;
  final Function()? onTap;

  final bool isGradient;
  final Gradient? gradient;

  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 12,
    this.color,
    this.fontWeight = FontWeight.normal,
    this.decoration = TextDecoration.none,
    this.decorationColor,
    this.decorationThickness = 2,
    this.textAlign = TextAlign.start,
    this.overflow,
    this.maxLine,
    this.style,
    this.height,
    this.letterSpacing,
    this.onTap,
    this.isGradient = false,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double scale = (screenWidth / 375.0).clamp(0.85, 1.4);

    double responsiveSize = (fontSize * scale).clamp(10.0, 28.0);

    // Create the base text widget
    Widget textWidget = Text(
      text,
      maxLines: maxLine,
      overflow: overflow,
      textAlign: textAlign,
      style: style ??
          GoogleFonts.poppins(
            fontSize: responsiveSize,
            height: height,
            letterSpacing: letterSpacing,
            color: (isGradient && gradient != null)
                ? Colors.white
                : (color ?? context.textColor),
            fontWeight: fontWeight,
            decoration: decoration,
            decorationColor: decorationColor ?? Colors.black,
            decorationThickness: decorationThickness,
          ),
    );

    // Logic: Apply ShaderMask if isGradient is true
    if (isGradient && gradient != null) {
      textWidget = ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (bounds) {
          return gradient!.createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          );
        },
        child: textWidget,
      );
    }

    return InkWell(
      onTap: onTap,
      child: textWidget,
    );
  }
}