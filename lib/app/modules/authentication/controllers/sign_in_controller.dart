import 'package:bookdianight_app/app/core/utils/custom_snack_bar.dart';
import 'package:bookdianight_app/app/modules/authentication/views/forgot_password_view.dart';
import 'package:bookdianight_app/app/modules/authentication/views/sign_up_view.dart';
import 'package:bookdianight_app/app/modules/club_owner_side/dashboard/dashboard/owner_dashboard.dart';
import 'package:bookdianight_app/app/modules/user_side/dashboard/user_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // রিমেম্বার মি স্টেট (Observable)
  var isRememberMe = false.obs;

  // চেকবক্স টগল করার ফাংশন
  void toggleRememberMe(bool value) {
    isRememberMe.value = value;
  }

  // লগইন ফাংশন
  void login() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    // if(email.isEmpty || password.isEmpty) {
    //   CustomSnackBar.error(message:  "Please enter email and password");
    //   return;
    // }

    // Get.to(()=> UserDashboard());
    Get.to(()=> OwnerDashboard());

    print("Login Triggered with $email");
  }

  // গুগল লগইন
  void continueWithGoogle() {
    // TODO: Google Auth Logic
  }

  // অ্যাপল লগইন
  void continueWithApple() {
    // TODO: Apple Auth Logic
  }

  // সাইন-আপ পেজে যাওয়ার ফাংশন
  void goToSignUp() {
    Get.to(()=> SignUpView());
  }

  // ফরগট পাসওয়ার্ড পেজে যাওয়ার ফাংশন
  void goToForgotPassword() {
    Get.to(()=>ForgotPasswordView());
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}