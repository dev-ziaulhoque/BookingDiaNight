import 'package:flutter/material.dart' hide ThemeExtension;
import 'package:get/get.dart';
import '../../../core/resources/common_style/extention.dart';
import '../../../core/resources/common_widget/build_app_bar.dart';
import '../../../core/resources/common_widget/custom_button.dart';
import '../../../core/resources/common_widget/custom_text.dart';
import '../../../core/resources/common_widget/custom_text_field.dart';
import '../../../core/resources/common_widget/gradient_scaffold.dart';
import '../../../core/extentions/theme_extention.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildAppBar(title: 'Contact Us'),
          const SizedBox(height: 16),

          /// -------- Contact Form --------
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    label: 'Name',
                    hint: 'Enter your name',
                  ),
                  10.heightBox,
                  CustomTextField(
                    label: 'Email',
                    hint: 'Enter your email',
                  ),
                  10.heightBox,
                  CustomTextField(
                    label: 'Phone',
                    hint: 'Enter your phone number',
                  ),
                  10.heightBox,
                  CustomTextField(
                    label: 'Message',
                    hint: 'Enter your message',
                    maxLines: 5,
                    height: Get.height / 7,
                  ),
                  20.heightBox,
                  CustomButton(title: 'Send')
                ],
              ),
            ),
          ),

          /// -------- Contact Information (Bottom) --------
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: context.cardColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _infoRow(icon: Icons.email_outlined, text: 'support@skatingapp.com', context: context),
                5.heightBox,
                _infoRow(icon: Icons.phone_outlined, text: '+123 456 7890', context: context),
                5.heightBox,
                _infoRow(icon: Icons.location_on_outlined, text: '123 Skating Avenue, Sports City', context: context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoRow({required IconData icon, required String text, required BuildContext context}) {
    return Row(
      children: [
        Icon(icon, size: 20, color: ThemeExtension(context).iconColor),
        const SizedBox(width: 8),
        CustomText(
          text: text,
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: context.textColor,
        ),
      ],
    );
  }
}
