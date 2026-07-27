import 'package:bookdianight_app/app/core/resources/app_loader/custom_animated_loader.dart';
import 'package:bookdianight_app/app/modules/authentication/views/login_view.dart';
import 'package:bookdianight_app/app/modules/authentication/views/new_password_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

import '../../../core/utils/custom_snack_bar.dart';

class OtpVerificationController extends GetxController {
  final List<TextEditingController> otpControllers = List.generate(4, (_) => TextEditingController());
  final List<FocusNode> otpFocusNodes = List.generate(4, (_) => FocusNode());
  late Timer _timer;
  var remainingSeconds = 60.obs;
  var canResend = false.obs;

  String? email;

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments as String?;
    startTimer();
  }

  void startTimer() {
    remainingSeconds.value = 60;
    canResend.value = false;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds.value > 0) {
        remainingSeconds.value--;
      } else {
        _timer.cancel();
        canResend.value = true;
      }
    });
  }

  void resendCode() {
    if (canResend.value) {
      print("Resending code to: $email");
      startTimer();
      CustomSnackBar.success(message: "New OTP has been sent.");
    }
  }

  void verifyOtp(bool isFromSignUp) {
    String otp = otpControllers.map((c) => c.text).join();
    if (otp.length != 4) {
      CustomSnackBar.error(message: "Please enter a 4-digit OTP.");
      return;
    }
    print("Verifying OTP: $otp for email: $email");

    Get.dialog(
      const Center(child: CustomAnimationLoader()),
      barrierDismissible: false,
    );

    Future.delayed(const Duration(seconds: 2), () {
      Get.back();
      CustomSnackBar.success(message: "OTP Verified!");

      if (isFromSignUp) {
        Get.offAll(() => const LoginView());
      } else {
        Get.to(() => const NewPasswordView());
      }
    });
  }

  void onOtpDigitChanged(String value, int index) {
    if (value.length == 1 && index < otpControllers.length - 1) {
      otpFocusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      otpFocusNodes[index - 1].requestFocus();
    } else if (value.length == 1 && index == otpControllers.length - 1) {
      otpFocusNodes[index].unfocus();
    }
  }

  @override
  void onClose() {
    _timer.cancel();
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var focusNode in otpFocusNodes) {
      focusNode.dispose();
    }
    super.onClose();
  }
}