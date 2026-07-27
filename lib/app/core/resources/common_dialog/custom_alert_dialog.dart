import 'dart:ui';
import 'package:flutter/material.dart';
import '../../extentions/theme_extention.dart';
import '../common_widget/custom_text.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String body;
  final IconData? icon;
  final ImageProvider? image;
  final Gradient? iconGradient;
  final Color? iconBackgroundColor;

  // Styling
  final Color? cardColor;
  final String primaryButtonText;
  final Color primaryButtonColor;
  final String secondaryButtonText;
  final Color secondaryButtonColor;
  final Color closeIconColor;
  final double blurSigma;
  final double overlayOpacity;

  // Actions
  final VoidCallback? onPrimaryPressed;
  final VoidCallback? onSecondaryPressed;

  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.body,
    this.icon,
    this.image,
    this.iconGradient,
    this.iconBackgroundColor,
    this.cardColor,
    this.primaryButtonText = 'Confirm',
    this.primaryButtonColor = const Color(0xFFFE5F75),
    this.secondaryButtonText = 'Cancel',
    this.secondaryButtonColor = const Color(0xFF4A4A4A),
    this.closeIconColor = Colors.orange,
    this.blurSigma = 10.0,
    this.overlayOpacity = 0.4,
    this.onPrimaryPressed,
    this.onSecondaryPressed,
  });

  // Static show method
  static Future<void> show({
    required BuildContext context,
    required String title,
    required String body,
    IconData? icon,
    ImageProvider? image,
    Gradient? iconGradient,
    Color? iconBackgroundColor,
    Color? cardColor,
    String primaryButtonText = 'Confirm',
    Color primaryButtonColor = const Color(0xFFFE5F75),
    String secondaryButtonText = 'Cancel',
    Color secondaryButtonColor = const Color(0xFF4A4A4A),
    Color closeIconColor = Colors.orange,
    double blurSigma = 5.0,
    double overlayOpacity = 0.4,
    VoidCallback? onPrimaryPressed,
    VoidCallback? onSecondaryPressed,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => CustomAlertDialog(
        title: title,
        body: body,
        icon: icon,
        image: image,
        iconGradient: iconGradient,
        iconBackgroundColor: iconBackgroundColor,
        cardColor: cardColor,
        primaryButtonText: primaryButtonText,
        primaryButtonColor: primaryButtonColor,
        secondaryButtonText: secondaryButtonText,
        secondaryButtonColor: secondaryButtonColor,
        closeIconColor: closeIconColor,
        blurSigma: blurSigma,
        overlayOpacity: overlayOpacity,
        onPrimaryPressed: onPrimaryPressed,
        onSecondaryPressed: onSecondaryPressed,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool hasIconOrImage = icon != null || image != null;
    return Stack(
      children: [
        // Blur Background
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
          child: Container(
            color: Colors.black.withOpacity(overlayOpacity),
          ),
        ),

        // Dialog Card
        Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              margin: const EdgeInsets.all(30),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: BoxDecoration(
                color: context.cardColor,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Close Button
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(Icons.close, color: closeIconColor, size: 28),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  const SizedBox(height: 5),
                  // Icon or Image
                  if (hasIconOrImage) ...[
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: iconGradient,
                        color: iconGradient == null
                            ? (iconBackgroundColor ?? primaryButtonColor)
                            : null,
                        image: image != null
                            ? DecorationImage(
                          image: image!,
                          fit: BoxFit.cover,
                        )
                            : null,
                      ),
                      child: icon != null
                          ? Icon(
                        icon,
                        size: 40,
                        color: Colors.white,
                      )
                          : null,
                    ),
                    const SizedBox(height: 12),
                  ],

                  // Title
                  CustomText(
                    text: title,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),

                  // Body
                  CustomText(
                    text: body,
                    fontSize: 14,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),

                  // Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          onPrimaryPressed?.call();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryButtonColor,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          elevation: 4,
                        ),
                        child: Text(
                          primaryButtonText,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          onSecondaryPressed?.call();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: secondaryButtonColor,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          elevation: 4,
                        ),
                        child: Text(
                          secondaryButtonText,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}