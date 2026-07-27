import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bookdianight_app/app/core/resources/common_widget/custom_text.dart';
import 'package:bookdianight_app/app/core/extentions/theme_extention.dart';
import '../app_colors/App_Colors.dart';

class CustomRadioTile<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String title;
  final String? subtitle;
  final ValueChanged<T?> onChanged;

  /// Styling
  final double height;
  final double borderRadius;
  final double borderWidth;
  final Color? borderColor;
  final Color? selectedBorderColor;
  final Color? backgroundColor;
  final Color? selectedBackgroundColor;
  final Color? activeColor;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final EdgeInsetsGeometry? padding;
  final bool isEnabled;

  const CustomRadioTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.title,
    required this.onChanged,
    this.subtitle,
    this.height = 56,
    this.borderRadius = 12.0,
    this.borderWidth = 1.0,
    this.borderColor,
    this.selectedBorderColor,
    this.backgroundColor,
    this.selectedBackgroundColor,
    this.activeColor,
    this.titleStyle,
    this.subtitleStyle,
    this.padding,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;
    final Color effectiveBorderColor = isSelected
        ? (selectedBorderColor ?? AppColors.mainColor)
        : (borderColor ?? AppColors.borderColor(context));

    final Color effectiveBgColor = isSelected
        ? (selectedBackgroundColor ??
              (selectedBorderColor ?? AppColors.mainColor).withOpacity(0.05))
        : (backgroundColor ?? context.inputColor);

    return GestureDetector(
      onTap: isEnabled ? () => onChanged(value) : null,
      child: Container(
        height: height,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: isEnabled ? effectiveBgColor : Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: isEnabled
                ? effectiveBorderColor
                : Colors.grey.withOpacity(0.3),
            width: borderWidth,
          ),
        ),
        child: Row(
          children: [
            _buildCustomRadioButton(context, isSelected),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: title,
                    fontSize: 14,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    color: isEnabled
                        ? (isSelected
                              ? (activeColor ?? AppColors.mainColor)
                              : AppColors.textColor(context))
                        : Colors.grey,
                    style: titleStyle,
                  ),
                  if (subtitle != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        subtitle!,
                        style:
                            subtitleStyle ??
                            GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomRadioButton(BuildContext context, bool isSelected) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected
              ? (activeColor ?? AppColors.mainColor)
              : Colors.grey.withOpacity(0.5),
          width: 2,
        ),
      ),
      child: isSelected
          ? Center(
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: activeColor ?? AppColors.mainColor,
                ),
              ),
            )
          : null,
    );
  }
}
