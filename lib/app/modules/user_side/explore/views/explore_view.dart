import 'package:bookdianight_app/app/modules/user_side/explore/views/explore_with_map_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/resources/common_widget/custom_app_bar.dart';
import '../../../../core/resources/common_widget/custom_text.dart';
import '../../../../core/resources/common_widget/custom_text_field.dart';
import '../../club_details_view/views/club_details_view.dart';
import '../../home/controllers/club_controller.dart' show ClubController;
import '../sheets/explore_filter_sheet.dart';
import '../widget/club_event_card.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ClubController());

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const CustomAppBar(
        title: "Explore",
        centerTitle: true,
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          // Search Bar & Filter Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    hint: "Search clubs, events, lounges...",
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    fillColor: Colors.white.withOpacity(0.05),
                    filled: true,
                    isBorder: false,
                    borderRadius: 15,
                  ),
                ),
                const SizedBox(width: 15),
                // Filter Button
                GestureDetector(
                  onTap: () => Get.bottomSheet(
                    const FilterBottomSheet(),
                    isScrollControlled: true,
                  ),
                  child: Container(
                    height: 55,
                    width: 55,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE1B144),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.tune_rounded, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Venue Found & Toggle Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomText(
                      text: "6 ",
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                      text: "venues found",
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ],
                ),
                // List/Map View Toggle
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          _buildToggleButton(
                            Icons.list_rounded,
                            true,(){},
                          ),
                          _buildToggleButton(
                            Icons.map_outlined,
                            false,
                                () {
                              Get.to(() => const MapOverviewScreen());
                                },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Explore List
          Expanded(
            child: Obx(() => ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              itemCount: controller.tonightClubs.length,
              separatorBuilder: (_, __) => const SizedBox(height: 25),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Get.to(() => const ClubDetailsView()),
                  child: ClubEventCard(
                    club: controller.tonightClubs[index],
                  ),
                );
              },
            )),
          ),
        ],
      ),
    );
  }

  // Toggle button internal helper
  Widget _buildToggleButton(IconData icon, bool isActive, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isActive ? Colors.white.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: isActive ? Colors.white : Colors.grey,
          size: 20,
        ),
      ),
    );
  }
}