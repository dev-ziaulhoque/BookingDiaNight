import 'package:bookdianight_app/app/core/resources/app_colors/App_Colors.dart';
import 'package:bookdianight_app/app/core/resources/common_widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import '../../../core/resources/common_style/extention.dart';
import '../../../core/resources/common_widget/build_app_bar.dart';
import '../../../core/resources/common_widget/custom_text.dart';
import '../../../core/resources/common_widget/gradient_scaffold.dart';
import '../../../core/utils/resource_const.dart';
import '../controller/notification_controller.dart';
import '../widgets/notification_card.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    // Inject the controller
    final controller = Get.put(NotificationController());

    return Scaffold(
      backgroundColor: AppColors.backgroundColor(context),
      appBar: CustomAppBar(
        title: 'Notifications',
        // Example: Add your "Mark all as read" here if your CustomAppBar supports actions
        // trailing: TextButton(...)
      ),
      body: Obx(() {
        // FIX: Accessing .isEmpty or .length here tells GetX to watch this list
        if (controller.notifications.isEmpty) {
          return const Center(child: CustomText(text: "No notifications yet"));
        }

        final groups = ['Today', 'Yesterday'];

        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: groups.length,
          itemBuilder: (context, gIndex) {
            final groupName = groups[gIndex];

            // Filter list based on group
            final items = controller.notifications
                .where((n) => n.group == groupName)
                .toList();

            if (items.isEmpty) return const SizedBox.shrink();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: CustomText(
                    text: groupName,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Map through the items in this group
                ...items.map((item) => NotificationCard(
                  data: item,
                  onTap: () => controller.markAsRead(item),
                )),
              ],
            );
          },
        );
      }),
    );
  }
}
