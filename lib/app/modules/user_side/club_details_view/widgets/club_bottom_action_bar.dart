import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/resources/common_widget/custom_button.dart';
import '../controllers/club_details_controller.dart';
import '../views/view_ticket/select_date_time_view.dart';

class ClubBottomActionBar extends StatelessWidget {
  final ClubDetailsController controller;
  final Color bgColor;
  final Color primaryColor;

  const ClubBottomActionBar({
    super.key,
    required this.controller,
    required this.bgColor,
    required this.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            color: bgColor,
            border: Border(
              top: BorderSide(color: Colors.white.withOpacity(0.05)),
            ),
          ),
          child: SafeArea(
            top: false,
            child: Row(
              children: [
                Obx(() => GestureDetector(
                  onTap: controller.toggleFavorite,
                  child: Container(
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E1E1E),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      controller.isFavorite.value ? Icons.favorite : Icons.favorite_border,
                      color: controller.isFavorite.value ? Colors.red : Colors.white,
                      size: 24,
                    ),
                  ),
                )),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomButton(
                    title: 'Get A Ticket',
                    isGradient: false,
                    buttonColor: primaryColor,
                    titleColor: Colors.white,
                    paddingVertical: 14,
                    borderRadius: 16,
                    onTap: () {
                      Get.to(() => const SelectDateTimeView());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}