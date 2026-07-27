import 'package:flutter/material.dart';
import '../resources/common_widget/custom_text.dart';
import 'global_key.dart';

class CustomSnackBar {

  static void success({required String message}) {
    _showSnackBar(
      message: message,
      backgroundColor: const Color(0xFF2D6A4F),
      icon: Icons.check_circle_outline,
    );
  }

  static void error({required String message}) {
    _showSnackBar(
      message: message,
      backgroundColor: const Color(0xFFD90429),
      icon: Icons.error_outline,
    );
  }

  static void warning({required String message}) {
    _showSnackBar(
      message: message,
      backgroundColor: const Color(0xFFFFB703),
      icon: Icons.warning_amber_rounded,
      textColor: Colors.black87,
    );
  }

  // প্রাইভেট মেথড (Context লাগছে না)
  static void _showSnackBar({
    required String message,
    required Color backgroundColor,
    required IconData icon,
    Color textColor = Colors.white,
  }) {
    // currentState নাল কি না চেক করা হচ্ছে
    if (scaffoldMessengerKey.currentState == null) return;

    // আগের স্ন্যাকবার রিমুভ করা
    scaffoldMessengerKey.currentState!.hideCurrentSnackBar();

    // নতুন স্ন্যাকবার দেখানো
    scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(20),
        duration: const Duration(seconds: 3),
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(icon, color: textColor, size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: CustomText(
                  text: message,
                  color: textColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  maxLine: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}