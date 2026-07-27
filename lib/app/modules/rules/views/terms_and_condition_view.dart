import 'package:flutter/material.dart';
import '../../../core/resources/common_widget/build_app_bar.dart';
import '../../../core/resources/common_widget/gradient_scaffold.dart';
import '../widget/section_test.dart';
import '../widget/section_title.dart';

class TermsAndConditionView extends StatelessWidget {
  const TermsAndConditionView({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildAppBar(title: 'Terms & Conditions'),
          const SizedBox(height: 16),

          /// -------- Terms & Conditions Content --------
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionTitle(title: 'Acceptance of Terms'),
                  SectionTest(
                    text:
                    'By using our application, you agree to comply with these Terms and Conditions.',
                  ),

                  const SizedBox(height: 16),

                  SectionTitle(title: 'User Responsibilities'),
                  SectionTest(
                    text:
                    'Users are expected to provide accurate information and use the app lawfully and responsibly.',
                  ),

                  const SizedBox(height: 16),

                  SectionTitle(title: 'Prohibited Activities'),
                  SectionTest(
                    text:
                    'Any misuse of the app, including unauthorized access or disruption of services, is strictly prohibited.',
                  ),

                  const SizedBox(height: 16),

                  SectionTitle(title: 'Limitation of Liability'),
                  SectionTest(
                    text:
                    'We are not responsible for any direct or indirect damages resulting from the use of this application.',
                  ),

                  const SizedBox(height: 16),

                  SectionTitle(title: 'Changes to Terms'),
                  SectionTest(
                    text:
                    'We may update these Terms and Conditions from time to time. Updates will be posted in the app.',
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
