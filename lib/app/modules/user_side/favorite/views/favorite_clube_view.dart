import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/resources/common_widget/custom_app_bar.dart';
import '../../club_details_view/views/club_details_view.dart';
import '../../explore/widget/club_event_card.dart';
import '../../home/controllers/club_controller.dart';

class FavoriteClubeView extends StatelessWidget {
  const FavoriteClubeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ClubController());
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const CustomAppBar(
        title: "Favorites",
        centerTitle: true,
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
      ),
      body: Obx(() {
        if (controller.tonightClubs.isEmpty) {
          return const Center(
            child: Text(
              "No favorites items found",
              style: TextStyle(color: Colors.grey),
            ),
          );
        }
        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          itemCount: controller.tonightClubs.length,
          separatorBuilder: (_, __) => const SizedBox(height: 25),
          itemBuilder: (context, index) {
            final itemData = controller.tonightClubs[index];
            return GestureDetector(
              onTap: () {
                Get.to(()=> ClubDetailsView(
                  clubModel: itemData ,
                  isFavorite: true,
                ));
              },
              child: ClubEventCard(
                isFavoriteBadgeShow: true,
                isFavorite: true,
                club: itemData,
              ),
            );
          },
        );
      }),
    );
  }
}