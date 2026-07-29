import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/controllers/club_controller.dart';
import '../controllers/club_details_controller.dart';
import '../widgets/club_bottom_action_bar.dart';
import '../widgets/club_info_section.dart';
import '../widgets/club_sliver_app_bar.dart';
import '../widgets/club_tab_content.dart';

class ClubDetailsView extends StatelessWidget {
  final ClubModel clubModel;
  final bool? isFavorite;
  const ClubDetailsView({super.key, this.isFavorite, required this.clubModel});

  @override
  Widget build(BuildContext context) {
    final ClubDetailsController controller = Get.put(
      ClubDetailsController(clubModel: clubModel),
      tag: clubModel.title,
    );

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
        isFavorite: isFavorite,
      ),

      body: CustomScrollView(
        slivers: [
          // Header Cover Image
          ClubSliverAppBar(
            imageUrl: clubModel.image,
            bgColor: bgColor,
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Info Section (Title, Price, Ratings)
                  ClubInfoSection(
                    title: clubModel.title,
                    rating: clubModel.rating,
                    reviewsCount: '(256)',
                    price: clubModel.price,
                    primaryColor: primaryYellow,
                    textGrey: textGrey,
                    type: clubModel.type,
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

                // Dynamic Tab Content by Tab Name
                Obx(() {
                  String currentTab = controller.tabs[controller.selectedTabIndex.value];
                  switch (currentTab) {
                    case 'About':
                      return ClubTabContent.buildAboutTab(textGrey);
                    case 'Address':
                      return ClubTabContent.buildAddressTab(cardBgColor, textGrey);
                    case 'Photos':
                      return ClubTabContent.buildPhotosTab(controller.photos);
                    case 'Tables':
                      return ClubTabContent.buildTablesTab(controller.tablePackages, primaryYellow, cardBgColor);
                    case 'Reviews':
                      return ClubTabContent.buildReviewsTab(controller.reviews, primaryYellow, textGrey);
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
