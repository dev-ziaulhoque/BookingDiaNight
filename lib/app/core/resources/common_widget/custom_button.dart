import 'package:bookdianight_app/app/core/resources/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bookdianight_app/app/core/resources/common_style/common_gradient.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final bool isLoading;
  final double width;
  final double paddingVertical;
  final double? borderRadius;
  final Color? buttonColor;
  final double fontSize;
  final BoxBorder? border;
  final Color? titleColor;
  final Widget? widget;
  final bool? isGradient;

  const CustomButton({
    super.key,
    required this.title,
    this.onTap,
    this.isLoading = false,
    this.width = double.infinity,
    this.paddingVertical = 12.0,
    this.borderRadius,
    this.buttonColor,
    this.border,
    this.titleColor = Colors.white,
    this.widget,
    this.fontSize = 16.0,
    this.isGradient = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null : onTap,
      borderRadius: BorderRadius.circular(borderRadius ?? 40),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: width,
        padding: EdgeInsets.symmetric(vertical: paddingVertical),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 40),
          border: border,
          color: buttonColor,
          gradient: isGradient == true
              ? AppColors.mainButtonGradient
              : null,
        ),
        child: isLoading
            ? const SizedBox(
          height: 23,
          width: 23,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: Colors.white,
          ),
        )
            : widget ??
            Text(
              title,
              style: GoogleFonts.dmSans(
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
                color: titleColor,
              ),
            ),
      ),
    );
  }
}