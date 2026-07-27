import 'package:flutter/material.dart';
import 'package:bookdianight_app/app/core/resources/common_widget/custom_text.dart';
import 'package:bookdianight_app/app/core/extentions/theme_extention.dart';

import '../app_colors/App_Colors.dart';

class CustomCheckBox extends StatelessWidget {
  final String title;
  final bool isChecked;
  final double size;
  final Color? textColor;
  final Color activeColor;
  final Color inactiveColor;
  final double borderWidth;
  final Function(bool) onChanged;
  final double? fontSize;

  const CustomCheckBox({
    super.key,
    required this.isChecked,
    this.size = 20.0,
    this.activeColor = Colors.pink,
    this.textColor,
    this.inactiveColor = Colors.transparent,
    this.borderWidth = 1.5,
    required this.onChanged,
    required this.title,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {onChanged(!isChecked);},
      child: Row(
        children: [
          Container(
            height: size,
            width: size,
            decoration: BoxDecoration(
              border: Border.all(
                color:isChecked ? activeColor : Colors.white,
                width: borderWidth,
              ),
              borderRadius: BorderRadius.circular(4),
              color: isChecked ? activeColor : Colors.transparent,
            ),
            child: isChecked
                ? Icon(Icons.check, size: size * 0.6, color: Colors.white)
                : null,
          ),
          SizedBox(width: 10),
          CustomText(
            text: title,
            fontSize: fontSize ??  16,
            fontWeight: FontWeight.w500,
            color: textColor ?? context.textColor,
          ),
        ],
      ),
    );
  }
}
