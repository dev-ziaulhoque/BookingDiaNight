import 'package:bookdianight_app/app/modules/user_side/dashboard/user_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bookdianight_app/app/core/resources/common_widget/custom_button.dart';
import 'package:bookdianight_app/app/core/resources/common_widget/custom_text.dart';

import '../../core/resources/app_assets/app_assets.dart';
import '../authentication/views/login_view.dart';

class OnboardingModel {
  final String image;
  final String title;
  final String description;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<OnboardingModel> _onboardingData = [
    OnboardingModel(
      image: AppAssets.onboardingOne,
      title: "Find the Hottest\nEvents Near You",
      description: "Book exclusive club nights, festivals, VIP tables, and private parties all in one place.",
    ),
    OnboardingModel(
      image: AppAssets.onboardingTwo,
      title: "Events Tailored to\nYour Own Style",
      description: "Get personalized recommendations based on your interests and past experiences.",
    ),
    OnboardingModel(
      image: AppAssets.onboardingThree,
      title: "Earn Rewards Every\nTime You Go Out",
      description: "Collect points, access exclusive offers, and enjoy premium perks through our membership plans.",
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemCount: _onboardingData.length,
            itemBuilder: (context, index) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    _onboardingData[index].image,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(1.0),
                          Colors.black.withOpacity(0.8),
                          Colors.black.withOpacity(0.0),
                        ],
                        stops: const [0.0, 0.4, 0.8],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    right: 20,
                    bottom: 180,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          AppAssets.appLogo,
                          width: 80,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 16),
                        CustomText(
                          text: _onboardingData[index].title,
                          fontSize: 34,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          height: 1.1,
                        ),
                        const SizedBox(height: 12),
                        CustomText(
                          text: _onboardingData[index].description,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(0.8),
                          maxLine: 3,
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: List.generate(
                            _onboardingData.length,
                                (dotIndex) => _buildDot(dotIndex),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Column(
              children: [
                CustomButton(
                  title: _currentIndex == _onboardingData.length - 1 ? "Get Started" : "Next",
                  titleColor: Colors.white,
                  onTap: () {
                    if (_currentIndex < _onboardingData.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    } else {
                      Get.to(() => const LoginView());
                    }
                  },
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const UserDashboard());
                  },
                  child: Container(
                    color: Colors.transparent,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const CustomText(
                      text: "Continue as a Guest",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.only(right: 8),
      height: 8,
      width: _currentIndex == index ? 24 : 8,
      decoration: BoxDecoration(
        color: _currentIndex == index
            ? const Color(0xFFC88E02)
            : Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}