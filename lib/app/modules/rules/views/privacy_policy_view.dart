import 'package:flutter/material.dart';
import '../../../core/resources/common_widget/build_app_bar.dart';
import '../../../core/resources/common_widget/custom_app_bar.dart';
import '../../../core/resources/common_widget/gradient_scaffold.dart';
import '../../../core/utils/resource_const.dart';
import '../widget/section_test.dart';
import '../widget/section_title.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(title: 'Privacy Policy'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(title: 'Introduction'),
            SectionTest(
              text:
                  'This Privacy Policy explains how we collect, use, and protect your personal information when you use our application.',
            ),

            SizedBox(height: 16),

            SectionTitle(title: 'Information We Collect'),
            SectionTest(
              text:
                  'We may collect personal information such as your name, email address, profile image, and usage data to improve user experience.',
            ),

            SizedBox(height: 16),

            SectionTitle(title: 'How We Use Your Information'),
            SectionTest(
              text:
                  'Your information is used to provide and improve our services, personalize your experience, and communicate important updates.',
            ),

            SizedBox(height: 16),

            SectionTitle(title: 'Data Security'),
            SectionTest(
              text:
                  'We take appropriate security measures to protect your data against unauthorized access, alteration, or disclosure.',
            ),

            SizedBox(height: 16),

            SectionTitle(title: 'Third-Party Services'),
            SectionTest(
              text:
                  'We may use third-party services that collect information to help us analyze and improve our application.',
            ),

            SizedBox(height: 16),

            SectionTitle(title: 'Changes to This Policy'),
            SectionTest(
              text:
                  'We may update this Privacy Policy from time to time. Any changes will be posted on this page.',
            ),

            SizedBox(height: 16),

            SectionTitle(title: 'Contact Us'),
            SectionTest(
              text:
                  'If you have any questions or concerns about this Privacy Policy, please contact us through the app.',
            ),

            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
