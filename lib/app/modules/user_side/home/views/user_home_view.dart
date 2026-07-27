import 'package:bookdianight_app/app/modules/user_side/home/views/see_all_popular_club_view.dart';
import 'package:bookdianight_app/app/modules/user_side/home/views/tonight_near_you_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import '../../../../core/resources/common_widget/custom_network_image.dart';
import '../../../../core/resources/common_widget/custom_text.dart';
import '../../../../core/resources/common_widget/custom_text_field.dart';
import '../../explore/widget/club_event_card.dart';
import '../controllers/club_controller.dart';
import '../widgets/club_list_tile.dart';
import '../widgets/home_reuseble.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ClubController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _buildHeader(),
              const SizedBox(height: 25),


              CustomTextField(
                hint: "Search clubs, events, lounges...",
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                fillColor: Colors.white.withOpacity(0.05),
                filled: true,
                isBorder: false,
                borderRadius: 15,
              ),
              const SizedBox(height: 25),

              /// Tonight Near You
              CommonComponents.sectionHeader(
                "🌙 Tonight near you",
                () => Get.to(() => const TonightNearYouView()),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 300,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.tonightClubs.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 15),
                  itemBuilder: (context, index) => ClubEventCard(
                    club: controller.tonightClubs[index],
                    width: 280,
                  ),
                ),
              ),
              const SizedBox(height: 25),


              /// Popular Clubs
              CommonComponents.sectionHeader("🔥 Popular clubs", () {
                Get.to(() => const SeeAllPopularClubView());
              }),
              const SizedBox(height: 15),

              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.popularClubs.length,
                separatorBuilder: (_, __) => const SizedBox(height: 15),
                itemBuilder: (context, index) =>
                    ClubListTile(club: controller.popularClubs[index]),
              ),
              const SizedBox(height: 25),


              CommonComponents.sectionHeader("👑 VIP table deals", () {}),
              const SizedBox(height: 15),


              _buildVipBanner(),
              const SizedBox(height: 100),


            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: "Hi, Lorengo", fontSize: 14, color: Colors.grey),
            CustomText(
              text: "Let’s find various clubs\naround you!",
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ],
        ),
        const CircleAvatar(
          backgroundColor: Colors.white10,
          child: Icon(Icons.notifications_none, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildVipBanner() {
    return Stack(
      children: [
        CustomNetworkImage(
          imageUrl:
              "https://images.unsplash.com/photo-1470225620780-dba8ba36b745",
          height: 180,
          width: double.infinity,
          borderRadius: BorderRadius.circular(20),
        ),
        Positioned(
          bottom: 20,
          left: 15,
          right: 15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Reserve your VIP table",
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  CustomText(
                    text: "From \$65/night",
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    CustomText(
                      text: "Explore Table",
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    Icon(Icons.arrow_forward, size: 14, color: Colors.white),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
