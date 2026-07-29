import 'package:flutter/material.dart';
import '../../../core/resources/app_assets/app_assets.dart';
import '../../../core/resources/app_colors/App_Colors.dart';
import '../../../core/resources/common_style/extention.dart';
import '../../../core/resources/common_widget/custom_svg_widget.dart';
import '../../../core/resources/common_widget/custom_text.dart';
import '../../../core/extentions/theme_extention.dart';
import '../controller/notification_controller.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel data;
  final VoidCallback onTap;

  const NotificationCard({super.key, required this.data, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          // Visual cue: Change color or border if unread
            color: data.isRead ? context.inputColor : context.inputColor.withOpacity(0.7),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
                color: data.isRead ? context.borderColor : AppColors.mainColor.withOpacity(0.5)
            )
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: data.isRead ? Colors.grey : AppColors.mainColor,
              child: Image.asset(
                AppAssets.notificationIcon,
                width: 20,
                height: 20,
                color: Colors.white,
              ),
            ),
            12.widthBox,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: data.title,
                    fontWeight: data.isRead ? FontWeight.w400 : FontWeight.bold,
                    fontSize: 14,
                  ),
                  4.heightBox,
                  CustomText(
                    text: data.subtitle,
                    fontSize: 12,
                    color: data.isRead ? Colors.white60 : Colors.white,
                  ),
                  4.heightBox,
                  CustomText(
                    text: data.time,
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            // Unread dot indicator
            if (!data.isRead)
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: CircleAvatar(radius: 4, backgroundColor: AppColors.mainColor),
              )
          ],
        ),
      ),
    );
  }
}
