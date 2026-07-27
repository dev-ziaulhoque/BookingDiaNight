import 'package:bookdianight_app/app/core/extentions/theme_extention.dart';
import 'package:bookdianight_app/app/core/resources/app_colors/App_Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/resources/app_assets/app_assets.dart';
import '../../../core/resources/common_widget/custom_button.dart';
import '../../../core/resources/common_widget/custom_text.dart';
import '../../../core/resources/common_widget/gradient_scaffold.dart';
import '../controllers/otp_verification_controller.dart';

class OtpVerificationView extends StatelessWidget {
  final bool? comeFromSignUp;
  const OtpVerificationView({super.key, this.comeFromSignUp = true});

  @override
  Widget build(BuildContext context) {
    final OtpVerificationController controller = Get.put(OtpVerificationController());
    return GradientScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              // --- Logo ---
              Image.asset(
                AppAssets.appLogo,
                height: 80,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 24),
              // --- Title & Subtitle ---
              const CustomText(
                text: "Verification Code",
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              CustomText(
                text: "Please enter the code we just sent to your email",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white.withOpacity(0.6),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              // --- OTP Input Fields ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
                  return SizedBox(
                    width: 60,
                    height: 60,
                    child: TextField(
                      controller: controller.otpControllers[index],
                      focusNode: controller.otpFocusNodes[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        counterText: "",
                        filled: true,
                        fillColor: context.inputColor,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: AppColors.mainColor, width: 2),
                        ),
                      ),
                      onChanged: (value) => controller.onOtpDigitChanged(value, index),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 24),
              // --- Resend Code & Timer ---
              Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Didn't receive OTP? ",
                    fontSize: 13,
                    color: Colors.white.withOpacity(0.6),
                  ),
                  controller.canResend.value
                      ? GestureDetector(
                    onTap: controller.resendCode,
                    child: const CustomText(
                      text: "Resend Code",
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.mainColor,
                    ),
                  )
                      : CustomText(
                    text: "Resend in ${controller.remainingSeconds.value}s",
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.mainColor.withOpacity(0.7),
                  ),
                ],
              )),
              const SizedBox(height: 32),
              // --- Verify Button ---
              CustomButton(
                title: "Verify",
                titleColor: Colors.white,
                fontSize: 16,
                borderRadius: 12.0,
                onTap: () => controller.verifyOtp(comeFromSignUp ?? true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}