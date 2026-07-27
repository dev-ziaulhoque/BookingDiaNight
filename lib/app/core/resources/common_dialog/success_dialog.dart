import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_colors/App_Colors.dart';
import 'custom_success_dialog_widget.dart';

class SuccessDialog {
  void showCustomPaymentSuccessDialog({
    required String title,
    required String subtitle,
    required String buttonText,
    required VoidCallback onButtonTap,
    required String lottieAsset,
    Color? successColor,
    bool autoDismiss = false,
    int autoDismissSeconds = 3,
    required BuildContext context,
  }) {
    Get.dialog(
      CustomPaymentSuccessDialog(
        title: title,
        subtitle: subtitle,
        buttonText: buttonText,
        onButtonTap: onButtonTap,
        lottieAsset: lottieAsset,
        successColor: successColor ?? AppColors.primaryColor(context),
        autoDismiss: autoDismiss,
        autoDismissSeconds: autoDismissSeconds,
      ),
      barrierDismissible: false,
    );
  }
}