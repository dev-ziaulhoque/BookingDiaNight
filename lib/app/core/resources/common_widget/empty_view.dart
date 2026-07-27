import 'package:flutter/material.dart';
import '../../extentions/theme_extention.dart';
import '../common_style/extention.dart';
import '../common_style/responsive_helper.dart';
import 'custom_text.dart';

class EmptyView extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;
  final String? buttonText;
  final VoidCallback? onRetry;
  final double? height;

  const EmptyView({
    super.key,
    this.title = "No Data Found",
    this.message = "It seems there is nothing to show here right now.",
    this.icon = Icons.search_off_rounded,
    this.buttonText,
    this.onRetry,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: context.s.mob(30)),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // --- Icon with Glow Effect ---
          Container(
            height: context.s.mob(100),
            width: context.s.mob(100),
            decoration: BoxDecoration(
              color: context.cardColor, // Dark Brown
              shape: BoxShape.circle,
              border: Border.all(
                color: context.primaryColor.withOpacity(0.3), // Faint Gold Border
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: context.primaryColor.withOpacity(0.1),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Icon(
              icon,
              size: context.s.mob(40),
              color: context.primaryColor, // Gold Icon
            ),
          ),

          24.heightBox,

          // --- Title ---
          CustomText(
            text: title,
            fontSize: context.s.mt(18, 22),
            fontWeight: FontWeight.bold,
            color: context.textColor,
            textAlign: TextAlign.center,
          ),

          8.heightBox,

          // --- Message ---
          CustomText(
            text: message,
            fontSize: context.s.mt(14, 16),
            fontWeight: FontWeight.w400,
            color: context.textSecondary, // Grey Text
            textAlign: TextAlign.center,
            height: 1.5,
          ),

          // --- Action Button (Optional) ---
          if (onRetry != null && buttonText != null) ...[
            30.heightBox,
            InkWell(
              onTap: onRetry,
              borderRadius: BorderRadius.circular(30),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: context.s.mob(30),
                  vertical: context.s.mob(12),
                ),
                decoration: BoxDecoration(
                  gradient: context.buttonGradient, // Gold Gradient
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: context.buttonShadow,
                ),
                child: CustomText(
                  text: buttonText!,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: context.s.mob(14),
                ),
              ),
            ),
          ]
        ],
      ),
    );
  }
}