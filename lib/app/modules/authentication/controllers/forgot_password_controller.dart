import 'package:bookdianight_app/app/modules/authentication/views/login_view.dart';
import 'package:bookdianight_app/app/modules/authentication/views/otp_verification_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bookdianight_app/app/core/routes/app_routes.dart';

import '../../../core/utils/custom_snack_bar.dart';

class ForgotPasswordController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // Forgot Password Screen Logic
  void sendCode() {
    String email = emailController.text.trim();
    if (email.isEmpty || !GetUtils.isEmail(email)) {
     CustomSnackBar.error(message:  "Please enter a valid email address.", );
      return;
    }
    print("Sending code to: $email");
    Get.to(()=> OtpVerificationView(comeFromSignUp: false,), arguments: email);
  }

  // New Password Screen Logic
  void confirmNewPassword() {
    String newPassword = newPasswordController.text;
    String confirmPassword = confirmPasswordController.text;

    if (newPassword.isEmpty || confirmPassword.isEmpty) {
      CustomSnackBar.error(message:  "Please fill in both password fields.",);
      return;
    }
    if (newPassword != confirmPassword) {
     CustomSnackBar.error(message:  "Passwords do not match.", );
      return;
    }
    if (newPassword.length < 6) {
     CustomSnackBar.error(message:  "Password must be at least 6 characters long.", );
      return;
    }
    print("New password confirmed.");
    Get.to(()=> LoginView());
  }

  @override
  void onClose() {
    emailController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}