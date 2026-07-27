import 'package:bookdianight_app/app/core/resources/app_colors/App_Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/resources/app_assets/app_assets.dart';
import '../../../core/resources/common_widget/custom_button.dart';
import '../../../core/resources/common_widget/custom_checkbox.dart';
import '../../../core/resources/common_widget/custom_text.dart';
import '../../../core/resources/common_widget/custom_text_field.dart';
import '../../../core/resources/common_widget/gradient_scaffold.dart';
import '../controllers/sign_in_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
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
                text: "Sign in to your Account",
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              CustomText(
                text: "Enter your email and password to log in",
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
              ),
              const SizedBox(height: 20),

              // --- Password Field ---
              CustomTextField(
                controller: controller.passwordController,
                label: "Password",
                hint: "••••••••",
                labelColor: Colors.white,
                hintColor: Colors.white.withOpacity(0.4),
                filled: true,
                isBorder: false,
                obscureText: true,
                borderRadius: 12.0,
              ),
              const SizedBox(height: 16),

              // --- Remember Me & Forgot Password ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() => CustomCheckBox(
                    title: "Remember me",
                    isChecked: controller.isRememberMe.value,
                    activeColor: AppColors.mainColor,
                    inactiveColor: Colors.white,
                    textColor: Colors.white,
                    borderWidth: 1.5,
                    fontSize: 13,
                    onChanged: (value) {
                      controller.toggleRememberMe(value);
                    },
                  )),
                  GestureDetector(
                    onTap: controller.goToForgotPassword,
                    child: const CustomText(
                      text: "Forgot Password ?",
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.mainColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // --- Login Button ---
              CustomButton(
                title: "Login",
                titleColor: Colors.white,
                fontSize: 16,
                borderRadius: 12.0,
                onTap: controller.login,
              ),
              const SizedBox(height: 30),

              // --- Sign in with Divider ---
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.white.withOpacity(0.2),
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: CustomText(
                      text: "Sign in with",
                      fontSize: 13,
                      color: Colors.white.withOpacity(0.6),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.white.withOpacity(0.2),
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // --- Google Login Button ---
              CustomButton(
                title: "",
                buttonColor: const Color(0xFF151515),
                isGradient: false,
                borderRadius: 12.0,
                onTap: controller.continueWithGoogle,
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppAssets.googleIcon),
                    const SizedBox(width: 12),
                    const CustomText(
                      text: "Continue with Google",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // --- Apple Login Button ---
              CustomButton(
                title: "",
                buttonColor: const Color(0xFF151515),
                isGradient: false,
                borderRadius: 12.0,
                onTap: controller.continueWithApple,
                widget: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.apple,
                      color: Colors.white,
                      size: 28,
                    ),
                    SizedBox(width: 8),
                    CustomText(
                      text: "Continue with Apple",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // --- Sign Up Text ---
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Don't have an account? ",
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.8),
                  ),
                  GestureDetector(
                    onTap: controller.goToSignUp,
                    child: const CustomText(
                      text: "Sign Up",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.mainColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}