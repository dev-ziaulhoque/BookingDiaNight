import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/club_details_controller.dart';
import '../widgets/club_bottom_action_bar.dart';
import '../widgets/club_info_section.dart';
import '../widgets/club_sliver_app_bar.dart';
import '../widgets/club_tab_content.dart';

class ClubDetailsView extends StatelessWidget {
  const ClubDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ClubDetailsController controller = Get.put(ClubDetailsController());

    // Theme Colors
    const Color bgColor = Color(0xFF0D0D0D);
    const Color primaryYellow = Color(0xFFDCA73A);
    const Color cardBgColor = Color(0xFF1A1A1A);
    const Color textGrey = Color(0xFFA0A0A0);

    return Scaffold(
      backgroundColor: bgColor,

      // Fixed Bottom Navigation Bar Bug
      bottomNavigationBar: ClubBottomActionBar(
        controller: controller,
        bgColor: bgColor,
        primaryColor: primaryYellow,
      ),

      body: CustomScrollView(
        slivers: [
          // Header Cover Image
          const ClubSliverAppBar(
            imageUrl:
                'https://images.unsplash.com/photo-1540039155732-d688d52cb4b1',
            bgColor: bgColor,
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Info Section (Title, Price, Ratings)
                  const ClubInfoSection(
                    title: 'XOYO London',
                    rating: '4.8',
                    reviewsCount: '(256)',
                    price: '\$191.00',
                    primaryColor: primaryYellow,
                    textGrey: textGrey,
                  ),
                  const SizedBox(height: 24),

                  // Tab Selectors
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        controller.tabs.length,
                        (index) => ClubTabContent.buildTabButton(
                          title: controller.tabs[index],
                          isSelected: controller.selectedTabIndex.value == index,
                          onTap: () => controller.changeTab(index),
                          primaryColor: primaryYellow,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Dynamic Tab Content
                  Obx(() {
                    switch (controller.selectedTabIndex.value) {
                      case 0:
                        return ClubTabContent.buildAboutTab(textGrey);
                      case 1:
                        return ClubTabContent.buildAddressTab(
                          cardBgColor,
                          textGrey,
                        );
                      case 2:
                        return ClubTabContent.buildPhotosTab(controller.photos);
                      case 3:
                        return ClubTabContent.buildReviewsTab(
                          controller.reviews,
                          primaryYellow,
                          textGrey,
                        );
                      default:
                        return const SizedBox.shrink();
                    }
                  }),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
