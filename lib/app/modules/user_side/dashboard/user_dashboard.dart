import 'package:bookdianight_app/app/core/extentions/theme_extention.dart';
import 'package:bookdianight_app/app/core/resources/app_assets/app_assets.dart';
import 'package:bookdianight_app/app/modules/profile/views/profile_view.dart';
import 'package:bookdianight_app/app/modules/user_side/favorite/views/favorite_clube_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/resources/common_widget/custom_text.dart';
import '../booking/views/my_booking_view.dart';
import '../explore/views/explore_view.dart';
import '../home/views/user_home_view.dart';

class UserDashboard extends StatelessWidget {
  const UserDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserDashboardController());

    final List<Widget> screens = [
      const HomeScreen(),
      const ExploreView(),
      const MyBookingsView(),
      const FavoriteClubeView(),
      const ProfileView(),
    ];

    final List<String> activeIcons = [
      AppAssets.navHomeActive,
      AppAssets.navExploreActive,
      AppAssets.navBookingActive,
      AppAssets.navFavoriteActive,
      AppAssets.navProfileActive,
    ];
    final List<String> inactiveIcons = [
      AppAssets.navHomeInactive,
      AppAssets.navExploreInactive,
      AppAssets.navBookingInactive,
      AppAssets.navFavoriteInactive,
      AppAssets.navProfileInactive,
    ];

    final List<String> labels = [
      'Home',
      'Explore',
      'Booking',
      'Favourite',
      'Profile',
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Obx(() => screens[controller.selectedIndex.value]),

          // Custom Bottom Navigation Bar
          Positioned(
            left: 20,
            right: 20,
            bottom: 30,
            child: Obx(
              () => Container(
                height: 70,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFF0D0D0D),
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(activeIcons.length, (index) {
                    bool isSelected = controller.selectedIndex.value == index;
                    return GestureDetector(
                      onTap: () => controller.selectedIndex.value = index,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 100),
                        padding: EdgeInsets.symmetric(
                          horizontal: isSelected ? 15 : 10,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          gradient: isSelected ? context.navbarGradient : null,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              isSelected
                                  ? activeIcons[index]
                                  : inactiveIcons[index],
                              color: isSelected
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.6),
                              width: isSelected ? 22 : 20,
                            ),
                            if (isSelected) ...[
                              const SizedBox(width: 5),
                              CustomText(
                                text: labels[index],
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserDashboardController extends GetxController {
  var selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments is int) {
      selectedIndex.value = Get.arguments;
    }
  }

  Future<bool> onBackPress() async {
    if (selectedIndex.value != 0) {
      selectedIndex.value = 0;
      return false;
    }
    return true;
  }
}
