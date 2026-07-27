import 'package:flutter/material.dart';
import '../../../core/resources/app_assets/app_assets.dart';
import '../../../core/resources/app_colors/App_Colors.dart';
import '../../../core/resources/common_style/extention.dart';
import '../../../core/resources/common_widget/custom_svg_widget.dart';
import '../../../core/resources/common_widget/custom_text.dart';
import '../../../core/extentions/theme_extention.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: context.inputColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: context.borderColor)
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.mainColor,
          child: CustomSvgWidget(
            imagePath: AppAssets.notificationIcon,
            width: 20,
            height: 20,
            color: Colors.white,
          ),
        ),
        title: CustomText(
          text: 'Ticket Purchased Successfully',
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'Ticket Purchased Successfully',
            ),
            4.heightBox,
            CustomText(
              text: '5mins ago',
              fontSize: 8,
            ),
          ],
        ),
      ),
    );
  }
}
