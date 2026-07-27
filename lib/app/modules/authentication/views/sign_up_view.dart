import 'package:bookdianight_app/app/core/resources/app_colors/App_Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/resources/app_assets/app_assets.dart';
import '../../../core/resources/common_widget/custom_button.dart';
import '../../../core/resources/common_widget/custom_drop_down_widget.dart';
import '../../../core/resources/common_widget/custom_text.dart';
import '../../../core/resources/common_widget/custom_text_field.dart';
import '../../../core/resources/common_widget/gradient_scaffold.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpController controller = Get.put(SignUpController());
    return GradientScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              // --- Logo ---
              Image.asset(
                AppAssets.appLogo,
                height: 80,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 24),

              // --- Title & Subtitle ---
              const CustomText(
                text: "Create Your New Account",
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              CustomText(
                text: "Register now and explore the world your way",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white.withOpacity(0.6),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              // --- Role Dropdown ---
              Obx(() => CustomDropDownWidget(
                label: "Role",
                hintText: "Select Role",
                items: controller.roles,
                selectedValue: controller.selectedRole.value,
                labelColor: Colors.white,
                hintColor: Colors.white.withOpacity(0.4),
                filled: true,
                isBorder: false,
                borderRadius: 12.0,
                dropDownColor: const Color(0xFF1A1A1A),
                textStyle: const TextStyle(color: Colors.white, fontSize: 14),
              )),
              const SizedBox(height: 20),

              // --- Name Field ---
              CustomTextField(
                controller: controller.nameController,
                label: "Name",
                hint: "Enter name",
                labelColor: Colors.white,
                hintColor: Colors.white.withOpacity(0.4),
                filled: true,
                isBorder: false,
                borderRadius: 12.0,
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 20),

              // --- Email Field ---
              CustomTextField(
                controller: controller.emailController,
                label: "Email",
                hint: "Enter email",
                labelColor: Colors.white,
                hintColor: Colors.white.withOpacity(0.4),
                filled: true,
                isBorder: false,
                borderRadius: 12.0,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),

              // --- Phone Number Field ---
              CustomTextField(
                controller: controller.phoneController,
                label: "Phone Number",
                hint: "e.g +1 213 555-0123.",
                labelColor: Colors.white,
                hintColor: Colors.white.withOpacity(0.4),
                filled: true,
                isBorder: false,
                borderRadius: 12.0,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20),

              // --- Location Field ---
              CustomTextField(
                controller: controller.locationController,
                label: "Location",
                hint: "Enter location",
                labelColor: Colors.white,
                hintColor: Colors.white.withOpacity(0.4),
                filled: true,
                isBorder: false,
                borderRadius: 12.0,
                keyboardType: TextInputType.streetAddress,
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

              // --- Sign Up Button ---
              CustomButton(
                title: "Sign Up",
                titleColor: Colors.white,
                fontSize: 16,
                borderRadius: 12.0,
                onTap: controller.signUp,
              ),
              const SizedBox(height: 24),

              // --- Sign In Text ---
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Already have an account? ",
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.8),
                  ),
                  GestureDetector(
                    onTap: controller.goToSignIn,
                    child: const CustomText(
                      text: "Sign In",
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