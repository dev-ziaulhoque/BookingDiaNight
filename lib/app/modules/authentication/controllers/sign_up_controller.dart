import 'package:bookdianight_app/app/core/utils/custom_snack_bar.dart';
import 'package:bookdianight_app/app/modules/authentication/views/otp_verification_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  // টেক্সট কন্ট্রোলার সমূহ
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // Role Dropdown এর জন্য
  final List<String> roles = ['User', 'Club Owner'];
  var selectedRole = 'User'.obs;

  // সাইন আপ অ্যাকশন
  void signUp() {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String phone = phoneController.text.trim();
    String location = locationController.text.trim();
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;

    if (name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      CustomSnackBar.error(message: "Please fill all required fields");
      return;
    }

    if (password != confirmPassword) {
      CustomSnackBar.error(message: "Passwords do not match");
      return;
    }

    Get.to(()=> OtpVerificationView(comeFromSignUp: true,));

    // TODO: API Call for Sign Up
    print("Sign Up Triggered for: $email as ${selectedRole.value}");
  }


  void goToSignIn() {
    Get.back();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    locationController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}