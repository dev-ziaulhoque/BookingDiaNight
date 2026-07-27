import 'package:flutter/material.dart';

import '../resources/common_style/extention.dart';
import '../resources/common_widget/custom_text.dart';

class EmptyWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const EmptyWidget({
    super.key,
    this.title = "No Data Found",
    this.subtitle = "There are no items to display at this moment.",
    this.icon = Icons.folder_open_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 80,
              color: Colors.grey.withOpacity(0.5),
            ),
            20.heightBox,
            CustomText(
              text: title,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            ),
            8.heightBox,
            CustomText(
              text: subtitle,
              fontSize: 14,
              textAlign: TextAlign.center,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}