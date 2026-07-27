import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/resources/app_assets/app_assets.dart';
import '../../../core/resources/app_colors/App_Colors.dart';
import '../../../core/resources/common_widget/custom_button.dart';
import '../../../core/resources/common_widget/custom_text.dart';
import '../../../core/resources/common_widget/custom_text_field.dart';
import '../../../core/resources/common_widget/gradient_scaffold.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final ForgotPasswordController controller = Get.put(ForgotPasswordController());
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
                text: "Forgot Password",
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              CustomText(
                text: "Enter your email account to reset password",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white.withOpacity(0.6),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              // --- Email Field ---
              CustomTextField(
                controller: controller.emailController,
                label: "Email",
                hint: "chine@gmail.com",
                labelColor: Colors.white,
                hintColor: Colors.white.withOpacity(0.4),
                filled: true,
                isBorder: false,
                borderRadius: 12.0,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 32),
              // --- Send Code Button ---
              CustomButton(
                title: "Send Code",
                titleColor: Colors.white,
                fontSize: 16,
                borderRadius: 12.0,
                onTap: controller.sendCode,
              ),
            ],
          ),
        ),
      ),
    );
  }
}