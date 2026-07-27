import 'package:flutter/material.dart';
import 'package:bookdianight_app/app/core/resources/app_colors/App_Colors.dart';
import 'package:bookdianight_app/app/core/extentions/theme_extention.dart';

Future<DateTime?> showCustomDatePicker(
    BuildContext context, {
      DateTime? initialDate,
      String? title,
    }) async {
  final now = DateTime.now();
  initialDate ??= now;
  return await showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
    helpText: title ?? "Select date",
    cancelText: "Cancel",
    confirmText: "OK",
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.dark(
            primary: AppColors.mainColor,
            onPrimary: Colors.white,
            surface: const Color(0xFF1A1A2E),
            onSurface: Colors.white,
            secondary: AppColors.mainColor,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: context.cardColor,
              textStyle: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          // হেডার টেক্সট স্টাইল
          textTheme: const TextTheme(
            headlineMedium: TextStyle(color: Colors.white),
            labelLarge: TextStyle(color: Colors.white70),
          ), dialogTheme: DialogThemeData(backgroundColor: Colors.transparent),
        ),
        child: child!,
        /*child: Stack(
          children: [
            // পুরো ডায়ালগে gradient background
            Positioned(
              child: Container(
                decoration: BoxDecoration(
                  gradient: context.primaryGradient,
                ),
              ),
            ),
            child!,
          ],
        ),*/
      );
    },
  );
}