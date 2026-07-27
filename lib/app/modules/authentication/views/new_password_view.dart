import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/resources/app_assets/app_assets.dart';
import '../../../core/resources/common_widget/custom_button.dart';
import '../../../core/resources/common_widget/custom_text.dart';
import '../../../core/resources/common_widget/custom_text_field.dart';
import '../../../core/resources/common_widget/gradient_scaffold.dart';
import '../controllers/forgot_password_controller.dart';

class NewPasswordView extends StatelessWidget {
  const NewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final ForgotPasswordController controller = Get.find();
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
                text: "New Password",
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              CustomText(
                text: "New password must different from previous",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white.withOpacity(0.6),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              // --- New Password Field ---
              CustomTextField(
                controller: controller.newPasswordController,
                label: "New Password",
                hint: "••••••••",
                labelColor: Colors.white,
                hintColor: Colors.white.withOpacity(0.4),
                filled: true,
                isBorder: false,
                obscureText: true,
                borderRadius: 12.0,
              ),
              const SizedBox(height: 20),
              // --- Confirm Password Field ---
              CustomTextField(
                controller: controller.confirmPasswordController,
                label: "Confirm Password",
                hint: "••••••••",
                labelColor: Colors.white,
                hintColor: Colors.white.withOpacity(0.4),
                filled: true,
                isBorder: false,
                obscureText: true,
                borderRadius: 12.0,
              ),
              const SizedBox(height: 32),
              // --- Confirm Button ---
              CustomButton(
                title: "Confirm",
                titleColor: Colors.white,
                fontSize: 16,
                borderRadius: 12.0,
                onTap: controller.confirmNewPassword,
              ),
            ],
          ),
        ),
      ),
    );
  }
}