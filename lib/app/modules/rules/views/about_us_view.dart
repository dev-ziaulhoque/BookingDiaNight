import 'package:flutter/material.dart';
import '../../../core/resources/common_widget/build_app_bar.dart';
import '../../../core/resources/common_widget/gradient_scaffold.dart';
import '../widget/section_test.dart';
import '../widget/section_title.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildAppBar(title: 'About Us'),
          const SizedBox(height: 16),

          /// -------- About Us Content --------
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionTitle(title: 'Who We Are'),
                  SectionTest(
                    text:
                    'We are passionate about organizing and managing skating events, providing a seamless experience for participants and organizers.',
                  ),

                  const SizedBox(height: 16),

                  SectionTitle(title: 'Our Mission'),
                  SectionTest(
                    text:
                    'Our mission is to promote skating culture by offering a reliable platform for event management, registration, and updates.',
                  ),

                  const SizedBox(height: 16),

                  SectionTitle(title: 'What We Offer'),
                  SectionTest(
                    text:
                    'From event discovery to participant management, our app simplifies the entire skating event journey.',
                  ),

                  const SizedBox(height: 16),

                  SectionTitle(title: 'Why Choose Us'),
                  SectionTest(
                    text:
                    'We focus on user-friendly design, secure data handling, and continuous improvements based on user feedback.',
                  ),

                  const SizedBox(height: 16),

                  SectionTitle(title: 'Our Community'),
                  SectionTest(
                    text:
                    'We believe in building a strong skating community where athletes, organizers, and fans can connect.',
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
